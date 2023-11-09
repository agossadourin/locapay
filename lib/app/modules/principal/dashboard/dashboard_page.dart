import 'package:flutter/material.dart';
import 'package:locapay/app/modules/principal/dashboard/widgets/dashboard_widget.dart';
import 'package:locapay/app/widgets/rect_action_button.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DashBoardWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.00,
          ),
          RectActionButton(
              action: 'Services',
              onPressed: () {},
              icon: 'assets/icons/services.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          RectActionButton(
              action: 'Transactions',
              onPressed: () {},
              icon: 'assets/icons/history.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          RectActionButton(
              action: 'Ecrire à l\'équipe',
              onPressed: () {},
              icon: 'assets/icons/email.png')
        ],
      ),
    );
  }
}
