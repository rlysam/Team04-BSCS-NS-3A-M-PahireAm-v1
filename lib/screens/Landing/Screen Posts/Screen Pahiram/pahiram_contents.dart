// Note: 'depende sa Toggle sa taas
import 'package:flutter/material.dart';
import 'package:pahiream_frontend/screens/Landing/Screen%20Posts/Screen%20Pahiram/Widgets/pahiram_card.dart';
import 'package:pahiream_frontend/screens/Landing/Screen%20Posts/Screen%20Pasabay/Widgets/pasabay_card.dart';
import 'package:pahiream_frontend/screens/Landing/Screen%20Posts/Widgets/Categories%20Widget/category.dart';

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
