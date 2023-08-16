import 'package:based_app/home/components/avatar.dart';
import 'package:based_app/home/components/coin_item.dart';
import 'package:based_app/main.dart';
import 'package:based_app/model/crypto/coin_list.dart';
import 'package:based_app/model/user.dart';
import 'package:based_app/util/color.dart';
import 'package:based_app/util/size.dart';
import 'package:based_app/util/text_style.dart';
import 'package:based_app/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3x/web3x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User get userInfo => objectMgr.userMgr.userInfo ?? User();

  ValueNotifier<bool> isFetchingTokenBalance = ValueNotifier(true);

  ValueNotifier<List<CoinList>> coinList = ValueNotifier(<CoinList>[]);

  @override
  void initState() {
    super.initState();
    getBalance();
  }

  void getBalance() async {
    try {
      final EtherAmount amount =
          await objectMgr.cryptoMgr.polygonMumbai.getBalance();
      final finalAmount = amount.getInWei / BigInt.from(10).pow(18);
      coinList.value = <CoinList>[
        CoinList(
          name: 'MATIC',
          fullName: 'Polygon Mumbai',
          balance: finalAmount.toDouble(),
          value: finalAmount.toDouble() * 1.5,
          icon: 'assets/images/matic_token_icon.png',
        ),
      ];
    } catch (e) {
      print(e);
    } finally {
      isFetchingTokenBalance.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPlate.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorPlate.black,
        elevation: 1.1,
        title: const StText.big("Profile"),
        leading: Padding(
          padding: const EdgeInsets.all(SysSize.small),
          child: Image.asset('assets/images/logo.jpeg'),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () => objectMgr.userMgr.logout(context),
            child: const Avatar(
              size: 48.0,
              color: ColorPlate.secondaryColor,
              textStyle: StandardTextStyle.small,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(SysSize.small),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorPlate.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(SysSize.big),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: SysSize.huge * 1.5),
                const Avatar(
                  size: SysSize.huge * 3,
                  color: ColorPlate.secondaryColor,
                  textStyle: StandardTextStyle.big,
                ),
                const SizedBox(height: SysSize.huge),
                StText.normal(userInfo.name ?? 'Undefined'),
                const SizedBox(height: SysSize.huge),
                addressInfo('EOA', userInfo.eotAddress?.hex),
                addressInfo('Based Address', userInfo.safeAddress?.hex),
              ],
            ),
          ),
          const SizedBox(height: SysSize.huge),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(SysSize.huge),
            margin: const EdgeInsets.symmetric(horizontal: SysSize.normal),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorPlate.formHeaderColor,
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: StText.small(
                      'Token',
                      style: StandardTextStyle.small.copyWith(
                        color: ColorPlate.formHeaderColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: StText.small(
                      'Balance',
                      style: StandardTextStyle.small.copyWith(
                        color: ColorPlate.formHeaderColor,
                      ),
                      align: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: StText.small(
                      'Value',
                      style: StandardTextStyle.small.copyWith(
                        color: ColorPlate.formHeaderColor,
                      ),
                      align: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: isFetchingTokenBalance,
              builder: (_, bool value, __) {
                if (value) {
                  return Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }

                return Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: coinList,
                    builder: (_, List<CoinList> value, __) {
                      if (value.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          child: const StText.normal('You have no token yet'),
                        );
                      }
                      return ListView.separated(
                        itemBuilder: (_, int index) {
                          final coin = coinList.value[index];
                          return Container(
                            padding: const EdgeInsets.all(SysSize.huge),
                            margin: const EdgeInsets.symmetric(
                                horizontal: SysSize.normal),
                            child: CoinItem(coin: coin),
                          );
                        },
                        separatorBuilder: (_, int index) {
                          return const SizedBox(height: SysSize.tiny);
                        },
                        itemCount: value.length,
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget addressInfo(
    String title,
    String? address,
  ) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorPlate.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(SysSize.big),
      ),
      margin: const EdgeInsets.only(
        left: SysSize.normal,
        right: SysSize.normal,
        bottom: SysSize.big,
      ),
      padding: const EdgeInsets.all(SysSize.normal),
      child: Row(
        children: <Widget>[
          StText.normal(title),
          const SizedBox(width: SysSize.tiny),
          const Icon(Icons.info_outline_rounded),
          Expanded(
            child: StText.normal(
              overflowEllipsisMiddle(address ?? 'Undefined'),
              align: TextAlign.end,
              style: StandardTextStyle.normal.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: SysSize.small),
          GestureDetector(
            onTap: () {
              if (address != null && address.isNotEmpty) {
                Clipboard.setData(ClipboardData(text: address));
                Toast.showToast('Address Copied');
              }
            },
            child: const Icon(Icons.copy_outlined),
          ),
        ],
      ),
    );
  }
}
