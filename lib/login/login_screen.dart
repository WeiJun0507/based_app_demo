import 'package:based_app/login/login_bottom_sheet.dart';
import 'package:based_app/util/color.dart';
import 'package:based_app/util/text_style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void onLoginPressed(
    BuildContext context,
  ) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LoginBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.black,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPlate.black,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0 + MediaQuery.of(context).viewPadding.top,
          ),
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/logo_text.jpeg',
                height: 40,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),

          // Big Logo
          Expanded(
            child: Image.asset(
              'assets/images/based_image.png',
              fit: BoxFit.contain,
            ),
          ),

          StText.big(
            'Break Free,',
            style: StandardTextStyle.big.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 42.0,
            ),
          ),

          StText.big(
            'Bank less.',
            style: StandardTextStyle.big.copyWith(
              color: ColorPlate.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 56.0,
            ),
          ),

          const SizedBox(height: 20.0),

          GestureDetector(
            onTap: () => onLoginPressed(context),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                color: ColorPlate.primaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const StText.normal(
                'Login',
              ),
            ),
          )
        ],
      ),
    );
  }
}
