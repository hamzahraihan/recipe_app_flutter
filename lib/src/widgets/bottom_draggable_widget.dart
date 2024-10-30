import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/src/model/recipe_model.dart';

class DraggableSheet extends StatefulWidget {
  final RecipeData recipe;
  final String title;
  final double initialChildSize;
  final double minChildSize; // Minimum height when collapsed
  final double maxChildSize;
  final Color draggableColor;
  const DraggableSheet(
      {super.key,
      required this.recipe,
      required this.title,
      required this.initialChildSize,
      required this.maxChildSize,
      required this.minChildSize,
      required this.draggableColor});

  @override
  State<StatefulWidget> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet>
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
      final scrollPosition = ((newSize - widget.minChildSize) /
              (widget.maxChildSize - widget.minChildSize))
          .clamp(0.0, 1.0);
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
    return DraggableScrollableSheet(
      initialChildSize: widget.initialChildSize, // Initial height of the sheet
      minChildSize: widget.minChildSize, // Minimum height when collapsed
      maxChildSize: widget.maxChildSize, // Maximum height when expanded
      snap: true, // Enable snapping
      snapAnimationDuration: const Duration(milliseconds: 150),
      controller: _dragController,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: widget.draggableColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                            widget.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RotationTransition(
                            turns: _rotationAnim,
                            child: IconButton(
                                onPressed: () {
                                  if (_dragController.size >
                                      widget.minChildSize) {
                                    _dragController.animateTo(
                                        widget.minChildSize,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                  } else {
                                    _dragController.animateTo(
                                        widget.maxChildSize,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.ease);
                                  }
                                },
                                icon: Icon(Icons.keyboard_arrow_up)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // Add your ingredients list here
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: widget.title == 'Ingredients'
                            ? widget.recipe.ingredients
                                .asMap()
                                .entries
                                .map((entry) {
                                final index = entry.key;
                                final ingredient = entry.value;
                                return ListTile(
                                  leading: Icon(Icons.circle, size: 8),
                                  title: Text(
                                      '$ingredient = ${widget.recipe.measures[index]}'),
                                );
                              }).toList()
                            : [Text(widget.recipe.instruction)],
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
