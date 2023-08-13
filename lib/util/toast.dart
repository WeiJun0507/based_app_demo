import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Toast {
  static Timer? _showTimer;

  static show({bool allowClick = false}) {
    if (_showTimer != null && _showTimer!.isActive) {
      _showTimer!.cancel();
    }
    _showTimer = Timer(const Duration(milliseconds: 100), () {
      BotToast.showCustomLoading(
        allowClick: allowClick,
        toastBuilder: (CancelFunc cancelFunc) {
          return const CupertinoActivityIndicator();
        },
        backgroundColor: Colors.transparent,
      );
    });
    //BotToast.showLoading();
  }

  static hide() {
    if (_showTimer != null && _showTimer!.isActive) {
      _showTimer!.cancel();
    }
    BotToast.closeAllLoading();
  }

  /*中间弹出框*/
  static showAlert(
      {required BuildContext context,
      bool dismissible = true,
      int alpha = 80,
      required Widget container}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: dismissible,
      barrierLabel: '',
      barrierColor:
          alpha == 0 ? Colors.transparent : Colors.black.withAlpha(alpha),
      pageBuilder: (context, animation, secondaryAnimation) {
        return WillPopScope(
          child: container,
          onWillPop: () async {
            return Future.value(dismissible);
          },
        );
      },
    );
  }

// 提示浮层
  static showToast(
    String text, {
    Duration? duration,
    Alignment align = Alignment.center,
  }) {
    duration ??= const Duration(milliseconds: 1600);
    BotToast.showText(
      duration: duration,
      text: text,
      align: align,
      textStyle: const TextStyle(
        fontSize: 14,
        color: Color(0xffFFFFFF),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      contentColor: Color(0xFF000000).withAlpha((255 * 0.7).toInt()),
    );
  }
}
