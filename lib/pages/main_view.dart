import 'package:flutter/material.dart';
import 'package:nature_emoi_collection/constants.dart';
import 'package:nature_emoi_collection/pages/register_plant_page.dart';

import 'collection_page.dart';
import 'home_page.dart';

class MainView extends StatefulWidget {
 
  @override
  _MainViewState createState() => _MainViewState();
}
 
class _MainViewState extends State<MainView> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CollectionPage(),
    RegisterPlantPage()
  ];

  final List _titles = [
    'À découvrir',
    'Ma collection',
    'Ajouter une plante'
  ];
 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Nature Emoi', style: TextStyle(color: graphMap['grey'], fontFamily: "Kanit", fontSize: 18.0),), 
                    Text(_titles[_selectedIndex], style: TextStyle(color: graphMap['black'], fontFamily: "Kanit", fontSize: 24.0, fontWeight: FontWeight.bold),)]),
        backgroundColor: graphMap['white'],
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      backgroundColor: graphMap['white'],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Collection'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Ajouter',
          ),
        ],
        unselectedLabelStyle: TextStyle(fontFamily: "Kanit"),
        selectedLabelStyle: TextStyle(fontFamily: "Kanit"),
        currentIndex: _selectedIndex,
        selectedItemColor: graphMap['selectedIcon'],
        unselectedItemColor: graphMap['white'],
        backgroundColor: graphMap['green'],
        onTap: _onItemTapped,
      ),
    );
  }
}