import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteConfigService {
  Future<void> initialize();
  Stream<bool> watchUseNewSecurityBanner();
}

@LazySingleton(as: RemoteConfigService)
class RemoteConfigServiceImpl implements RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  @override
  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 2),
        minimumFetchInterval: const Duration(seconds: 10),
      ),
    );
    await _remoteConfig.fetchAndActivate();
  }

  @override
  Stream<bool> watchUseNewSecurityBanner() async* {
    bool lastValue = _remoteConfig.getBool('use_new_security_banner');

    yield lastValue;

    yield* Stream.periodic(const Duration(seconds: 15)).asyncMap((_) async {
      try {
        await _remoteConfig.fetchAndActivate();
        return _remoteConfig.getBool('use_new_security_banner');
      } catch (_) {
        return lastValue;
      }
    }).distinct();
  }
}
