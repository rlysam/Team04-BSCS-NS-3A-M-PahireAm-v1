import 'package:division/division.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/utils/styles.dart';
import 'package:pahiream_frontend/widgets/global_widgets.dart';

class CreatePostDialog extends StatefulWidget {
  const CreatePostDialog({Key? key}) : super(key: key);

  @override
  _CreatePostDialogState createState() => _CreatePostDialogState();
}

class _CreatePostDialogState extends State<CreatePostDialog> {
  @override
  Widget build(BuildContext context) {
    var hintText2 = 'Title';
    var labelText2 = 'Post Title';
    return Dialog(
      child: Parent(
        style: styleCreatePostDialog,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Txt(
                    'Pasabay',
                    style: styleFABFont.clone()..textColor(kFontColorBlack),
                  ),
                  SelectType()
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: hintText2, labelText: labelText2),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: hintText2, labelText: labelText2),
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: hintText2, labelText: labelText2),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Txt('Quantity:'),
                  SizedBox(width: 5),
                  SetQty(),
                  SizedBox(width: 40),
                  const Txt('Rate/Commision'),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: hintText2, labelText: labelText2),
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Cubit

// import 'package:equatable/equatable.dart';

// NOTE No State needed

class QtyCubit extends Cubit<int> {
  QtyCubit() : super(1); //Page 1 muna

  void nextPage() => emit(state + 1);
  void prevPage() {
    if (state <= 1) {
      emit(1);
    } else {
      emit(state - 1);
    }
  }
}

class SetQty extends StatefulWidget {
  SetQty({Key? key}) : super(key: key);

  @override
  _SetQtyState createState() => _SetQtyState();
}

class _SetQtyState extends State<SetQty> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QtyCubit(),
      child: BlocConsumer<QtyCubit, int>(
        listener: (context, state) {},
        builder: (samContext, qty) {
          return Row(children: [
            ElevatedButton(
              onPressed: () => samContext.read<QtyCubit>().prevPage(),
              child: const Icon(Icons.remove_circle),
            ),
            SizedBox(width: 5),
            Txt(qty.toString(),style:styleFABFont..clone()..textColor(kFontColorBlack) ),
            // Container(
            //   width: 60,
            //   child: TextFormField(
            //     decoration: CommonStyleInput.textFieldStyle(
            //         hintTextStr: qty.toString()),
            //     initialValue: qty.toString(),
            //     readOnly: true,
            //   ),
            // ),
            SizedBox(width: 5),
            ElevatedButton(
              onPressed: () => samContext.read<QtyCubit>().nextPage(),
              child: const Icon(Icons.add_circle),
            )
          ]);
        },
      ),
    );
  }
}

class SelectType extends StatefulWidget {
  SelectType({Key? key}) : super(key: key);

  @override
  _SelectTypeState createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  var dropdownValue = 'Courier';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Courier',
        'Request',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
