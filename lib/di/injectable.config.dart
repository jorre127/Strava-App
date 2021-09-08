// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i34;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moor/moor.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../database/flutter_template_database.dart' as _i10;
import '../database/todo/todo_dao_storage.dart' as _i16;
import '../repository/club_detail/club_detail_repository.dart' as _i37;
import '../repository/debug/debug_repository.dart' as _i23;
import '../repository/locale/locale_repository.dart' as _i26;
import '../repository/login/login_repository.dart' as _i27;
import '../repository/refresh/refresh_repository.dart' as _i30;
import '../repository/secure_storage/auth/auth_storage.dart' as _i22;
import '../repository/secure_storage/secure_storage.dart' as _i14;
import '../repository/shared_prefs/local/local_storage.dart' as _i25;
import '../repository/todo/todo_repository.dart' as _i17;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i29;
import '../util/interceptor/network_error_interceptor.dart' as _i12;
import '../util/interceptor/network_log_interceptor.dart' as _i13;
import '../util/interceptor/network_refresh_interceptor.dart' as _i33;
import '../viewmodel/club_detail/club_detail_viewmodel.dart' as _i38;
import '../viewmodel/clubs/clubs_viewmodel.dart' as _i5;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i8;
import '../viewmodel/debug/debug_viewmodel.dart' as _i24;
import '../viewmodel/global/global_viewmodel.dart' as _i32;
import '../viewmodel/license/license_viewmodel.dart' as _i11;
import '../viewmodel/login/login_viewmodel.dart' as _i28;
import '../viewmodel/splash/splash_viewmodel.dart' as _i31;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i20;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i21;
import '../webservice/club/club_webservice.dart' as _i36;
import '../webservice/todo/todo_dummy_service.dart' as _i19;
import '../webservice/todo/todo_service.dart' as _i18;
import '../webservice/todo/todo_webservice.dart' as _i35;
import 'injectable.dart' as _i39;

const String _dummy = 'dummy';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.CacheControlling>(_i4.CacheController());
  gh.factory<_i5.ClubsViewModel>(() => _i5.ClubsViewModel());
  gh.singleton<_i6.ConnectivityHelper>(registerModule.connectivityHelper());
  await gh.singletonAsync<_i7.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true);
  gh.factory<_i8.DebugPlatformSelectorViewModel>(
      () => _i8.DebugPlatformSelectorViewModel());
  gh.lazySingleton<_i9.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i10.FlutterTemplateDatabase>(() => registerModule
      .provideFlutterTemplateDatabase(get<_i7.DatabaseConnection>()));
  gh.factory<_i11.LicenseViewModel>(() => _i11.LicenseViewModel());
  gh.singleton<_i12.NetworkErrorInterceptor>(
      _i12.NetworkErrorInterceptor(get<_i6.ConnectivityHelper>()));
  gh.singleton<_i13.NetworkLogInterceptor>(_i13.NetworkLogInterceptor());
  gh.lazySingleton<_i14.SecureStorage>(
      () => _i14.SecureStorage(get<_i9.FlutterSecureStorage>()));
  await gh.singletonAsync<_i15.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.lazySingleton<_i16.TodoDaoStorage>(
      () => _i16.TodoDaoStorage(get<_i10.FlutterTemplateDatabase>()));
  gh.lazySingleton<_i17.TodoRepository>(() =>
      _i17.TodoRepository(get<_i18.TodoService>(), get<_i16.TodoDaoStorage>()));
  gh.singleton<_i18.TodoService>(_i19.TodoDummyService(),
      registerFor: {_dummy});
  gh.lazySingleton<_i6.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i15.SharedPreferences>()));
  gh.lazySingleton<_i6.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i6.SharedPreferenceStorage>(), get<_i14.SecureStorage>()));
  gh.factory<_i20.TodoAddViewModel>(
      () => _i20.TodoAddViewModel(get<_i17.TodoRepository>()));
  gh.factory<_i21.TodoListViewModel>(
      () => _i21.TodoListViewModel(get<_i17.TodoRepository>()));
  gh.lazySingleton<_i22.AuthStorage>(
      () => _i22.AuthStorage(get<_i6.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i23.DebugRepository>(
      () => _i23.DebugRepository(get<_i6.SharedPreferenceStorage>()));
  gh.factory<_i24.DebugViewModel>(
      () => _i24.DebugViewModel(get<_i23.DebugRepository>()));
  gh.lazySingleton<_i25.LocalStorage>(() => _i25.LocalStorage(
      get<_i22.AuthStorage>(), get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i26.LocaleRepository>(
      () => _i26.LocaleRepository(get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i27.LoginRepository>(
      () => _i27.LoginRepository(get<_i22.AuthStorage>()));
  gh.factory<_i28.LoginViewModel>(
      () => _i28.LoginViewModel(get<_i27.LoginRepository>()));
  gh.singleton<_i29.NetworkAuthInterceptor>(
      _i29.NetworkAuthInterceptor(get<_i22.AuthStorage>()));
  gh.lazySingleton<_i30.RefreshRepository>(
      () => _i30.RefreshRepository(get<_i22.AuthStorage>()));
  gh.factory<_i31.SplashViewModel>(() => _i31.SplashViewModel(
      get<_i27.LoginRepository>(), get<_i25.LocalStorage>()));
  gh.factory<_i32.GlobalViewModel>(() => _i32.GlobalViewModel(
      get<_i26.LocaleRepository>(), get<_i23.DebugRepository>()));
  gh.singleton<_i33.NetworkRefreshInterceptor>(_i33.NetworkRefreshInterceptor(
      get<_i22.AuthStorage>(), get<_i30.RefreshRepository>()));
  gh.lazySingleton<_i6.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i13.NetworkLogInterceptor>(),
          get<_i29.NetworkAuthInterceptor>(),
          get<_i12.NetworkErrorInterceptor>(),
          get<_i33.NetworkRefreshInterceptor>()));
  gh.lazySingleton<_i34.Dio>(
      () => registerModule.provideDio(get<_i6.CombiningSmartInterceptor>()));
  gh.singleton<_i18.TodoService>(_i35.TodoWebService(get<_i34.Dio>()),
      registerFor: {_dev, _prod});
  gh.singleton<_i36.ClubWebService>(_i36.ClubWebService(get<_i34.Dio>()));
  gh.lazySingleton<_i37.ClubDetailRepository>(() => _i37.ClubDetailRepository(
      get<_i22.AuthStorage>(), get<_i36.ClubWebService>()));
  gh.factory<_i38.ClubDetailViewModel>(
      () => _i38.ClubDetailViewModel(get<_i37.ClubDetailRepository>()));
  return get;
}

class _$RegisterModule extends _i39.RegisterModule {}
