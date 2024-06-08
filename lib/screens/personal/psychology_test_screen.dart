import 'package:flutter/material.dart';

class PsychologyTestScreen extends StatefulWidget {
  const PsychologyTestScreen({Key? key}) : super(key: key);

  @override
  _PsychologyTestScreenState createState() => _PsychologyTestScreenState();
}

class _PsychologyTestScreenState extends State<PsychologyTestScreen> {
  final List<List<String>> questions = [
    [
      'Ingénieur mécanique',
      'Chimiste/ Ingénieur chimiste',
      'Décorateur d\'intérieur',
      'Chargé de recrutement (RH)',
      'Entrepreneur',
      'Comptable',
    ],
    [
      'Ingénieur Travaux publics',
      'Journaliste',
      'Directeur de publicité',
      'Docteur médecin',
      'Fondateur d\'une entreprise',
      'Inspecteur de la qualité',
    ],
    [
      'Réparateur d\'ordinateurs',
      'Analyste de données',
      'Architecte',
      'Gestionnaire Ressources Humaines',
      'Politicien',
      'Réceptionniste dans un hôtel',
    ],
    [
      'Ingénieur civil',
      'Chercheur scientifique',
      'Expert en marketing',
      'Professeur',
      'Manager d’hôtel',
      'Assistant de direction',
    ],
    [
      'Chef cuisinier(e)',
      'Analyste en laboratoire',
      'Photographe',
      'Professionnel de la santé',
      'Capitaine dans une équipe',
      'Employé de bureau',
    ],
    [
      'Effectuer des travaux de peinture',
      'Faire des recherches scientifiques',
      'Ecrire des livres',
      'Organiser des événements',
      'Etre délégué de classe',
      'Corriger des erreurs dans un texte',
    ],
    [
      'Réparater des objects tech',
      'Résoudre des équations de maths',
      'Dessiner des décors / maisons',
      'Aider à résoudre les problèmes.',
      'Vendre des articles en ligne',
      'Classer les affaires dans l\'ordre',
    ],
    [
      'Prendre soin des animaux',
      'Ecrire des lignes de codes informatiques',
      'Faire du design graphique',
      'Aider les amis à faire leurs devoirs',
      'Créer ma chaîne Youtube',
      'Garder mon espace de travail en ordre',
    ],
    [
      'J\'aime fabriquer des objets',
      'J\'aime résoudre des énigmes',
      'J\'aime apprendre de nouvelles langues',
      'J\'aime travailler en équipe',
      'J\'ai un talent pour la vente',
      'J\'aime être précis dans mon travail',
    ],
    [
      'J\'ai des réflexes rapides',
      'J\'aime écrire',
      'Je suis fort en arts plastiques',
      'J\'aime animer des réunions',
      'J\'aime prendre des décisions',
      'J\'aime manipuler des chiffres',
    ],
    [
      'Réparer des produits électroniques',
      'Recherche en laboratoire',
      'Faire du montage vidéo',
      'J\'aime aider les autres',
      'J\'aime être le premier partout',
      'J\'aime observer les détails',
    ],
    [
      'J\'aime travailler en plein air',
      'Je suis passionné de sciences',
      'J’aime créer des oeuvres artistiques',
      'Je suis un bon communicant',
      'J\'aime défendre des causes humanitaires',
      'Je prends plaisir à arranger les objets',
    ],
    [
      'J\'aime les choses matérielles, concrètes',
      'Je suis curieux et j\'aime explorer',
      'Je suis perçu comme compliqué',
      'Je suis perçu comme une personne gentille',
      'Je suis perçu comme ambitieux',
      'J\'aime suivre des ordres bien claires',
    ],
    [
      'Je suis de nature plutôt réservée.',
      'Je suis de nature intellectuelle.',
      'Je suis imaginatif et intuitif.',
      'Les gens comptent sur mon aide.',
      'Je suis sociable et populaire.',
      'J\'aime garder mes sentiments pour moi',
    ],
    [
      'Je suis très sincère',
      'Je suis créatif pour résoudre',
      'Je cherche la perfection.',
      'Je suis d\'un naturel serviable',
      'J\'aime l’aventure',
      'Je suis méthodique et minutieux.',
    ],
    [
      'Je suis sincère et droit',
      'J\'aime m\'informer avant de décider.',
      'Je vis mes émotions avec intensité.',
      'Je pardonne facilement',
      'Je suis sûr de moi-même',
      'Je m’adapte bien à un travail routinier',
    ],
  ];

