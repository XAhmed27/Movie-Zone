// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/services/api/api_service.dart' as _i3;
import '../../features/login/presentation/manager/login_cubit.dart' as _i4;
import '../../features/sign_up/presentation/manager/sign_up_cubit.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiService>(_i3.ApiService());
    gh.factory<_i4.LoginCubit>(() => _i4.LoginCubit(get<_i3.ApiService>()));
    gh.factory<_i5.SignUpCubit>(() => _i5.SignUpCubit(get<_i3.ApiService>()));
    return this;
  }
}
