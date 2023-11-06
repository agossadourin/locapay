import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/register/account_type_page.dart';
import 'package:locapay/app/modules/register/login.dart';
import 'package:locapay/app/modules/register/register.dart';
import 'package:locapay/app/modules/register/register_artisan.dart';
import 'package:locapay/app/modules/register/register_proprio.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'controllers/account_type_controller.dart';

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
    return WillPopScope(
        onWillPop: () async {
          Get.find<AccountTypeController>().isAccountTypeChosen.value = false;
          Get.find<AccountTypeController>().quitAppVal.value++;
          bool quitApp = false;
          if (Get.find<AccountTypeController>().quitAppVal.value == 2) {
            quitApp = true;
          }

          return quitApp; // return true if the route should be popped; false otherwise
        },
        child: Scaffold(
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
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(0);
                        },
                        child: Text(
                          'S\'inscrire',
                          style: _isRegisterPage.value
                              ? activeStyle
                              : inactiveStyle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(1);
                        },
                        child: Text(
                          'Se connecter',
                          style: _isRegisterPage.value
                              ? inactiveStyle
                              : activeStyle,
                        ),
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
                child: Obx(
                  () => PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      if (index == 0) {
                        _isRegisterPage.value = true;
                      } else {
                        _isRegisterPage.value = false;
                      }
                    },
                    children: [
                      Get.find<AccountTypeController>()
                                  .isAccountTypeChosen
                                  .value ==
                              false
                          ? const AccountTypePage()
                          : Get.find<AccountTypeController>()
                                      .isAccountTypeChosen
                                      .value &&
                                  Get.find<AccountTypeController>()
                                          .selectedIndex
                                          .value ==
                                      0
                              ? const RegisterWidget()
                              : Get.find<AccountTypeController>()
                                          .isAccountTypeChosen
                                          .value &&
                                      Get.find<AccountTypeController>()
                                              .selectedIndex
                                              .value ==
                                          1
                                  ? const RegisterProprioWidget()
                                  : const RegisterArtisanWidget(),
                      const LoginWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
