import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
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
          actions: [
            Container(
                height: 70,
                width: 58,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withAlpha(20)),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  iconSize: 30,
                )),
          ],
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
        child: Text('Hello world!'),
      ),
    );
  }
}
