import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/paged_main_content/presentation/cubit/pager_cubit.dart';

class PagerWidget extends StatefulWidget {
  PagerWidget({Key? key}) : super(key: key);

  @override
  _PagerWidgetState createState() => _PagerWidgetState();
}

class _PagerWidgetState extends State<PagerWidget> {
//   var pageController = TextEditingController();
//   void changeValue(int page) {}

//   @override
//   void initState() {
//     super.initState();
//     // pageController.addListener(changeValue(int));
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagerCubit, int>(
      builder: (context, pageNumber) {
        return Row(
          children: [
            ElevatedButton(
              onPressed: () => context.read<PagerCubit>().prevPage(),
              child: const Icon(Icons.navigate_before),
            ),
            SizedBox(width: 5),
            // TextFormField(
            //     initialValue: pageNumber.toString(),
            //     controller: pageController),
            SizedBox(width: 5),
            ElevatedButton(
              onPressed: () => context.read<PagerCubit>().nextPage(),
              child: const Icon(Icons.navigate_next),
            )
          ],
        );
      },
    );
  }
}
