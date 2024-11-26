import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/src/model/recipe_model.dart';
import 'package:recipe_app_flutter/src/widgets/bottom_draggable_widget.dart';

class DetailScreen extends StatelessWidget {
  final RecipeData recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Recipe',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
            )),
      ),
      body: Stack(
        children: [
          // Background content
          SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Text(
                    recipe.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          recipe.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  recipe.description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(
                  color: theme.colorScheme.primaryContainer.withAlpha(80),
                  width: 1.0,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(14.0),
                height: 230,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(recipe.category,
                              style: TextStyle(fontSize: 12.0)),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Tags',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SizedBox(
                              width: 150,
                              child: Text(
                                recipe.tags,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                                overflow: TextOverflow.clip,
                              )),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Difficulty',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            recipe.difficulty,
                            style: TextStyle(fontSize: 12.0),
                            softWrap: true,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          // Draggable Bottom Sheet
          DraggableSheet(
            recipe: recipe,
            draggableColor: theme.colorScheme.secondaryContainer,
            initialChildSize: 0.20,
            minChildSize: 0.20,
            maxChildSize: 0.6,
            title: 'Instruction',
          ),
          DraggableSheet(
            recipe: recipe,
            draggableColor: theme.colorScheme.primaryContainer,
            initialChildSize: 0.10,
            minChildSize: 0.10,
            maxChildSize: 0.6,
            title: 'Ingredients',
          ),
        ],
      ),
    );
  }
}

// FavoriteButton remains the same

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
