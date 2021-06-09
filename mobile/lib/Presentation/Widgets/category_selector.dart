import 'package:flutter/material.dart';

import 'package:mobile/Data_Layer/Models/category_model.dart';

class CategorySelector extends StatelessWidget {
  final List<Category> categoryList;

  const CategorySelector({Key? key, required this.categoryList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            int selectedIndex = index;
            return GestureDetector(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryList[index].name,
                    style: TextStyle(
                        fontSize: 22,
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.amber),
                  ),
                  Container(
                    height: 2,
                    width: 28,
                    color: selectedIndex == index
                        ? Colors.black
                        : Colors.transparent,
                    margin: EdgeInsets.only(top: 1.25),
                  )
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
