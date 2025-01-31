import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:dunamis/core/common/snackbar/my_snackbar.dart';
import 'package:dunamis/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:dunamis/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:dunamis/features/batch/domain/entity/batch_entity.dart';
import 'package:dunamis/features/batch/presentation/view_model/batch_bloc.dart';
import 'package:dunamis/features/course/domain/entity/course_entity.dart';
import 'package:dunamis/features/course/presentation/view_model/course_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final BatchBloc _batchBloc;
  final CourseBloc _courseBloc;
  final RegisterUseCase _registerUseCase;
  final UploadImageUsecase _uploadImageUsecase;

  RegisterBloc({
    required BatchBloc batchBloc,
    required CourseBloc courseBloc,
    required RegisterUseCase registerUseCase,
    required UploadImageUsecase uploadImageUsecase,
  })  : _batchBloc = batchBloc,
        _courseBloc = courseBloc,
        _registerUseCase = registerUseCase,
        _uploadImageUsecase = uploadImageUsecase,
        super(RegisterState.initial()) {
    on<LoadCoursesAndBatches>(_onLoadCoursesAndBatches);
    on<RegisterStudent>(_onRegisterEvent);
    on<UploadImage>(_onLoadImage);

    add(LoadCoursesAndBatches());
  }

  void _onLoadCoursesAndBatches(
    LoadCoursesAndBatches event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    _batchBloc.add(LoadBatches());
    _courseBloc.add(CourseLoad());
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }

  void _onRegisterEvent(
    RegisterStudent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _registerUseCase.call(RegisterUserParams(
      fname: event.fName,
      lname: event.lName,
      phone: event.phone,
      batch: event.batch,
      courses: _courseBloc.state.courses,
      username: event.username,
      password: event.password,
      image: state.imageName,
    ));

    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
            context: event.context, message: l.message, color: Colors.red);
      },
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
            context: event.context, message: "Registration Successful");
      },
    );
  }

  void _onLoadImage(
    UploadImage event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _uploadImageUsecase.call(
      UploadImageParams(
        file: event.file,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true, imageName: r));
      },
    );
  }
}
