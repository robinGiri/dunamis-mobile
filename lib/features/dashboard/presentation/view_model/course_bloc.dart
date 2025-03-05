import 'package:bloc/bloc.dart';
import 'package:dunamis/features/dashboard/domain/entity/course_entity.dart';
import 'package:dunamis/features/dashboard/domain/use_case/create_course_usecase.dart';
import 'package:dunamis/features/dashboard/domain/use_case/delete_course_usecase.dart';
import 'package:dunamis/features/dashboard/domain/use_case/get_all_course_usecase.dart';
import 'package:equatable/equatable.dart';

part 'course_event.dart';
part 'course_state.dart';

class DashboardCourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetAllCourseListUsecase _getAllCourseUsecase;
  final LoadCategoryUsecase _loadCategoryUsecase;
  final ListUsersUsecase _listUsersUsecase;
  DashboardCourseBloc({
    required GetAllCourseListUsecase getAllCourseUsecase,
    required LoadCategoryUsecase loadCategoryUsecase,
    required ListUsersUsecase listUsersUsecase,
  })  : _getAllCourseUsecase = getAllCourseUsecase,
        _loadCategoryUsecase = loadCategoryUsecase,
        _listUsersUsecase = listUsersUsecase,
        super(CourseState.initial()) {
    on<CourseLoad>(_onCourseLoad);
    on<ListCategory>(_onLoadCategory);
    on<ListUsers>(_onListUsers);
    add(CourseLoad());
    add(ListCategory());
    add(ListUsers());
  }

  Future<void> _onCourseLoad(
    CourseLoad event,
    Emitter<CourseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllCourseUsecase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (courses) => emit(state.copyWith(isLoading: false, courses: courses)),
    );
  }

  Future<void> _onLoadCategory(
    ListCategory event,
    Emitter<CourseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _loadCategoryUsecase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false));
        add(CourseLoad());
      },
    );
  }

  Future<void> _onListUsers(
    ListUsers event,
    Emitter<CourseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _listUsersUsecase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false));
        add(CourseLoad());
      },
    );
  }
}
