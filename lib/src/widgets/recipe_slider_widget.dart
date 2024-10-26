import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/src/model/recipe_model.dart';

class RecipeSliderWidget extends StatelessWidget {
  const RecipeSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: recipeDataList.map((recipe) {
          return Container(
              height: 500,
              width: 300,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white12,
                                      ),
                                      child: Text(
                                        recipe.category,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white12,
                                      ),
                                      child: Text(
                                        recipe.tags,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    ],
                  )));
        }).toList(),
      ),
    );
  }
}
