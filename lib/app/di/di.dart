import 'package:dio/dio.dart';
import 'package:dunamis/features/dashboard/data/data_source/remote_datasource/course_remote_datasource.dart';
import 'package:dunamis/features/dashboard/data/repository/dashboard_remote_repository.dart';
import 'package:dunamis/features/dashboard/domain/use_case/create_course_usecase.dart';
import 'package:dunamis/features/dashboard/domain/use_case/delete_course_usecase.dart';
import 'package:dunamis/features/dashboard/domain/use_case/get_all_course_usecase.dart';
import 'package:dunamis/features/dashboard/presentation/view_model/course_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dunamis/app/shared_prefs/token_shared_prefs.dart';
import 'package:dunamis/core/network/api_service.dart';
import 'package:dunamis/core/network/hive_service.dart';
import 'package:dunamis/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:dunamis/features/auth/data/data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:dunamis/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:dunamis/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:dunamis/features/auth/domain/use_case/login_usecase.dart';
import 'package:dunamis/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:dunamis/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:dunamis/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:dunamis/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:dunamis/features/batch/data/data_source/local_datasource/batch_local_data_source.dart';
import 'package:dunamis/features/batch/data/data_source/remote_datasource/batch_remote_datasource.dart';
import 'package:dunamis/features/batch/data/repository/batch_local_repository.dart';
import 'package:dunamis/features/batch/data/repository/batch_remote_repository.dart';
import 'package:dunamis/features/batch/domain/use_case/create_batch_usecase.dart';
import 'package:dunamis/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:dunamis/features/batch/domain/use_case/get_all_batch_usecase.dart';
import 'package:dunamis/features/batch/presentation/view_model/batch_bloc.dart';
import 'package:dunamis/features/course/data/data_source/local_datasource/course_local_data_source.dart';
import 'package:dunamis/features/course/data/data_source/remote_datasource/course_remote_datasource.dart';
import 'package:dunamis/features/course/data/repository/course_local_repository.dart';
import 'package:dunamis/features/course/data/repository/course_remote_repository.dart';
import 'package:dunamis/features/course/domain/use_case/create_course_usecase.dart';
import 'package:dunamis/features/course/domain/use_case/delete_course_usecase.dart';
import 'package:dunamis/features/course/domain/use_case/get_all_course_usecase.dart';
import 'package:dunamis/features/course/presentation/view_model/course_bloc.dart';
import 'package:dunamis/features/home/presentation/view_model/home_cubit.dart';
import 'package:dunamis/features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();
  await _initBatchDependencies();
  await _initCourseDependencies();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();

  await _initSplashScreenDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
// =========================== Data Source ===========================

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  // =========================== Repository ===========================

  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // =========================== Usecases ===========================
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      batchBloc: getIt<BatchBloc>(),
      courseBloc: getIt<CourseBloc>(),
      registerUseCase: getIt(),
      uploadImageUsecase: getIt(),
    ),
  );
}

_initCourseDependencies() {
  // =========================== Data Source ===========================

  getIt.registerFactory<CourseLocalDataSource>(
      () => CourseLocalDataSource(hiveService: getIt<HiveService>()));

  getIt.registerFactory<CourseRemoteDataSource>(
      () => CourseRemoteDataSource(getIt<Dio>()));

  getIt.registerFactory<DashboardRemoteDataSource>(
      () => DashboardRemoteDataSource(getIt<Dio>()));

  // =========================== Repository ===========================

  getIt.registerLazySingleton<CourseLocalRepository>(() =>
      CourseLocalRepository(
          courseLocalDataSource: getIt<CourseLocalDataSource>()));

  getIt.registerLazySingleton<CourseRemoteRepository>(
    () => CourseRemoteRepository(
      getIt<CourseRemoteDataSource>(),
    ),
  );

  // =========================== Repository ===========================

  getIt.registerLazySingleton<DashboardCourseRemoteRepository>(
    () => DashboardCourseRemoteRepository(
      getIt<DashboardRemoteDataSource>(),
    ),
  );

  // Usecases
  getIt.registerLazySingleton<CreateCourseUsecase>(
    () => CreateCourseUsecase(
      courseRepository: getIt<CourseRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetAllCourseUsecase>(
    () => GetAllCourseUsecase(
      courseRepository: getIt<CourseRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetAllCourseListUsecase>(
    () => GetAllCourseListUsecase(
      courseRepository: getIt<DashboardCourseRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<LoadCategoryUsecase>(
    () => LoadCategoryUsecase(
      courseRepository: getIt<DashboardCourseRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<ListUsersUsecase>(
    () => ListUsersUsecase(
      courseRepository: getIt<DashboardCourseRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<DeleteCourseUsecase>(
    () => DeleteCourseUsecase(
      courseRepository: getIt<CourseLocalRepository>(),
    ),
  );

  // Bloc

  getIt.registerFactory<CourseBloc>(
    () => CourseBloc(
      getAllCourseUsecase: getIt<GetAllCourseUsecase>(),
      createCourseUsecase: getIt<CreateCourseUsecase>(),
      deleteCourseUsecase: getIt<DeleteCourseUsecase>(),
    ),
  );

  getIt.registerFactory<DashboardCourseBloc>(
    () => DashboardCourseBloc(
      getAllCourseUsecase: getIt<GetAllCourseListUsecase>(),
      loadCategoryUsecase: getIt<LoadCategoryUsecase>(),
      listUsersUsecase: getIt<ListUsersUsecase>(),
    ),
  );
}

_initBatchDependencies() async {
  // =========================== Data Source ===========================
  getIt.registerFactory<BatchLocalDataSource>(
      () => BatchLocalDataSource(hiveService: getIt<HiveService>()));

  getIt.registerLazySingleton<BatchRemoteDataSource>(
    () => BatchRemoteDataSource(
      dio: getIt<Dio>(),
    ),
  );

  // =========================== Repository ===========================

  getIt.registerLazySingleton<BatchLocalRepository>(() => BatchLocalRepository(
      batchLocalDataSource: getIt<BatchLocalDataSource>()));

  getIt.registerLazySingleton(
    () => BatchRemoteRepository(
      remoteDataSource: getIt<BatchRemoteDataSource>(),
    ),
  );

  // =========================== Usecases ===========================

  getIt.registerLazySingleton<CreateBatchUseCase>(
    () => CreateBatchUseCase(batchRepository: getIt<BatchRemoteRepository>()),
  );

  getIt.registerLazySingleton<GetAllBatchUseCase>(
    () => GetAllBatchUseCase(batchRepository: getIt<BatchRemoteRepository>()),
  );

  getIt.registerLazySingleton<DeleteBatchUsecase>(
    () => DeleteBatchUsecase(
      batchRepository: getIt<BatchRemoteRepository>(),
      tokenSharedPrefs: getIt<TokenSharedPrefs>(),
    ),
  );

  // =========================== Bloc ===========================
  getIt.registerFactory<BatchBloc>(
    () => BatchBloc(
      createBatchUseCase: getIt<CreateBatchUseCase>(),
      getAllBatchUseCase: getIt<GetAllBatchUseCase>(),
      deleteBatchUsecase: getIt<DeleteBatchUsecase>(),
    ),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  // =========================== Token Shared Preferences ===========================
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  // =========================== Usecases ===========================
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
  );
}
