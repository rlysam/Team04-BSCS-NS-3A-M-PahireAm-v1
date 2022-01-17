import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/post.dart';
import 'package:pahiream_frontend/utils/styles.dart';

class MyPost extends StatelessWidget {
  final Post data; 
  const MyPost({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Post data = Provider.of<Post>(context);
    bool isPahiram = data.rent_due.isNotEmpty;
    String title = isPahiram ? data.item : data.title;

    return Container(
      alignment: Alignment.bottomCenter,
      height: 150.3,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 715 * .95),
        child: Parent(
            style: styleServiceCard,
            child: Container(
              child: Row(
                children: [
                  Container(
                      constraints: const BoxConstraints(
                          minWidth: 130,
                          maxWidth: 130,
                          minHeight: 130,
                          maxHeight: 130),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(data.image_location),
                      ))),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Txt(title,
                                style: styleServiceTitle),
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                               Txt(isPahiram?('Pahiram'):('Pasabay')),
                               SizedBox(width:30),
                                Txt(data.type),
                            ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                               IconButton(onPressed: (){},icon: Icon(Icons.delete)),
                               SizedBox(width:30),
                               IconButton(onPressed: (){},icon: Icon(Icons.edit)),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
