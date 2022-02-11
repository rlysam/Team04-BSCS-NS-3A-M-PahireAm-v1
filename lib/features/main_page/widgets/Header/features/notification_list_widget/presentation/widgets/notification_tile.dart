import 'package:flutter/material.dart';

class CustomNotificationWidget extends StatelessWidget {
// TODO After magawa nung widget
//   final Post data;
//   String
  const CustomNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        leading: Image.network('https://i.imgur.com/YlBjThn.jpeg'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Post Dat'),
            Text('PHP 120.00'),
          ],
        ),
        subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Accept')),
            ElevatedButton(onPressed: () {}, child: const Text('Decline')),
          ],
        ),
      ),
    );
  }
}
