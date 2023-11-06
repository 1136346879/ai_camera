import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:hy_flutter_utils/hy_flutter_utils.dart';


/// Created by wdx
/// on 2022-06-14
/// page hy_common_uitils

class HYCommonUtils{


  /// 显示toast
  static showToast({
    required String msg,
    ToastGravity gravity=ToastGravity.CENTER,
    Color backgroundColor=Colors.black,
    Toast? toastLength,
  }) {
    Fluttertoast.showToast(msg: msg, gravity: gravity, backgroundColor: backgroundColor, toastLength: toastLength);
  }

  /// Get返回到指定页面
  ///
  /// [page] 指定命名路由
  static void popUntilToName(String page) {
    Get.until((route) => Get.currentRoute == page);
  }
  ///获取当前widget控件底部位置dy
  static double getCurrentWidgetDy(GlobalKey key) {
     //获取当前Widget大小
     final RenderBox renderBox =
     key.currentContext!.findRenderObject()! as RenderBox;
     final height = renderBox.size;
     final positionGreen = renderBox.localToGlobal(Offset.zero);
     print("POSITION OF WIDGET: $positionGreen");
     return positionGreen.dy + height.height;
   }

  static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }

}