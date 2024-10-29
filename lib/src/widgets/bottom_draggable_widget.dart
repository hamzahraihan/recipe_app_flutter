import 'package:flutter/material.dart';

class DraggableSheet extends StatefulWidget {
  final dynamic recipe;
  final List<String>? measures;
  final String title;
  final double initialChildSize;
  final double minChildSize; // Minimum height when collapsed
  final double maxChildSize;
  const DraggableSheet(
      {super.key,
      required this.recipe,
      required this.title,
      this.measures,
      required this.initialChildSize,
      required this.maxChildSize,
      required this.minChildSize});

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

                      SizedBox(height: 16),
                      // Add your ingredients list here
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.recipe
                            .length, // Replace with your actual ingredients count
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.circle, size: 8),
                            title: Text(
                                "${widget.recipe[index]} = ${widget.measures?[index]}"),
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
    );
  }
}
