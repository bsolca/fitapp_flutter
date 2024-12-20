import 'dart:convert';

import 'package:ez_fit_app/src/features/user_settings/data/user_settings_repository.codegen.dart';
import 'package:ez_fit_app/src/features/user_settings/model/user_settings.codegen.dart';
import 'package:ez_fit_app/src/utils/constants/ez_const_string.dart';
import 'package:hive/hive.dart';

/// Hive user settings repository implementation.
class UserSettingsRepositoryHive implements UserSettingsRepository {
  /// Hive user settings repository implementation.
  UserSettingsRepositoryHive(this.userSettingsBox);

  /// Hive instance.
  final Box<String> userSettingsBox;

  @override
  Future<UserSettings> getUserSettings() async {
    var settings = userSettingsBox.get(EzConstString.hiveUserSettings);
    if (settings == null) {
      settings = jsonEncode(UserSettings.defaultSettings().toJson());
      await userSettingsBox.put(EzConstString.hiveUserSettings, settings);
    }
    final decoded = jsonDecode(settings);

    if (decoded is Map<String, dynamic>) {
      return UserSettings.fromJson(decoded);
    } else {
      throw Exception('User settings wrong decode type');
    }
  }

  @override
  Future<void> saveUserSettings(UserSettings userSettings) async {
    await userSettingsBox.put(
      EzConstString.hiveUserSettings,
      jsonEncode(userSettings.toJson()),
    );
  }
}
