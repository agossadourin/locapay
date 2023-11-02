import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/register/login.dart';
import 'package:locapay/app/modules/register/register.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _controller = PageController();
  final RxBool _isRegisterPage = false.obs;
  TextStyle activeStyle = const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: Color(0xFF313131),
  );

  TextStyle inactiveStyle = const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(0, 0, 0, 0.25),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/images/logo_black.png',
          ),
          Obx(
            () => Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    'S\'inscrire',
                    style: _isRegisterPage.value ? activeStyle : inactiveStyle,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    'Se connecter',
                    style: _isRegisterPage.value ? inactiveStyle : activeStyle,
                  ),
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.black,
                dotHeight: 5,
                dotWidth: MediaQuery.of(context).size.width * 0.4,
                expansionFactor: 1.1,
                spacing: 0,
              )),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                if (index == 0) {
                  _isRegisterPage.value = true;
                } else {
                  _isRegisterPage.value = false;
                }
              },
              children: [
                RegisterWidget(),
                LoginWidget(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
