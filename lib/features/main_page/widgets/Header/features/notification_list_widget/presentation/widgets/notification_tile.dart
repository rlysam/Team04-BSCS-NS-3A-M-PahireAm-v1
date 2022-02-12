import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/features/notification_list_widget/data/models/request.dart';

class CustomNotificationWidget extends StatelessWidget {
// TODO After magawa nung widget
  final Request data;
  const CustomNotificationWidget({Key? key, required this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        leading: Image.network('https://i.imgur.com/YlBjThn.jpeg'),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Request ID: ${data.request_id}'),
                Text('First Name: ${data.first_name}'),
                Text('Last Name: ${data.last_name}'),
              ],
            ),
            Text('OFFER: PHP ${data.rate}'),
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
