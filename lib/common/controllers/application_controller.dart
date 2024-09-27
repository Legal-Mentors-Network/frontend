import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmn/common/exceptions/permission_exception.dart';
import 'package:lmn/data/config_table.dart';
import 'package:lmn/models/config.dart';
import 'package:lmn/state/auth.dart';
import 'package:lmn/state/state.dart';
import 'package:pocketbase/pocketbase.dart';

class ApplicationController {
  ApplicationController(this.ref);

  final Ref ref;

  Future<Config?> getConfigItem(String field) async {
    final db = await ref.read(databaseProvider);
    return ConfigTable(db).getItem(field);
  }

  Future<int> setConfigItem(String field, String value) async {
    final db = await ref.read(databaseProvider);
    final item = await ConfigTable(db).getItem(field);

    int? id;

    if (item == null) {
      id = await ConfigTable(db).setItem(field, value);
    } else {
      id = await ConfigTable(db).updateItem(item.id, value);
    }

    return id;
  }

  static Future<Placemark> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw PermissionException(
        'Location services are disabled. Please enable location services on your device',
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw PermissionException('Location premissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw PermissionException(
        'Location permissions are permanently denied. We cannot request permission',
      );
    }

    final position = await Geolocator.getCurrentPosition();

    final List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    // return late and long along with placemark
    debugPrint("latitude ${position.latitude}");
    debugPrint("longitude ${position.longitude}");

    return placemarks[0];
  }

  static Future<XFile?> selectImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    return image;
  }

  // load user from cache
  Future<RecordModel?> loadFromCache() async {
    final db = await ref.read(databaseProvider);

    try {
      final item = await ConfigTable(db).getItem(AuthNotifier.field);
      if (item == null) return null;

      final record = _process(json.decode(item.value) as Map<String, Object?>);
      if (record == null) return null;

      return record;
    } catch (e) {
      debugPrint("Failed to read current user from cache $e");
    }

    return null;
  }

  RecordModel? _process(Map<String, Object?> data) {
    return switch (data) { {'model': final Map<String, dynamic> model} => RecordModel.fromJson(model), _ => null };
  }
}
