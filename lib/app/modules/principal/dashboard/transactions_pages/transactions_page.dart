import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/widgets/payment_widget.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/widgets/services_widget.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/widgets/rent_transactions_widget.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/widgets/services_transactions_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TransactionsPage extends StatelessWidget {
  TransactionsPage({super.key});
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
  final RxBool _isRentPage = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/welcome_bg_img.png"), // replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: const Text(
                    'Transactions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF303030),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  centerTitle: true,
                  // green with opacity of 0.5
                  backgroundColor:
                      const Color(0xFF00DBB7), // green with opacity of 0.5
                  elevation: 0,

                  //menu hamburger with notification button at the right and title centered
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
                Container(
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
                                  'Loyers',
                                  style: _isRentPage.value
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
                                  'Services',
                                  style: _isRentPage.value
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
                            expansionFactor: 1.01,
                            spacing: 10,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: PageView(
                          controller: _controller,
                          onPageChanged: (index) {
                            if (index == 0) {
                              _isRentPage.value = true;
                            } else {
                              _isRentPage.value = false;
                            }
                          },
                          children: const [
                            RentTransactionsWidget(),
                            ServicesTransactionsWidget()
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
