import 'dart:ui';

import 'package:flutter_getx/style/theme.dart';
import 'package:flutter_getx/utils/storage.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_getx/values/constants.dart';
import 'package:flutter_getx/i18n/translation.dart';

class ConfigService extends GetxService {
  // 单例
  static ConfigService get to => Get.find();

  PackageInfo? _packageInfo;

  String get version => _packageInfo?.version ?? '-';

  // 多语言
  Locale locale = PlatformDispatcher.instance.locale;

  // 主题
  final RxBool _isDarkModel = Get.isDarkMode.obs;

  bool get isDarkModel => _isDarkModel.value;

  // 是否首次打开
  bool get isFirstOpen => Storage().getBool(Constants.storageFirstOpen);

  @override
  void onReady() {
    super.onReady();
    getPlatform();
    initLocale();
    initTheme();
  }

  Future<void> getPlatform() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  /// 初始化语言
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    // var index = Translation.supportedLocales.indexWhere((element) => {
    //   return element.languageCode == langCode;
    // });
    // if (index < 0) return;
    // locale = Translation.supportedLocales[index];
  }

  /// 初始化主题
  void initTheme() {
    var themeCode = Storage().getString(Constants.storageThemeCode);
    _isDarkModel.value = themeCode == 'dark' ? true : false;
    Get.changeTheme(themeCode == 'dark' ? AppTheme.dark : AppTheme.light);
  }

  /// 切换主题
  Future<void> switchThemeModel() async {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(
        _isDarkModel.value == true ? AppTheme.dark : AppTheme.light);
    await Storage().setString(Constants.storageThemeCode,
        _isDarkModel.value == true ? 'dark' : 'light');
  }

  /// 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  /// 标记已打开app
  void setAlreadyOpen() {
    Storage().setBool(Constants.storageFirstOpen, true);
  }
}
