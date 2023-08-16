import 'package:based_app/home/home_screen.dart';
import 'package:based_app/main.dart';
import 'package:based_app/model/magic_auth/magic_auth_request.dart';
import 'package:based_app/util/color.dart';
import 'package:based_app/util/regex.dart';
import 'package:based_app/util/size.dart';
import 'package:based_app/util/text_style.dart';
import 'package:based_app/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  late final TextEditingController _emailPhoneController;

  bool get _textControllerHasText => _emailPhoneController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _emailPhoneController = TextEditingController();
  }

  @override
  void dispose() {
    _emailPhoneController.dispose();
    super.dispose();
  }

  void onTextFieldChange(String value) {
    setState(() {});
  }

  void prepareLogin(BuildContext context, String loginType) async {
    switch (loginType) {
      case 'phoneOrEmail':
        final inputText = _emailPhoneController.text;
        final MagicAuthRequest request;
        if (validateUserEmail(inputText)) {
          request = MagicAuthRequest.fromJson({
            'type': MagicAuthRequestEnum.email,
            'data': inputText,
          });
        } else if (validateUserPhone(inputText)) {
          request = MagicAuthRequest.fromJson({
            'type': MagicAuthRequestEnum.phone,
            'data': inputText,
          });
        } else {
          Toast.showToast('Please enter a valid email or phone number');
          return;
        }

        final token = await objectMgr.magicAuthMgr.init(request);

        if (token && objectMgr.userMgr.isLoggedIn) {
          if (mounted) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        } else {
          Toast.showToast('Login failed. Please try again');
        }
        break;
      case 'google':
        Toast.show();
        MagicAuthRequest request = MagicAuthRequest.fromJson({
          'type': MagicAuthRequestEnum.google,
          'data': '',
        });
        final token = await objectMgr.magicAuthMgr.init(request);
        Toast.hide();
        if (token && objectMgr.userMgr.isLoggedIn) {
          if (mounted) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        } else {
          Toast.showToast('Login failed. Please try again');
        }
        break;
      case 'wallet':
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: SysSize.normal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: SysSize.normal),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[900]!),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: StText.big(
                        'Sign In',
                        style: StandardTextStyle.big.copyWith(
                          color: ColorPlate.white,
                          fontWeight: FontWeight.w500,
                        ),
                        align: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: SysSize.huge * 1.125,
                          color: ColorPlate.darkGray,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              StText.big(
                'Email Or Phone',
                style: StandardTextStyle.big.copyWith(
                  color: ColorPlate.white,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _emailPhoneController,
                onChanged: onTextFieldChange,
                style: StandardTextStyle.normal.copyWith(
                  color: ColorPlate.white,
                  fontSize: SysSize.normal,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SysSize.tiny),
                    borderSide: const BorderSide(color: ColorPlate.darkGray),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SysSize.tiny),
                    borderSide: const BorderSide(color: ColorPlate.darkGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SysSize.tiny),
                    borderSide: const BorderSide(color: ColorPlate.darkGray),
                  ),
                  hintText: 'Eg: +(00)123456/name@example.com',
                  hintStyle: StandardTextStyle.normal.copyWith(
                    color: ColorPlate.gray,
                    fontSize: SysSize.small,
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: SysSize.big,
                    right: SysSize.normal,
                    top: SysSize.big,
                    bottom: SysSize.big,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => prepareLogin(context, 'phoneOrEmail'),
                child: Container(
                  padding: const EdgeInsets.all(SysSize.small),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _textControllerHasText
                        ? ColorPlate.primaryColor
                        : ColorPlate.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(SysSize.tiny),
                  ),
                  child: StText.normal(
                    'Continue',
                    style: StandardTextStyle.normal.copyWith(
                      color: _textControllerHasText
                          ? ColorPlate.white
                          : ColorPlate.darkGray,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: SysSize.huge),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: Divider(
                        color: ColorPlate.darkGray,
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SysSize.normal),
                      child: StText.small(
                        'or',
                        style: StandardTextStyle.small.copyWith(
                          color: ColorPlate.darkGray,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: ColorPlate.darkGray,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              StText.big(
                'Sign In',
                style: StandardTextStyle.big.copyWith(
                  color: ColorPlate.white,
                ),
              ),
              const SizedBox(height: 10.0),
              StText.normal(
                'Your blockchain wallet in one-click',
                style: StandardTextStyle.normal.copyWith(
                  color: ColorPlate.gray,
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => prepareLogin(context, 'google'),
                child: Container(
                  padding: const EdgeInsets.all(SysSize.small),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SysSize.tiny),
                    border: Border.all(color: ColorPlate.darkGray),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/google_icon.png',
                        width: SysSize.huge,
                        height: SysSize.huge,
                      ),
                      const SizedBox(width: 10.0),
                      StText.normal(
                        'Continue with Google Login',
                        style: StandardTextStyle.normal.copyWith(
                          color: ColorPlate.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => prepareLogin(context, 'google'),
                child: Container(
                  padding: const EdgeInsets.all(SysSize.small),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SysSize.tiny),
                    border: Border.all(color: ColorPlate.darkGray),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.account_balance_wallet_outlined,
                        color: ColorPlate.white,
                      ),
                      const SizedBox(width: 10.0),
                      StText.normal(
                        'Continue with Wallet',
                        style: StandardTextStyle.normal.copyWith(
                          color: ColorPlate.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: SysSize.normal),
                child: StText.normal(
                  'We do not store any data related to your social logins.',
                  align: TextAlign.center,
                  style: StandardTextStyle.normal.copyWith(
                    color: ColorPlate.gray,
                  ),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                color: ColorPlate.white.withOpacity(0.2),
                padding: const EdgeInsets.all(SysSize.small),
                child: Column(
                  children: <Widget>[
                    StText.small(
                      'Self custodial login by Web3Auth',
                      style: StandardTextStyle.small.copyWith(
                        color: ColorPlate.gray,
                      ),
                    ),
                    StText.small(
                      'Terms of Condition | Privacy Policy',
                      style: StandardTextStyle.small.copyWith(
                        color: ColorPlate.gray,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Magic.instance.relayer,
      ],
    );
  }
}
