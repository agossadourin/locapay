import 'package:flutter/material.dart';
import 'package:locapay/app/modules/principal/contracts/widgets/rule.dart';

class OwnersRulesPage extends StatelessWidget {
  const OwnersRulesPage({super.key});

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
                'Règles d’utilisation de l’application par les Propriétaires',
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
                  'Les locataires en signant leurs contrat de location, s’engagent solennellement à respecter toutes les clauses définies. En conséquence de quoi des sanctions pourraient être appliqué par rapport à leur compte (cas d’avertissement voir de bannissement)',
            ),
            const Rule(
              id: 3,
              isImportant: false,
              content:
                  'Les locataires tout comme les propriétaires ont l’obligations de rendre compte de leurs échanges avec les autres utilisateurs de l’application. Que ce soit avec un artisan, un propriétaire ou un locataire, l’utilisateur doit rendre compte pour le bon déroulement des procédures. Pour rendre compte, faire des suggestions ou vous plaindre, passez par le bouton “Ecrire à l’équipe”',
            ),
            const Rule(
              id: 4,
              isImportant: false,
              content:
                  'Tous les paiements doivent s’effectués sur l’application afin de permettre une traçabilité et d’assurer une bonne confiance entre les utilisateurs.La traçabilité évite bien des situations controverses en cas de litige. Ainsi, du paiement du loyer au règlement d’un service, toute transaction de tout utilisateur a l’obligation d’être exécutée dans l’application.',
            ),
            const Rule(
                id: 5,
                isImportant: false,
                content:
                    'Les locataires ont la libre possibilité de payer le loyer à leurs rythme dans les délais.En cas de retard de paiement, ils seront avertis. Pas plus de deux mois d’arriéré n’est permis.Au troisième mois, le locataire en infraction sera expulsé par une équipe spécialisée de LocaPay composée d’agent de la police républicaine. Son contrat sera donc résilié et la location sera à nouveau libre et disponible.'),
          ],
        ),
      ),
    );
  }
}
