import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Cache {
  final _box = Hive.box('data_cache');

  void write(String key, dynamic value) {
    int time = DateTime.now().millisecondsSinceEpoch;
    var timedValue = {
      'time': time,
      'data': value,
    };
    _box.put(key, timedValue);
    _box.put('last-update', time);
  }

  dynamic read(String key) async {
    var value = _box.get(key);
    dynamic lastUpdate = _box.get('last-update');
    if (value == null) {
      return null;
    }
    if (lastUpdate != null) {
      final currentday = DateTime.now();
      lastUpdate = DateTime.fromMillisecondsSinceEpoch(lastUpdate);
      if (lastUpdate.isBefore(currentday)) {
        await _box.clear();
        return null;
      }
    }
    int time = DateTime.now().millisecondsSinceEpoch;
    if (value['time'] + 900000 < time) {
      return null;
    }
    debugPrint('cache hit');
    return value['data'];
  }
}
