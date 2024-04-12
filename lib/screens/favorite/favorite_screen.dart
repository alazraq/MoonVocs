import 'package:flutter/material.dart';
import '../home/components/search_field.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

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
    // Initialize TabController
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the TabController
    _tabController.dispose();
    super.dispose();
  }

  // Examples of métiers and formations, replace with your actual data
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


  /*
  final List<Map<String, dynamic>> formations = [
    {'title': 'EPFL', 'image': 'assets/images/EPFL.png'},
    {'title': 'CMU', 'image': 'assets/images/CMU.png'},
    {'title': 'DTU Denmark', 'image': 'assets/images/DTU.png'},
    {'title': 'MIT', 'image': 'assets/images/MIT.jpeg'},
  ];
*/
  // A simple grid item builder function
  Widget buildGridItem(Map<String, dynamic> item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias, // Ensures the image (or any other content) does not bleed over the edges of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch the column's children to fit the card's width
        children: <Widget>[
          Expanded(
            child: Image.asset(
              item['image'], // Replace with your actual image path
              fit: BoxFit.cover, // Cover the entire space of the container (cropping if necessary)
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
                    overflow: TextOverflow.ellipsis, // Prevents the text from overflowing
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

// A simple list item builder function
  Widget buildEcolesListItem(Map<String, dynamic> item) {
    return GestureDetector(
        onTap: () =>  _tabController.animateTo(2), // showFormationsDialog(context, item['formations']),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 100, // Control the height of the list item
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
        )
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

  // A simple list item builder function
  Widget buildFormationsListItem(Map<String, dynamic> item) {
    return GestureDetector(
        onTap: () =>  showFormationsDialog(context, filiereDetails),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 100, // Control the height of the list item
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
        )
    );
  }
// Build a grid or list based on the layout type
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
          // Use the activeTab parameter to determine which list item builder to use
          if (isEcole) { // Assuming the Ecoles tab is the second tab (index 1)
            return buildEcolesListItem(items[index]);
          } else {
            // Default to a basic list item or handle other cases
            return buildFormationsListItem(items[index]);
          }
        },
      );
    }
  }

// In the TabBarView, use buildGridOrList with isGrid parameter accordingly
  @override
  Widget build(BuildContext context) {
    Color tabBarLabelColor = Colors.black;
    Color tabBarUnselectedLabelColor = Colors.black;

    return DefaultTabController(
      length: 3,
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
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            buildGridOrList(metiers, isGrid: true), // Grid for Métiers
            buildGridOrList(ecoles, isGrid: false), // List for Ecoles
            buildGridOrList(formations, isGrid: false, isEcole: false), // List for Formations
          ],
        ),
      ),
    );
  }
}
