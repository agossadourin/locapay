import 'package:flutter/material.dart';
import 'package:locapay/app/modules/principal/contracts/widgets/rule.dart';

class ArtisansRulesPage extends StatelessWidget {
  const ArtisansRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'Règles d’utilisation de l’application par les Artisans',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            //continue here
            const Rule(
              id: 1,
              isImportant: true,
              content:
                  'Le non respect ne serait-ce que d’une seule règle ici citée est passible d’une sanction, d’une pénalité voir d’un bannissement définitif suivie de la rétention de votre nom sur la liste noir.',
            ),
            const Rule(
              id: 2,
              isImportant: false,
              content:
                  'Les artisans sont présentés dans l’application gratuitement et sont notés et mis en avant selon leurs critères et notes. A ce effet, LocaPay déduira 5% de commission sur toutes les prestations.',
            ),
          ],
        ),
      ),
    );
  }
}
