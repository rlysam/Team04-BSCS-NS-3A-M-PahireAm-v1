import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/features/notification_list_widget/data/models/request.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:pahiream_frontend/features/main_page/widgets/Header/features/notification_list_widget/presentation/widgets/notification_tile.dart';

class NotificationArea extends StatefulWidget {
  const NotificationArea({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationArea> createState() => _NotificationAreaState();
}

class _NotificationAreaState extends State<NotificationArea> {

  Future<List> getOffers() async {
    List<Request> allRequests = [];
    final response = await http.post(
        Uri.parse(
            'http://localhost/Team04-BSCS-NS-3A-M/pahiram_post/send_request'),
        body: {"user_id": "1"}); //laging 1 yung poster

    if (response.statusCode == 200) {
      // TODO  +=== ito yung kailangan isulat sa API return User.fromJson(json.decode(response.body));
      var value = Request.fromJson(json.decode(response.body));
      allRequests.add(value);
      return allRequests;
    } else if (response.statusCode == 404) {
      throw Exception('Error 404');
    } else if (response.statusCode == 401) {
      throw Exception('Error 401');
    } else {
      throw Exception('Failed to get requests.');
    }
  }

  var list_requests = [];

  @override
  void initState() async {
    super.initState();

    list_requests = getOffers() as List;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showGeneralDialog(
            barrierLabel: "Label",
            barrierDismissible: true,
            barrierColor: Colors.black.withOpacity(0.5),
            transitionDuration: const Duration(milliseconds: 300),
            context: context,
            pageBuilder: (context, anim1, anim2) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 600,
                  width: 400,
                  child: Material(
                    child:
                        // TODO ListView Builder parang sa Posts
                        ListView.builder(
                      itemCount: list_requests.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomNotificationWidget(
                            data: list_requests[index]);
                      },
                    ),
                  ),
                  margin:
                      const EdgeInsets.only(bottom: 50, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              );
            },
            transitionBuilder: (context, anim1, anim2, child) {
              return SlideTransition(
                position: Tween(
                        begin: const Offset(0.70, 0.025),
                        end: const Offset(0.39, 0.025))
                    .animate(anim1),
                child: child,
              );
            },
          );
        },
        icon: const Icon(Icons.notifications_active));
  }
}
