import 'package:flutter/material.dart';
import 'package:pahiream_frontend/utils/constants.dart';

class MyTabletHeader extends StatelessWidget {
  const MyTabletHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      color: kPrimaryGreen,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: TextFormField()),
                GestureDetector(
                  child: const Icon(Icons.search),
                )
              ],
            ),
          ),
        Text(size.width.toString()+' Size'),
          const Text('Ikaw ay nasa T A B L E T Header'),
        ],
      ),
    );
  }
}