  int currentQuestionIndex = 0;
  final List<Set<int>> selectedAnswers = List.generate(16, (index) => <int>{});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test d\'Orientation MoonVocs'),
      ),
      body: currentQuestionIndex == 0 ? buildIntroPage(context) : buildQuestionPage(context),
    );
  }

  Widget buildIntroPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Vous ne savez pas quel métier choisir ou quelle formation suivre ? Découvrez votre profil et les métiers qui vous correspondent avec notre test d’orientation gratuit. Ce test vous aidera à cibler les études nécessaires pour atteindre votre objectif professionnel.\n\n'
                'Répondez sérieusement et honnêtement aux 16 questions, en sélectionnant 1 à 3 choix parmi les 6 proposés pour chaque question.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentQuestionIndex = 1;
              });
            },
            child: const Text('Commencer le test'),
          ),
        ],
      ),
    );
  }

  Widget buildQuestionPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Question $currentQuestionIndex',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16.0),
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: List.generate(6, (index) {
              bool isSelected = selectedAnswers[currentQuestionIndex - 1].contains(index);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedAnswers[currentQuestionIndex - 1].remove(index);
                    } else if (selectedAnswers[currentQuestionIndex - 1].length < 3) {
                      selectedAnswers[currentQuestionIndex - 1].add(index);
                    }
                  });
                },
                child: Card(
                  color: isSelected ? Colors.lightBlueAccent : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/psychology_test/${(currentQuestionIndex - 1) * 6 + index + 1}.png',
                          height: 80,
                          width: 80,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            questions[currentQuestionIndex - 1][index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              if (currentQuestionIndex < 16) {
                setState(() {
                  currentQuestionIndex++;
                });
              } else {
                showResults(context);
              }
            },
            child: const Text('Suivant'),
          ),
        ),
      ],
    );
  }

  void showResults(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Résultats du test'),
          content: const Text(
                'Tes réponses au test indiquent que tu es proche des profils suivants: Réaliste, Innovant et Entrepreneur.\n\n'
                'Pour une analyse personnalisée et approfondie de votre profil, MoonVocs vous propose des services de coaching en orientation scolaire et des experts métiers. Voici ce que nous offrons :\n\n'
                '  - Des entretiens pour découvrir votre personnalité et/ou analyser vos résultats scolaires.\n'
                '  - Des tests psychométriques d\'orientation reconnus internationalement.\n'
                '  - Un bilan personnalisé avec des suggestions concrètes de métiers et de formations adaptées à votre profil.\n\n'
                'Consultez nos prestations en appuyant sur l\'onglet correspondant dans l\'application.\n\n'
                'Pour plus d\'informations, contactez-nous au 05 xx xx xx xx ou par mail à moovocs@gmail.com.\n\n'
                'Pour une étude personnalisée et approfondie de votre profil qui vous permettra d’établir un projet d’orientation réfléchi, MoonVocs vous propose\n'
                'des formules qui combinent :\n\n'
                '  - Des entretiens de découverte de votre personnalité et d\'analyse de vos résultats scolaires avec un DUO d\'experts carrières et orientation scolaire\n'
                '  - Des tests psychométriques d\'orientation reconnus au niveau international\n'
                '  - Un bilan personnalisé avec des propositions de pistes concrètes de métiers et formations adaptés à votre profil.\n\n'
                'Consultez nos prestations et nos offres sur le site web : www.moonvocs.ma\n'
                'Demandez plus d\'information au 0661235623\n'
                'ou par mail à : contact@moonvocs.ma',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  currentQuestionIndex = 0;
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
