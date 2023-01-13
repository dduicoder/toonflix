import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String thumb, title, id;

  const DetailScreen({
    super.key,
    required this.thumb,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          Center(
            child: Hero(
              tag: id,
              child: Container(
                width: 240,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 16,
                        offset: const Offset(0, 0),
                        color: Colors.black.withOpacity(0.25),
                      )
                    ]),
                child: Image.network(thumb),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
