import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/payment_mini_page.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/services_mini_page.dart';
import 'package:locapay/app/modules/proprio_principal/my_locations_pages/active_locations_mini_page.dart';
import 'package:locapay/app/modules/proprio_principal/my_locations_pages/inactive_locations_mini_page.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyLocationsPage extends StatelessWidget {
  MyLocationsPage({super.key});
  final PageController _controller = PageController();
  final TextStyle activeStyle = const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: Color(0xFF313131),
  );

  final TextStyle inactiveStyle = const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(0, 0, 0, 0.25),
  );
  final RxBool _isServicePage = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
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
                      'Locations occupées',
                      style: _isServicePage.value ? activeStyle : inactiveStyle,
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
                      'Locations inactives',
                      style: _isServicePage.value ? inactiveStyle : activeStyle,
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
                expansionFactor: 1.01,
                spacing: 10,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.73,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                if (index == 0) {
                  _isServicePage.value = true;
                } else {
                  _isServicePage.value = false;
                }
              },
              children: const [
                ActiveLocationsMiniPage(),
                InactiveLocationsMiniPage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
