import 'package:based_app/model/crypto/coin_list.dart';
import 'package:based_app/util/size.dart';
import 'package:based_app/util/text_style.dart';
import 'package:flutter/material.dart';

class CoinItem extends StatelessWidget {
  final CoinList coin;
  const CoinItem({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Row(
            children: <Widget>[
              // coin icon,
              if (coin.icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: SysSize.small),
                  child: Image.asset(
                    coin.icon!,
                    width: 40,
                    height: 40,
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StText.small(
                    coin.name,
                    style: StandardTextStyle.small.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  StText.small(
                    coin.fullName,
                    style: StandardTextStyle.small.copyWith(
                      fontSize: SysSize.tiny,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: StText.small(
            coin.balance.toString(),
            align: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 2,
          child: StText.small(
            coin.value.toString(),
            align: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
