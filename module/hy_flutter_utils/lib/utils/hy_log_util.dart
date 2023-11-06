import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';

/// Created by wdx
/// on 2022/07/6
/// page hy_log_util
/// 打印工具


class HYLogUtil{

  static HYLogUtil? _instance;
  static bool _isRelease = kReleaseMode;

  /// 是否原生打印，默认false
  static bool _isXFSNativePrint = false;

  /// 一次最大打印字数，iOS以外系统用到
  static int _maxLeng = 8000;
  
  HYLogUtil._();

  /// 打印工具初始化
  ///
  /// [isRelease] 是否正式环境
  /// [isXFSNative] 是否在原生打印 默认false
  static HYLogUtil? instance({required bool isRelease, bool isXFSNativePrint = false, int maxLeng = 800}){
    if(_instance == null){
      _instance = HYLogUtil._();
      _isRelease = isRelease;
      _isXFSNativePrint = isXFSNativePrint;
      _maxLeng = maxLeng;
    }
  }

  static warning(Object printObj, {StackTrace? stackTrace, String? funcName}){
    _print(printObj, title: "⚠️", stackTrace: stackTrace, funcName: funcName);
  }

  static error(Object printObj, {StackTrace? stackTrace, String? funcName}){
    _print(printObj, title: "❌", stackTrace: stackTrace, funcName: funcName);
  }

  static success(Object printObj, {StackTrace? stackTrace, String? funcName}){
    _print(printObj, title: "✅️", stackTrace: stackTrace, funcName: funcName);
  }

  static info(Object printObj, {StackTrace? stackTrace, String? funcName}){
    _print(printObj, title: "🌟", stackTrace: stackTrace, funcName: funcName);
  }

  static _print(Object printObj, {StackTrace? stackTrace, String? title, String? funcName}){
    if(!_isRelease){
      List<String> components = ['$title$title ${funcName??''} $title$title'];
      components.add('┌───────────────────────────────────────────────────────$title────────────────────────────────────────────────────────────────');
      components.add('│  ${printObj.toString()}');
      if (!_isXFSNativePrint && stackTrace != null){
        components.add(stackTrace.toString());
      }
      components.add('└───────────────────────────────────────────────────────$title────────────────────────────────────────────────────────────────');
      if (_isXFSNativePrint){
        String objStr = components.join('\n');
        if (!Platform.isIOS){
          if(objStr.length > _maxLeng){
            while(objStr.length > _maxLeng){
              debugPrint(objStr.substring(0, _maxLeng));
              objStr = objStr.substring(_maxLeng);
            }
          }
        }
        debugPrint(objStr);
      } else {
        log(components.join('\n'));
      }
    }
  }
}