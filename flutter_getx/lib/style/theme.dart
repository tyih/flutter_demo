import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx/style/color_schemes.g.dart';

/// 主题
class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
      colorScheme: lightColorScheme,
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          // appBar暗色
          backgroundColor: Colors.transparent,
          // 背景透明
          elevation: 0,
          // 取消阴影
          iconTheme: IconThemeData(color: Color(0xFF5F84FF)),
          // 图标样式
          titleTextStyle: TextStyle(
              // 标题
              color: Color(0xFF4D4D4D),
              fontSize: 24,
              fontWeight: FontWeight.w600)));

  /// 暗色
  static ThemeData dark = ThemeData(
      colorScheme: darkColorScheme,
      fontFamily: 'Montserrat',
      appBarTheme:
          const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light));
}
