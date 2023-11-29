import 'package:cabskaro/controller/provider/categorie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  Category({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Consumer<CategoryProvider>(
      builder:(context, categoryProvider, _) {
        bool isSelected = categoryProvider.selectedCategory == title;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              categoryProvider.selectCategory(title);
              onTap();
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(100),
                color: isSelected ? Colors.blue : null,
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



