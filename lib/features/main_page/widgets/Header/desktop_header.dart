import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/widgets/pahiream_switch.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/features/notification_list_widget/presentation/widgets/notification_area.dart';
import 'package:pahiream_frontend/features/main_page/widgets/Header/landing_location_cubit.dart';
import 'package:pahiream_frontend/features/profile/presentation/pages/user_profile.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class MyDesktopHeader extends StatefulWidget {
  const MyDesktopHeader({Key? key}) : super(key: key);

  @override
  State<MyDesktopHeader> createState() => _MyDesktopHeaderState();
}

class _MyDesktopHeaderState extends State<MyDesktopHeader> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<LandingLocationCubit, bool>(
      builder: (context, mainLocation) {
        var data = context.read<LandingLocationCubit>();
        var inputDecoration = InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(15, 5, 11, 5),
            // labelText: '',
            hintText: 'Search',
            filled: true,
            fillColor: const Color(0xFFEDEEF2),
            enabledBorder: (OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10))),
            suffixIcon: const Icon(Icons.search_outlined),
            border: (OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10))));

        return Container(
            height: 60,
            alignment: const Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130.0),
              child: Container(
                // color: kPrimaryGreen,
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            data.goToMain();
                          },
                          child: Row(
                            children: [
                              BlocBuilder<SwitchButtonCubit, bool>(
                                builder: (context, isPasabay) {
                                  return CircleAvatar(
                                      backgroundColor: isPasabay
                                          ? kPrimaryGreen.withOpacity(0.3)
                                          : kPrimaryPink.withOpacity(0.3),
                                      radius: 25,
                                      // child: FlutterLogo( size: 30,));
                                      child: Image.asset(
                                          ('assets/images/Vector.png')));
                                },
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Pahire',
                                style: CommonStyleText.txtStyle(
                                    color: kPrimaryGreen,
                                    size: 30,
                                    weigth: bold),
                              ),
                              Text(
                                'Am',
                                style: CommonStyleText.txtStyle(
                                    color: kPrimaryPink,
                                    size: 30,
                                    weigth: bold),
                              ),
                              const SizedBox(width: 48),
                              SizedBox(
                                width: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                        cursorColor: kDark,
                                        decoration: inputDecoration)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          //   ! BELL ICON Notification
                          const NotificationArea(),
                          const SwitchPahireAm(),
                          const SizedBox(width: 30),
                          GestureDetector(
                            onTap: () => data.goToUserProfile(),
                            child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: ProfilePicture(
                                    radius2: 30, radius3: 27, radius4: 23)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
