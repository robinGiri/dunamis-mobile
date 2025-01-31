import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dunamis/features/auth/presentation/view_model/signup/register_bloc.dart';

class UpdateAccountView extends StatefulWidget {
  const UpdateAccountView({super.key});

  @override
  State<UpdateAccountView> createState() => _UpdateAccountViewState();
}

class _UpdateAccountViewState extends State<UpdateAccountView> {
  final _gap = const SizedBox(height: 8);
  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: 'Rob123');
  final _lnameController = TextEditingController(text: 'Giri1234');
  final _usernameController = TextEditingController(text: '_rob123');
  final _passwordController = TextEditingController(text: '12345678');

  // Check for camera permission
  Future<void> checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  Future _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          // Send image to server
          context.read<RegisterBloc>().add(
                UploadImage(file: _img!),
              );
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Student'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  return state.isLoading
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.grey[300],
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (context) => Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            checkCameraPermission();
                                            _browseImage(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.camera),
                                          label: const Text('Camera'),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            _browseImage(ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.image),
                                          label: const Text('Gallery'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: _img != null
                                      ? FileImage(_img!)
                                      : const AssetImage(
                                              'assets/images/profile.png')
                                          as ImageProvider,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                              ),
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter username';
                                }
                                return null;
                              }),
                            ),
                            _gap,
                            TextFormField(
                              controller: _fnameController,
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                              ),
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter first name';
                                }
                                return null;
                              }),
                            ),
                            _gap,
                            TextFormField(
                              controller: _lnameController,
                              decoration: const InputDecoration(
                                labelText: 'Last Name',
                              ),
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter last name';
                                }
                                return null;
                              }),
                            ),
                            _gap,
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    final registerState =
                                        context.read<RegisterBloc>().state;
                                    final imageName = registerState.imageName;
                                    context.read<RegisterBloc>().add(
                                          RegisterStudent(
                                            context: context,
                                            fName: _fnameController.text,
                                            password: _passwordController.text,
                                            lName: _lnameController.text,
                                            username: _usernameController.text,
                                            image: imageName,
                                          ),
                                        );
                                  }
                                },
                                child: const Text('Register'),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
