// ignore: file_names
import 'dart:html';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/chat/widget/custom_chat_widget.dart';
import 'package:pahiream_frontend/features/main_page/features/chat/widget/offer_widget.dart';
import 'package:pahiream_frontend/features/main_page/features/post/features/create_post/presentation/widgets/create_post_widget.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/utils/styles.dart';

class FloatingBtnPahireAm extends StatefulWidget {
  const FloatingBtnPahireAm({Key? key}) : super(key: key);

  @override
  _FloatingBtnPahireAmState createState() => _FloatingBtnPahireAmState();
}

class _FloatingBtnPahireAmState extends State<FloatingBtnPahireAm> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: styleFloatingActionButton,
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [ChatButton(), SizedBox(width: 20), CreatePostBtn()],
        ),
      ),
    );
  }
}

class CreatePostBtn extends StatelessWidget {
  const CreatePostBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          SwitchButtonCubit myLoginCubit =
              BlocProvider.of<SwitchButtonCubit>(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return BlocProvider<SwitchButtonCubit>.value(
                    value: myLoginCubit, child: const CreatePostDialog());
              });
        },
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Parent(
              style: styleCreatePostBtn,
              child: Container(
                child: Txt(
                  'New Post',
                  style: styleFABFont
                    ..clone()
                    ..padding(horizontal: 8),
                ),
              ),
            )));
  }
}

class ChatButton extends StatelessWidget {
  const ChatButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
        onTap: () {
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
                    child: ListView(
                        children: [
                   OfferWidget(),
                   CustomChatWidget(),
                        ],
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              );
            },
            transitionBuilder: (context, anim1, anim2, child) {
              return SlideTransition(
                position: Tween(begin: const Offset(0.70, 0.025), end: const Offset(0.39, 0.025))
                    .animate(anim1),
                child: child,
              );
            },
          );
        },
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Parent(
              style: styleChatBtn,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 5),
                    Icon(Icons.message, color: kWhite),
                    Txt('CHAT', style: styleFABFont),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            )));
  }
}
