import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:dunamis/features/course/domain/entity/course_entity.dart';
import 'package:dunamis/features/course/presentation/view_model/course_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final CourseBloc _courseBloc;

  RegisterBloc({
    required CourseBloc courseBloc,
  })  : _courseBloc = courseBloc,
        super(RegisterState.initial()) {
    on<LoadCoursesAndBatches>(_onLoadCoursesAndBatches);
    add(LoadCoursesAndBatches());
  }

  void _onLoadCoursesAndBatches(
    LoadCoursesAndBatches event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    _courseBloc.add(CourseLoad());
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}
