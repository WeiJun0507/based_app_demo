import 'package:based_app/main.dart';
import 'package:based_app/model/user.dart';
import 'package:based_app/util/text_style.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final Color color;
  final TextStyle? textStyle;
  const Avatar({
    super.key,
    required this.size,
    required this.color,
    this.textStyle,
  });

  User get userInfo => objectMgr.userMgr.userInfo ?? User();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: userInfo.picture != null && userInfo.picture!.isNotEmpty
          ? Image.network(
              userInfo.picture!,
              width: size,
              height: size,
            )
          : StText.normal(
              getShortFormText(userInfo.name ?? ''),
              align: TextAlign.center,
              style: textStyle,
            ),
    );
  }
}
