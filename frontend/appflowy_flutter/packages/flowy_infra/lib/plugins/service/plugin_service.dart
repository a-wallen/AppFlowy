import 'dart:async';
import 'dart:io';

import 'location_service.dart';

import '../models/flowy_dynamic_plugin.dart';

/// Singleton class which can only be constructed asynchronously
///
/// The path of the plugins should be initialized by another service
/// since the plugins must be locatable at runtime.
class FlowyPluginService {
  FlowyPluginService._();

  static final Completer _completer = Completer();
  static FlowyPluginService? _instance;

  /// A factory constructor that returns the singleton instance of this class
  static Future<FlowyPluginService> get instance async {
    if (_instance == null) {
      _instance = FlowyPluginService._();
      _completer.complete();
    } else if (!_completer.isCompleted) {
      await _completer.future;
    }
    return _instance!;
  }

  static Future<Iterable<Directory>> get _targets async {
    final location = await PluginLocationService.location;
    final targets = location.listSync().where(FlowyDynamicPlugin.isPlugin);
    return targets.map<Directory>((entity) => entity as Directory).toList();
  }

  static Future<DynamicPluginLibrary> get plugins async {
    final List<FlowyDynamicPlugin> compiled = [];
    for (final src in await _targets) {
      final plugin = await FlowyDynamicPlugin.tryCompile(src: src);
      if (plugin != null) {
        compiled.add(plugin);
      }
    }
    return compiled;
  }
}
