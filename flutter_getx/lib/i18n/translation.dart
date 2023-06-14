import 'package:get/get.dart';
import 'locales/locale_en.dart';
import 'locales/locale_zh.dart';

class Translation extends Translations {

  // 默认语言Locale(语言代码, 国家代码)
  static const fallbackLocale = Locale('en', 'US');

  // 支持语言列表
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN')
  ];

  // 代理
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ];

  // 语言代码对应翻译文本
  @override
  Map<String, Map<String, String>> get keys => {'en': localeEn, 'zh': localeZh};
}
