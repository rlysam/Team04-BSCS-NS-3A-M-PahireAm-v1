import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pahiream_frontend/features/main_page/features/switch_button/data/models/switch.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class SwitchPahireAm extends StatefulWidget {
  const SwitchPahireAm({
    Key? key,
    // required this.myValue,
  }) : super(key: key);

  @override
  State<SwitchPahireAm> createState() => _SwitchPahireAmState();
}

class _SwitchPahireAmState extends State<SwitchPahireAm> {
  void changeSwitchValue(BuildContext context, bool value) {
    final switchCubit = context.read<SwitchButtonCubit>();
  }

  @override
  Widget build(BuildContext context) {
    //   TODO Pano a-access dito yung weather.isPasabay

    return BlocBuilder<SwitchButtonCubit, bool>(
      builder: (context, state) {
          var switchValue = context.read<SwitchButtonCubit>().state;
          var data = context.read<SwitchButtonCubit>();
          print("State: $state"); print("Switch Value:$switchValue"); print("Data: $data");
        return Row(
          children: [
            Text(
              switchValue ? 'Pahiram' : 'Pasabay',
              style: CommonStyleText.txtStyle(
                  color: switchValue ? kPrimaryGreen : kPrimaryPink,
                  size: 24, weigth: bold),
            ),
            const SizedBox(width: 20),
            Transform.scale(
              scale: 1.7,
              child: Switch(
                  activeColor: kPrimaryGreen,
                  inactiveThumbColor: kPrimaryPink,
                  inactiveTrackColor: kPrimaryPink.withOpacity(.5),
                  value: switchValue,
                  onChanged: (value) => data.changeValue(value)),
            ),
          ],
        );
      },
    );
  }
}
