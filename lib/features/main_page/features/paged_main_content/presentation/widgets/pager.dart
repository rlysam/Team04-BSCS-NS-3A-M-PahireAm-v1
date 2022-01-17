import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/paged_main_content/presentation/cubit/pager_cubit.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class PagerWidget extends StatefulWidget {
  PagerWidget({Key? key}) : super(key: key);

  @override
  _PagerWidgetState createState() => _PagerWidgetState();
}

class _PagerWidgetState extends State<PagerWidget> {
  @override
  Widget build(BuildContext context) {
    //TODO GAGANA BA TO KAHIT DI NAKALAGAY SA BLOCBUILDER?

    return BlocBuilder<PagerCubit, int>(
      builder: (context, pageNumber) {
        return BlocBuilder<SwitchButtonCubit, bool>(
          builder: (swCtx, isPasabay) {
            var data = swCtx.read<SwitchButtonCubit>();

            return Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<PagerCubit>().prevPage();
                    data.callSwitch();
                  },
                  child: const Icon(Icons.navigate_before),
                ),
                SizedBox(width: 5),
                Container(
                  width: 60,
                  child: TextFormField(
                    decoration: CommonStyleInput.textFieldStyle(
                        hintTextStr: pageNumber.toString()),
                    initialValue: pageNumber.toString(),
                    readOnly: true,
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    context.read<PagerCubit>().nextPage();
                    data.callSwitch();
                  },
                  child: const Icon(Icons.navigate_next),
                )
              ],
            );
          },
        );
      },
    );
  }
}
