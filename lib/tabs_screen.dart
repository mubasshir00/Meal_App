import 'package:flutter/material.dart';
import 'package:meal_app/main_drawer.dart';
import 'package:meal_app/models/meal.dart';
import '/favourites_screen.dart';
import '/category_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;
  TabsScreen(this.favoritesMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(widget.favoritesMeals),
        'title': 'Your Favorite'
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category_outlined),
              label: 'Cateogory'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favortie')
        ],
      ),
    );
  }
}

//top tab bar
// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.star,
//                 ),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(children: <Widget>[
//           CategoryScreen(),
//           FavouritesScreen()
//         ],),
//       ),
//     );
//   }
// }
