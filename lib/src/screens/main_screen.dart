import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/src/model/recipe_model.dart';
import 'package:recipe_app_flutter/src/settings/settings_controller.dart';
import 'package:recipe_app_flutter/src/settings/settings_view.dart';
import 'package:recipe_app_flutter/src/widgets/recipe_slider_widget.dart';

class MainScreen extends StatefulWidget {
  final SettingsController controller;

  const MainScreen({
    super.key,
    required this.controller,
  });

  static const routeName = '/';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String selectedCategory = 'All';

  void _onSelectedCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SettingsView(
                    controller: widget.controller,
                  ),
                ),
              );
            },
            icon: Icon(Icons.menu),
            iconSize: 34,
          ),
        ],
        leading: IconButton(
          onPressed: () {},
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
            CategoriesRecipe(
              onSelectedCategory: _onSelectedCategory,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Text(
                '${recipeDataList.length.toString()} Recipe',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            RecipeSliderWidget(
              selectedCategory: selectedCategory,
            )
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

class CategoriesRecipe extends StatefulWidget {
  final ValueChanged<String> onSelectedCategory;
  const CategoriesRecipe({super.key, required this.onSelectedCategory});

  @override
  State<CategoriesRecipe> createState() => _CategoriesRecipeState();
}

class _CategoriesRecipeState extends State<CategoriesRecipe> {
  int? activeButtonIndex = 0;

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
            _button(0, 'All'),
            SizedBox(width: 8),
            _button(1, 'Dessert'),
            SizedBox(width: 8),
            _button(2, 'Beef'),
            SizedBox(width: 8),
            _button(3, 'Vegetables'),
            SizedBox(width: 8),
            _button(4, 'Drink'),
            SizedBox(width: 8),
            _button(5, 'Meat'),
          ],
        ));
  }

  Widget _button(int index, String label) {
    final theme = Theme.of(context);
    final activeColor = theme.colorScheme.primary; // Color for active button
    final activeTextColor =
        theme.colorScheme.onPrimary; // Text color on active button
    final inactiveTextColor =
        theme.colorScheme.onSurface; // Text color on inactive button

    final bool isActive = activeButtonIndex == index;
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: isActive ? activeColor : null,
            foregroundColor: isActive ? activeTextColor : inactiveTextColor),
        onPressed: () {
          setState(() {
            activeButtonIndex = index;
          });
          widget.onSelectedCategory(label);
        },
        child: Text(label));
  }
}
