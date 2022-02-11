import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:pahiream_frontend/features/main_page/features/chat/widget/offer_widget.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/features/notification_list_widget/presentation/widgets/notification_tile.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/utils/styles.dart';

class NotificationArea extends StatelessWidget {
  const NotificationArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
            onPressed: () {
              // TODO gawin kagaya sa chat Button
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
                        ListView(
                      children:  const [
                        CustomNotificationWidget(),
                        CustomNotificationWidget(),
                        CustomNotificationWidget(),
                        CustomNotificationWidget(),
                        CustomNotificationWidget(),
                        CustomNotificationWidget(),
                        CustomNotificationWidget(),
                        CustomNotificationWidget(),
                        CustomNotificationWidget(),
                        CustomNotificationWidget(),
                        //    OfferWidget(),
                        //    CustomChatWidget(),
                      ],
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
