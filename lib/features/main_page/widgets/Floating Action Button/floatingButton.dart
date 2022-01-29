// ignore: file_names
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return GestureDetector(
        onTap: () {},
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
