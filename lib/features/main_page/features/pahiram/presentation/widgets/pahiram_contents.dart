// Note: 'depende sa Toggle sa taas
import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/features/categories/presentation/widgets/category.dart';
import 'package:pahiream_frontend/features/main_page/features/pahiram/presentation/widgets/pahiram_card.dart';
import 'package:pahiream_frontend/features/main_page/features/pasabay/presentation/widgets/pasabay_card.dart';

class PahiramContents extends StatelessWidget {
  const PahiramContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Category(color: Colors.amber, category: 'School'),
        Text('Pahiram Cards:'),
        PahiramCards(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Pasabay Card(Courier):'),
            PasabayCards(),
              ],
            ),
            Column(
              children: [
            Text('Pasabay Card(Request):'),
            PasabayCards(),
              ],
            ),
          ],
        )
      ],
    );
  }
}
