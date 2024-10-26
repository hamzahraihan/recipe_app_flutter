class RecipeData {
  String name;
  String instruction;
  String category;
  String tags;
  String imageUrl;
  List<String> measures;
  List<String> ingredients;

  RecipeData({
    required this.name,
    required this.instruction,
    required this.category,
    required this.tags,
    required this.imageUrl,
    required this.measures,
    required this.ingredients,
  });
}

List<RecipeData> recipeDataList = [
  RecipeData(
    name: 'Apple Frangipan Tart',
    instruction:
        'Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream.',
    category: 'Dessert',
    tags: 'Tart,Baking,Fruity',
    imageUrl:
        'https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg',
    ingredients: [
      "digestive biscuits",
      "butter",
      "Bramley apples",
      "butter, softened",
      "caster sugar",
      "free-range eggs, beaten",
      "ground almonds",
      "almond extract",
      "flaked almonds",
    ],
    measures: [
      "175g/6oz",
      "75g/3oz",
      "200g/7oz",
      "75g/3oz",
      "75g/3oz",
      "2",
      "75g/3oz",
      "1 tsp",
      "50g/1¾oz",
    ],
  ),
  RecipeData(
      name: 'Apple & Blackberry Crumble',
      instruction:
          "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
      category: 'Dessert',
      tags: 'Pudding',
      imageUrl:
          'https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg',
      measures: [
        "Plain Flour",
        "Caster Sugar",
        "Butter",
        "Braeburn Apples",
        "Butter",
        "Demerara Sugar",
        "Blackberrys",
        "Cinnamon",
        "Ice Cream",
      ],
      ingredients: [
        "120g",
        "60g",
        "60g",
        "300g",
        "30g",
        "30g",
        "120g",
        "¼ teaspoon",
        "to serve",
      ])
];
