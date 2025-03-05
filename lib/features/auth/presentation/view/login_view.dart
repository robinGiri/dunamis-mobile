import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dunamis/features/auth/presentation/view/register_view.dart';
import 'package:dunamis/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:local_auth/local_auth.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'username');
  final _passwordController = TextEditingController(text: 'password');
  final _gap = const SizedBox(height: 8);

  // Instance of LocalAuthentication.
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<void> _authenticateWithBiometrics(BuildContext context) async {
    try {
      // Check if biometrics are available
      final bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
      if (!canCheckBiometrics) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Biometric authentication is not available.')),
        );
        return;
      }
      // Attempt biometric authentication
      final bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      if (didAuthenticate) {
        // Dispatch a login event or perform any desired action after successful thumb scan
        context.read<LoginBloc>().add(
              LoginStudentEvent(
                context: context,
                username:
                    'biometric_user', // you may want to determine this dynamically
                password:
                    '', // password may be left empty or handled differently
              ),
            );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authentication failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during authentication: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Brand Bold',
                      ),
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('username'),
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(
                                LoginStudentEvent(
                                  context: context,
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    _gap,
                    // Thumb Scan Login Button
                    ElevatedButton(
                      key: const ValueKey('thumbScanButton'),
                      onPressed: () => _authenticateWithBiometrics(context),
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login with Thumb Scan',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    _gap,
                    ElevatedButton(
                      key: const ValueKey('registerButton'),
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              NavigateRegisterScreenEvent(
                                destination: RegisterView(),
                                context: context,
                              ),
                            );
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
