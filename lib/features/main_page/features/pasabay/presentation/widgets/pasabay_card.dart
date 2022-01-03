// Note: Responsive text FLUTTER:
// https://www.youtube.com/watch?v=0O_qDZ48F7o

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class PasabayCards extends StatelessWidget {
  const PasabayCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url =
        'https://images.unsplash.com/photo-1512820790803-83ca734da794?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
    return SizedBox(
      width: 339,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 16,
        child: InkWell(
          onTap: () => print('Pindot card ka HUH'),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PictureAndBanner(url: url),
              //!Details
              Padding(
                padding: const EdgeInsets.fromLTRB(6.0, 10.0, 6.0, 0),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PostTitle(),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => print('Tapped the More Icons'),
                          child: const Icon(Icons.more_horiz),
                        ),
                      )
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(height: 10),
                      DayRatesRow(),
                      SecondRowPasabay(),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 16, color: kFontColorBlack),
                          SizedBox(width: 5),
                          Text('7-Eleven'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.more_vert,
                              size: 16, color: kFontColorBlack),
                          SizedBox(width: 5),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropPointsAndDatePosted(),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                                onTap: () {
                                  print('\n\nSino kakausapin mo gagu');
                                },
                                child: Icon(Icons.mode_comment_outlined)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              //ButtonBAr
            ],
          ),
        ),
      ),
    );
  }
}


class DayRatesRow extends StatelessWidget {
  const DayRatesRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.schedule, size: 16, color: kFontColorBlack),
        SizedBox(width: 5),
        Text('9:30 - 10:00am'),
        SizedBox(width: 5),
        Icon(Icons.fiber_manual_record, size: 16, color: Colors.blue),
        SizedBox(width: 5),
        Text('PhP 10.00/item'),
      ],
    );
  }
}

class SecondRowPasabay extends StatelessWidget {
  const SecondRowPasabay({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.person, size: 16, color: kFontColorBlack),
        SizedBox(width: 5),
        Text('Hakuna Matata'),
        SizedBox(width: 5),
        Icon(Icons.fiber_manual_record, size: 16, color: Colors.blue),
        SizedBox(width: 5),
        Text('Basic', style: CommonStyleText.txtStyle(color: kPrimaryPink)),
      ],
    );
  }
}

class PostTitle extends StatelessWidget {
  const PostTitle({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      'Physics Book Vol. 1',
      style: CommonStyleText.txtStyle(size: 16, weigth: bold),
    );
  }
}

class DropPointsAndDatePosted extends StatelessWidget {
  const DropPointsAndDatePosted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.local_shipping,
                size: 16, color: kFontColorBlack),
            SizedBox(width: 5),
            Text('Cafa, CoS, CiT'),
          ],
        ),
        Row(
          children: [
            Icon(Icons.calendar_today,
                size: 16, color: kFontColorBlack),
            SizedBox(width: 5),
            Text('Date posted: '),
          ],
        ),
      ],
    );
  }
}

class PictureAndBanner extends StatelessWidget {
  const PictureAndBanner({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // !Picture
      alignment: Alignment.topRight,
      children: [
        Container(
            // width: 339,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.fitWidth))),
        Banner()
      ],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: null,
      // ! Banner Color
      color: const Color.fromARGB(255, 221, 114, 107),
      padding: const EdgeInsets.all(5.0),
      // ! Banner Text
      child: Text(
        'Accepting Requests'.toUpperCase(),
        style: CommonStyleText.txtStyle(
            weigth: bold, color: kFontColorWhite, size: 14),
      ),
    );
  }
}
