import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/features/notification_list_widget/data/models/request.dart';

class CustomNotificationWidget extends StatelessWidget {
// TODO After magawa nung widget
//   final Request data;
  const CustomNotificationWidget({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        leading: Image.network('https://i.imgur.com/YlBjThn.jpeg'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text('Request ID: '),
                Text('Last Name: '),
              ],
            ),
            Text('OFFER: PHP 120.00'),
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
