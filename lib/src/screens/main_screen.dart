import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/src/settings/settings_controller.dart';
import 'package:recipe_app_flutter/src/settings/settings_view.dart';

class MainScreen extends StatelessWidget {
  final SettingsController controller;

  const MainScreen({super.key, required this.controller});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            iconSize: 34,
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SettingsView(
                  controller: controller,
                ),
              ),
            );
          },
          icon: Icon(Icons.account_circle),
          iconSize: 34,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Text(
                'Get cooking Today!',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SearchInput(),
            SizedBox(
              height: 5,
            ),
            CategoriesRecipe(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Text(
                '15 Recipe',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('Card'),
                ))
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<StatefulWidget> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 30,
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 32,
                minHeight: 30,
              ),
              labelText: 'Search'),
        ));
  }
}

class CategoriesRecipe extends StatelessWidget {
  const CategoriesRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
        height: 50,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(2),
          children: [
            ElevatedButton(onPressed: () {}, child: Text('All')),
            SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: Text('Main Course')),
            SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: Text('Soup')),
            SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: Text('Vegetables')),
            SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: Text('Drink')),
            SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: Text('Meat')),
          ],
        ));
  }
}
