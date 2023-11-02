import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add background image

      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/welcome_bg_img.png"), // replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppBar(
            title: const Text(
              'Bienvenue',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Color(0xFF313131),
              ),
            ),
            centerTitle: true,
            backgroundColor:
                Colors.transparent, // make AppBar background transparent
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              )
            ],
            //menu hamburger with notification button at the right and title centered
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
