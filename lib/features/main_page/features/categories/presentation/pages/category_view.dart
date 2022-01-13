import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/features/categories/presentation/widgets/category.dart';

class CategoryBuilder extends StatefulWidget {
  CategoryBuilder({Key? key}) : super(key: key);

  @override
  _CategoryBuilderState createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  @override
  Widget build(BuildContext context) {
    List<String> category = [
      'Delivery',
      'Request',
      'Convenience Store',
      'Mall',
      'Food Stall',
      'Print Station',
    ];
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Category(category: category[index]),
          );
        },
      ),
    );
  }
}
