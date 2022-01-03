import 'package:flutter/material.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

//Accepts a string kung ano category
class Category extends StatelessWidget {
  final String category;
  final Color color;
  const Category({Key? key, required this.category, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
      child: Container(
          padding: EdgeInsets.all(6),
        decoration: CommonStyleCategoryBorder.boxDecoration(categoryColor: kPrimaryGreen),
        height: 100,
        child: AspectRatio(
            aspectRatio: 3/2,
          child: Center(
            child: Column(
              children: [
                Container(
                  color: color,
                  child: FittedBox(fit:BoxFit.cover, child: SizedBox.square(dimension: 60)),
                ),
                Text(category),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
