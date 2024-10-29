import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/src/model/recipe_model.dart';

class DetailScreen extends StatefulWidget {
  final RecipeData recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  final DraggableScrollableController _dragController =
      DraggableScrollableController();

  late final AnimationController _animController;
  late final Animation<double> _rotationAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    // Add listener to track sheet position changes
    _rotationAnim =
        Tween<double>(begin: 0.0, end: 0.5).animate(_animController);

    _dragController.addListener(() {
      final newSize = _dragController.size;
      final scrollPosition = ((newSize - 0.10) / (0.3 - 0.10)).clamp(0.0, 1.0);
      _animController.animateTo(scrollPosition, duration: Duration.zero);
    });
  }

  @override
  void dispose() {
    _dragController.dispose();
    _animController.dispose();
    super.dispose();
  }

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
                    widget.recipe.name,
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
                          widget.recipe.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Draggable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.10, // Initial height of the sheet
            minChildSize: 0.10, // Minimum height when collapsed
            maxChildSize: 0.4, // Maximum height when expanded
            snap: true, // Enable snapping
            snapAnimationDuration: const Duration(milliseconds: 150),
            controller: _dragController,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Content
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ingredients',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RotationTransition(
                                  turns: _rotationAnim,
                                  child: IconButton(
                                      onPressed: () {
                                        if (_dragController.size > 0.10) {
                                          _dragController.animateTo(0.10,
                                              duration: const Duration(
                                                  milliseconds: 100),
                                              curve: Curves.ease);
                                        } else {
                                          _dragController.animateTo(0.4,
                                              duration: const Duration(
                                                  milliseconds: 100),
                                              curve: Curves.ease);
                                        }
                                      },
                                      icon: Icon(Icons.keyboard_arrow_up)),
                                )
                              ],
                            ),

                            SizedBox(height: 16),
                            // Add your ingredients list here
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  10, // Replace with your actual ingredients count
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(Icons.circle, size: 8),
                                  title: Text('Ingredient ${index + 1}'),
                                );
                              },
                            ),

                            SizedBox(height: 24),
                            Text(
                              'Instructions',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            // Add your instructions here
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  5, // Replace with your actual instructions count
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'Step ${index + 1} instructions go here. Replace this with your actual recipe instructions.',
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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
