import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

//Accepts a string kung ano category
class Category extends StatelessWidget {
  final String category;
  const Category({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchButtonCubit, bool>(
      builder: (context, isPasabay) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: CommonStyleCategoryBorder.boxDecoration(
                categoryColor: isPasabay? kPrimaryGreen: kPrimaryPink),
            height: 100,
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      color: isPasabay? kPrimaryGreen: kPrimaryPink,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox.square(dimension: 60)),
                    ),
                    Text(category),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
