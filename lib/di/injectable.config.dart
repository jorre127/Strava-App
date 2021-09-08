// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i36;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moor/moor.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../database/flutter_template_database.dart' as _i10;
import '../database/todo/todo_dao_storage.dart' as _i16;
import '../repository/club_detail/club_detail_repository.dart' as _i23;
import '../repository/debug/debug_repository.dart' as _i25;
import '../repository/locale/locale_repository.dart' as _i28;
import '../repository/login/login_repository.dart' as _i29;
import '../repository/refresh/refresh_repository.dart' as _i32;
import '../repository/secure_storage/auth/auth_storage.dart' as _i22;
import '../repository/secure_storage/secure_storage.dart' as _i14;
import '../repository/shared_prefs/local/local_storage.dart' as _i27;
import '../repository/todo/todo_repository.dart' as _i17;
import '../util/cache/cache_controller.dart' as _i4;
import '../util/cache/cache_controlling.dart' as _i3;
import '../util/interceptor/network_auth_interceptor.dart' as _i31;
import '../util/interceptor/network_error_interceptor.dart' as _i12;
import '../util/interceptor/network_log_interceptor.dart' as _i13;
import '../util/interceptor/network_refresh_interceptor.dart' as _i35;
import '../viewmodel/club_detail/club_detail_viewmodel.dart' as _i24;
import '../viewmodel/clubs/clubs_viewmodel.dart' as _i5;
import '../viewmodel/debug/debug_platform_selector_viewmodel.dart' as _i8;
import '../viewmodel/debug/debug_viewmodel.dart' as _i26;
import '../viewmodel/global/global_viewmodel.dart' as _i34;
import '../viewmodel/license/license_viewmodel.dart' as _i11;
import '../viewmodel/login/login_viewmodel.dart' as _i30;
import '../viewmodel/splash/splash_viewmodel.dart' as _i33;
import '../viewmodel/todo/todo_add/todo_add_viewmodel.dart' as _i20;
import '../viewmodel/todo/todo_list/todo_list_viewmodel.dart' as _i21;
import '../webservice/todo/todo_dummy_service.dart' as _i19;
import '../webservice/todo/todo_service.dart' as _i18;
import '../webservice/todo/todo_webservice.dart' as _i37;
import 'injectable.dart' as _i38;

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
  gh.lazySingleton<_i23.ClubDetailRepository>(
      () => _i23.ClubDetailRepository(get<_i22.AuthStorage>()));
  gh.factory<_i24.ClubDetailViewModel>(
      () => _i24.ClubDetailViewModel(get<_i23.ClubDetailRepository>()));
  gh.lazySingleton<_i25.DebugRepository>(
      () => _i25.DebugRepository(get<_i6.SharedPreferenceStorage>()));
  gh.factory<_i26.DebugViewModel>(
      () => _i26.DebugViewModel(get<_i25.DebugRepository>()));
  gh.lazySingleton<_i27.LocalStorage>(() => _i27.LocalStorage(
      get<_i22.AuthStorage>(), get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i28.LocaleRepository>(
      () => _i28.LocaleRepository(get<_i6.SharedPreferenceStorage>()));
  gh.lazySingleton<_i29.LoginRepository>(
      () => _i29.LoginRepository(get<_i22.AuthStorage>()));
  gh.factory<_i30.LoginViewModel>(
      () => _i30.LoginViewModel(get<_i29.LoginRepository>()));
  gh.singleton<_i31.NetworkAuthInterceptor>(
      _i31.NetworkAuthInterceptor(get<_i22.AuthStorage>()));
  gh.lazySingleton<_i32.RefreshRepository>(
      () => _i32.RefreshRepository(get<_i22.AuthStorage>()));
  gh.factory<_i33.SplashViewModel>(() => _i33.SplashViewModel(
      get<_i29.LoginRepository>(), get<_i27.LocalStorage>()));
  gh.factory<_i34.GlobalViewModel>(() => _i34.GlobalViewModel(
      get<_i28.LocaleRepository>(), get<_i25.DebugRepository>()));
  gh.singleton<_i35.NetworkRefreshInterceptor>(_i35.NetworkRefreshInterceptor(
      get<_i22.AuthStorage>(), get<_i32.RefreshRepository>()));
  gh.lazySingleton<_i6.CombiningSmartInterceptor>(() =>
      registerModule.provideCombiningSmartInterceptor(
          get<_i13.NetworkLogInterceptor>(),
          get<_i31.NetworkAuthInterceptor>(),
          get<_i12.NetworkErrorInterceptor>(),
          get<_i35.NetworkRefreshInterceptor>()));
  gh.lazySingleton<_i36.Dio>(
      () => registerModule.provideDio(get<_i6.CombiningSmartInterceptor>()));
  gh.singleton<_i18.TodoService>(_i37.TodoWebService(get<_i36.Dio>()),
      registerFor: {_dev, _prod});
  return get;
}

class _$RegisterModule extends _i38.RegisterModule {}
