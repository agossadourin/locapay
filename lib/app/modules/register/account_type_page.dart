import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locapay/app/modules/register/controllers/account_type_controller.dart';
import 'package:locapay/app/modules/register/widgets/account_type.dart';
import 'package:locapay/app/widgets/action_button.dart';

class AccountTypePage extends StatelessWidget {
  const AccountTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Type de compte',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          const Text(
            'Quel type de compte souhaitez vous créer ?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
              height: 0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.find<AccountTypeController>().selectedIndex.value = 0;
              print('0 selected');
              print(Get.find<AccountTypeController>().selectedIndex.value);
            },
            child: AccountType(
              title: 'Locataire',
              iconUrl: 'assets/icons/locataire.png',
              body:
                  'Mettez vos locations en avant et trouvez de sérieux locataires dans le besoin',
              isSelected:
                  Get.find<AccountTypeController>().selectedIndex.value == 0
                      ? true
                      : false,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.find<AccountTypeController>().selectedIndex.value = 1;
            },
            child: AccountType(
              title: 'Propriétaire',
              iconUrl: 'assets/icons/proprietaire.png',
              body:
                  'Mettez vos locations en avant et trouvez de sérieux locataires dans le besoin',
              isSelected:
                  Get.find<AccountTypeController>().selectedIndex.value == 1
                      ? true
                      : false,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.find<AccountTypeController>().selectedIndex.value = 2;
            },
            child: AccountType(
              title: 'Artisan',
              iconUrl: 'assets/icons/artisan.png',
              body:
                  'Mettez vos locations en avant et trouvez de sérieux locataires dans le besoin',
              isSelected:
                  Get.find<AccountTypeController>().selectedIndex.value == 2
                      ? true
                      : false,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 310,
            child: Text(
              'Lire les Termes et Conditions d’utilisation',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF00DAB7),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ActionButton(
              action: 'Suivant',
              onPressed: () {
                Get.find<AccountTypeController>().isAccountTypeChosen.value =
                    true;
              })
        ],
      ),
    ));
  }
}
