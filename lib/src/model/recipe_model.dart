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
    required this.ingredients,
    required this.measures,
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
        "120g",
        "60g",
        "60g",
        "300g",
        "30g",
        "30g",
        "120g",
        "¼ teaspoon",
        "to serve",
      ],
      ingredients: [
        "Plain Flour",
        "Caster Sugar",
        "Butter",
        "Braeburn Apples",
        "Butter",
        "Demerara Sugar",
        "Blackberrys",
        "Cinnamon",
        "Ice Cream",
      ]),
  RecipeData(
    name: 'Bread and Butter Pudding',
    instruction:
        "Grease a 1 litre/2 pint pie dish with butter.\r\nCut the crusts off the bread. Spread each slice with on one side with butter, then cut into triangles.\r\nArrange a layer of bread, buttered-side up, in the bottom of the dish, then add a layer of sultanas. Sprinkle with a little cinnamon, then repeat the layers of bread and sultanas, sprinkling with cinnamon, until you have used up all of the bread. Finish with a layer of bread, then set aside.\r\nGently warm the milk and cream in a pan over a low heat to scalding point. Don't let it boil.\r\nCrack the eggs into a bowl, add three quarters of the sugar and lightly whisk until pale.\r\nAdd the warm milk and cream mixture and stir well, then strain the custard into a bowl.\r\nPour the custard over the prepared bread layers and sprinkle with nutmeg and the remaining sugar and leave to stand for 30 minutes.\r\nPreheat the oven to 180C/355F/Gas 4.\r\nPlace the dish into the oven and bake for 30-40 minutes, or until the custard has set and the top is golden-brown.",
    category: 'Dessert',
    tags: 'Pudding,Brunch',
    imageUrl:
        'https://www.themealdb.com/images/media/meals/xqwwpy1483908697.jpg',
    ingredients: [
      "butter",
      "bread",
      "sultanas",
      "cinnamon",
      "milk",
      "double cream",
      "eggs",
      "sugar",
      "nutmeg",
    ],
    measures: [
      "25g/1oz",
      "8 thin slices",
      "50g/2oz",
      "2 tsp",
      "350ml/12fl",
      "50ml/2fl oz",
      "2 free-range",
      "25g/1oz",
      "grated, to taste",
    ],
  ),
  RecipeData(
      name: "Beef Wellington",
      instruction:
          "Put the mushrooms into a food processor with some seasoning and pulse to a rough paste. Scrape the paste into a pan and cook over a high heat for about 10 mins, tossing frequently, to cook out the moisture from the mushrooms. Spread out on a plate to cool.\r\nHeat in a frying pan and add a little olive oil. Season the beef and sear in the hot pan for 30 secs only on each side. (You don't want to cook it at this stage, just colour it). Remove the beef from the pan and leave to cool, then brush all over with the mustard.\r\nLay a sheet of cling film on a work surface and arrange the Parma ham slices on it, in slightly overlapping rows. With a palette knife, spread the mushroom paste over the ham, then place the seared beef fillet in the middle. Keeping a tight hold of the cling film from the edge, neatly roll the Parma ham and mushrooms around the beef to form a tight barrel shape. Twist the ends of the cling film to secure. Chill for 15-20 mins to allow the beef to set and keep its shape.\r\nRoll out the puff pastry on a floured surface to a large rectangle, the thickness of a £1 coin. Remove the cling film from the beef, then lay in the centre. Brush the surrounding pastry with egg yolk. Fold the ends over, the wrap the pastry around the beef, cutting off any excess. Turn over, so the seam is underneath, and place on a baking sheet. Brush over all the pastry with egg and chill for about 15 mins to let the pastry rest.\r\nHeat the oven to 200C, 400F, gas 6.\r\nLightly score the pastry at 1cm intervals and glaze again with beaten egg yolk. Bake for 20 minutes, then lower the oven setting to 180C, 350F, gas 4 and cook for another 15 mins. Allow to rest for 10-15 mins before slicing and serving with the side dishes of your choice. The beef should still be pink in the centre when you serve it.",
      category: "Beef",
      tags: "Meat,Stew",
      imageUrl:
          "https://www.themealdb.com/images/media/meals/vvpprx1487325699.jpg",
      ingredients: [
        "mushrooms",
        "English Mustard",
        "Olive Oil",
        "Beef Fillet",
        "Parma ham",
        "Puff Pastry",
        "Flour",
        "Egg Yolks",
      ],
      measures: [
        "400g",
        "1-2tbsp",
        "Dash",
        "750g piece",
        "6-8 slices",
        "500g",
        "Dusting",
        "2 Beaten",
      ]),
  RecipeData(
      name: "Chicken Enchilada Casserole",
      instruction:
          "Cut each chicken breast in about 3 pieces, so that it cooks faster and put it in a small pot. Pour Enchilada sauce over it and cook covered on low to medium heat until chicken is cooked through, about 20 minutes. No water is needed, the chicken will cook in the Enchilada sauce. Make sure you stir occasionally so that it doesn't stick to the bottom.\r\nRemove chicken from the pot and shred with two forks.\r\nPreheat oven to 375 F degrees.\r\nStart layering the casserole. Start with about ¼ cup of the leftover Enchilada sauce over the bottom of a baking dish. I used a longer baking dish, so that I can put 2 corn tortillas across. Place 2 tortillas on the bottom, top with ⅓ of the chicken and ⅓ of the remaining sauce. Sprinkle with ⅓ of the cheese and repeat starting with 2 more tortillas, then chicken, sauce, cheese. Repeat with last layer with the remaining ingredients, tortillas, chicken, sauce and cheese.\r\nBake for 20 to 30 minutes uncovered, until bubbly and cheese has melted and started to brown on top.\r\nServe warm.",
      category: "Chicken",
      tags: "Casserole,Cheasy,Meat",
      imageUrl:
          "https://www.themealdb.com/images/media/meals/qtuwxu1468233098.jpg",
      ingredients: [
        "Enchilada sauce",
        "shredded Monterey Jack cheese",
        "corn tortillas",
        "chicken breasts",
      ],
      measures: [
        "14 oz jar",
        "3 Cups",
        "6",
        "2",
      ]),
  RecipeData(
      name: "Chocolate Gateau",
      instruction:
          "Preheat the oven to 180°C/350°F/Gas Mark 4. Grease and line the base of an 8 in round spring form cake tin with baking parchment\r\nBreak the chocolate into a heatproof bowl and place over a saucepan of gently simmering water and stir until it melts. (or melt in the microwave for 2-3 mins stirring occasionally)\r\nPlace the butter and sugar in a mixing bowl and cream together with a wooden spoon until light and fluffy. Gradually beat in the eggs, adding a little flour if the mixture begins to curdle. Fold in the remaining flour with the cooled, melted chocolate and milk. Mix until smooth.\r\nSpread the mixture into the cake tin and bake for 50-55 mins or until firm in the centre and a skewer comes out cleanly. Cool for 10 minutes, then turn out and cool completely.",
      category: "Dessert",
      tags: "Cake,Chocolate,Desert,Pudding",
      imageUrl:
          "https://www.themealdb.com/images/media/meals/tqtywx1468317395.jpg",
      ingredients: [
        "Plain chocolate",
        "Butter",
        "Milk",
        "Eggs",
        "Granulated Sugar",
        "Flour",
      ],
      measures: [
        "250g",
        "175g",
        "2 tablespoons",
        "5",
        "175g",
        "125g",
      ])
];
