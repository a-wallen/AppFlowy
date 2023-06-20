import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PluginLocationService {
  const PluginLocationService({
    required Future<Directory> fallback,
  }) : _fallback = fallback;

  final Future<Directory> _fallback;

  Future<Directory> get fallback async => _fallback;

  Future<Directory> get location async => fallback;
}
