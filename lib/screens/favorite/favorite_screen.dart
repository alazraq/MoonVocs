import 'package:flutter/material.dart';
import '../home/components/search_field.dart';

class FavoriteScreen extends StatefulWidget {
  final int initialTabIndex;

  const FavoriteScreen({Key? key, required this.initialTabIndex}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> ecoles = [];

  @override
  void initState() {
    super.initState();
    loadFormations();
    _tabController = TabController(length: 4, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> metiers = [
    {'title': 'Agent Arboricole', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Agent de Douane', 'image': 'assets/images/agent_de_douane.jpeg'},
    {'title': 'Agent de Sécurité', 'image': 'assets/images/agent_securite.jpeg'},
    {'title': 'Agriculteur', 'image': 'assets/images/agriculteur.jpeg'},
    {'title': 'Architecte', 'image': 'assets/images/architecte.jpg'},
    {'title': 'Artiste', 'image': 'assets/images/artiste.jpg'},
    {'title': 'Avocat', 'image': 'assets/images/avocat.jpg'},
    {'title': 'Bibliothécaire', 'image': 'assets/images/bibliothecaire.jpeg'},
  ];

  List<Map<String, dynamic>> formations = [
    {'title': 'Conseil Psycho-éducatif', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Géosciences, Modélisation et Enseignement', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Master Histoire Géographie méthodologies de recherche et méthodes d\'enseignement', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Licence d’éducation: Spécialité Enseignement Primaire – Langue Amazigh', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Licence d’Éducation: Spécialité Enseignement Secondaire – Langue anglaise', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Licence d’éducation: Spécialité Enseignement Secondaire – Etudes Islamique', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Licence d’éducation: Spécialité Enseignement Secondaire- Sciences de la Vie et la Terre', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Licence d’éducation: Spécialité Enseignement Secondaire -Philosophie', 'image': 'assets/images/agent_arboricole.jpeg'},
  ];

  List<Map<String, dynamic>> bourses = [
    {'title': 'Bourse d’étude: Ynov Campus - Maroc 2024', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Scholarship of Excellence: Al Akhawayn University - Morocco 2024', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Bourse d\'excellence: SUPEMIR - Maroc 2024', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Scholarships: University of Brighton - UK', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Bourse d\'excellence: SUPEMIR - Maroc 2024', 'image': 'assets/images/agent_arboricole.jpeg'},
  ];

  Future<String> loadAsset(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('assets/school_names.txt');
  }

  Future<void> loadFormations() async {
    String formationsString = await DefaultAssetBundle.of(context).loadString('assets/formations.txt');
    List<String> lines = formationsString.split('\n');

    Map<String, List<String>> schoolFormations = {};
    String currentSchool = '';

    for (var line in lines) {
      if (line.trim().isEmpty) {
        currentSchool = '';
      } else {
        if (currentSchool.isEmpty) {
          currentSchool = line;
          schoolFormations[currentSchool] = [];
        } else {
          schoolFormations[currentSchool]?.add(line);
        }
      }
    }

    setState(() {
      ecoles = schoolFormations.entries.map((entry) {
        return {
          'title': entry.key,
          'formations': entry.value,
          'image': 'assets/images/school_image.png' // Placeholder image for schools
        };
      }).toList();
    });
  }

  void showFormationsDialog(BuildContext context, List<String> formations) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Formations'),
          content: SingleChildScrollView(
            child: ListBody(
              children: formations.map((formation) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: TextStyle(fontSize: 20)),
                  Expanded(child: Text(formation)),
                ],
              )).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildGridItem(Map<String, dynamic> item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              item['image'],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.favorite_border, color: Colors.red, size: 14.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEcolesListItem(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () => _tabController.animateTo(2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.favorite_border, color: Colors.red, size: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  List<String> filiereDetails = [
    'INTITULÉ DE LA FILIÈRE: Conseil Psycho-éducatif',
    'OPTIONS : 1',
    'UNIVERSITÉ: Université Mohammed –V de Rabat',
    'ÉTABLISSEMENT: Ecole normale supérieure à Rabat',
    'CHAMP DISCIPLINAIRE À CHOISIR EN 1ÈRE ANNÉE : Sciences de l\'éducation',
    'DOMAINE À CHOISIR EN 2ÈME ANNÉE : Sciences de l\'éducation',
    'DISCIPLINE: Sciences de l\'éducation',
    'LANGUE(S) D’ENSEIGNEMENT DE LA FILIÈRE: ARABE',
  ];

  Widget buildFormationsListItem(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () => showFormationsDialog(context, filiereDetails),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.favorite_border, color: Colors.red, size: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridOrList(List<Map<String, dynamic>> items, {bool isGrid = true, bool isEcole = true}) {
    if (isGrid) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: items.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => buildGridItem(items[index]),
      );
    } else {
      return ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          if (isEcole) {
            return buildEcolesListItem(items[index]);
          } else {
            return buildFormationsListItem(items[index]);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Color tabBarLabelColor = Colors.black;
    Color tabBarUnselectedLabelColor = Colors.black;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const SearchField(),
          bottom: TabBar(
            controller: _tabController,
            labelColor: tabBarLabelColor,
            unselectedLabelColor: tabBarUnselectedLabelColor,
            indicatorColor: Color(0xFF8E24AA),
            tabs: const [
              Tab(text: 'Métiers'),
              Tab(text: 'Ecoles'),
              Tab(text: "Formations"),
              Tab(text: "Bourses"), // New Bourses tab
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            buildGridOrList(metiers, isGrid: true),
            buildGridOrList(ecoles, isGrid: false),
            buildGridOrList(formations, isGrid: false, isEcole: false),
            buildGridOrList(bourses, isGrid: false, isEcole: false), // New Bourses view
          ],
        ),
      ),
    );
  }
}
