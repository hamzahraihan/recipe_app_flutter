import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/src/model/recipe_model.dart';
import 'package:recipe_app_flutter/src/screens/detail_screen.dart';

class RecipeSliderWidget extends StatelessWidget {
  final String selectedCategory;
  const RecipeSliderWidget({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = selectedCategory == 'All'
        ? recipeDataList
        : recipeDataList
            .where((recipe) =>
                recipe.category.toLowerCase() == selectedCategory.toLowerCase())
            .toList();

    return SizedBox(
      height: 500,
      child: filteredRecipes.isNotEmpty
          ? ListView(
              scrollDirection: Axis.horizontal,
              children: filteredRecipes.map((recipe) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DetailScreen()));
                    },
                    child: Container(
                        height: 500,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              clipBehavior: Clip.hardEdge,
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Image.network(
                                  recipe.imageUrl,
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  alignment: Alignment.bottomLeft,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        Colors.black.withAlpha(0),
                                        Colors.black26,
                                        Colors.black87
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            recipe.name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white12,
                                                ),
                                                child: Text(
                                                  recipe.category,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white12,
                                                ),
                                                child: Text(
                                                  recipe.tags,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            ))));
              }).toList(),
            )
          : SizedBox(
              height: 500,
              child: Center(
                child: Text(
                  'Oops, no recipe found!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }
}
