import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/src/model/recipe_model.dart';

class DetailScreen extends StatelessWidget {
  final RecipeData recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Recipe',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actionsPadding: const EdgeInsets.only(right: 16.0),
          actions: [FavoriteButton()],
          backgroundColor: Colors.transparent,
          leadingWidth: 72,
          leading: Container(
              margin: const EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withAlpha(20)),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                iconSize: 28,
              ))),
      body: Center(
        child: Text(recipe.name),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  void _onSelectedFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 58,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withAlpha(20)),
        child: IconButton(
          onPressed: _onSelectedFavorite,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          iconSize: 30,
        ));
  }
}
