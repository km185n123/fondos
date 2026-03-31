import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fondos/features/config/data/services/remote_config_service_impl.dart';

@injectable
class ConfigCubit extends Cubit<bool> {
  final RemoteConfigService remoteConfigService;
  StreamSubscription<bool>? _sub;

  ConfigCubit(this.remoteConfigService) : super(false);

  void start() {
    _sub?.cancel();
    _sub = remoteConfigService.watchUseNewSecurityBanner().listen(emit);
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
