import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:division/division.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/datasources/create_post.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';
import 'package:pahiream_frontend/utils/constants.dart';
import 'package:pahiream_frontend/utils/styles.dart';

class CreatePostDialog extends StatefulWidget {
//   TODO ito lagay yung update post
  const CreatePostDialog({Key? key}) : super(key: key);

  @override
  _CreatePostDialogState createState() => _CreatePostDialogState();
}

class _CreatePostDialogState extends State<CreatePostDialog> {
  List<TextEditingController> _textFieldControllers =
      List.generate(5, (i) => TextEditingController());

  @override
  void dispose() {
    super.dispose();
    _textFieldControllers[0].dispose();
    _textFieldControllers[1].dispose();
    _textFieldControllers[2].dispose();
    _textFieldControllers[3].dispose();
    _textFieldControllers[4].dispose();
  }

  FilePickerResult? pickedImage;
  Uint8List? logoBase64;

  void chooseImage() async {
    pickedImage = await FilePicker.platform.pickFiles();

    if (pickedImage != null) {
      try {
        setState(() {
          logoBase64 = pickedImage!.files.first.bytes;
          print('\n\n\n\n\n');
          print('FileName:::: ');
          print(pickedImage!.names.elementAt(0).toString());
          print('\n\n\n\n\n');
        });
      } catch (err) {
        print(err);
      }
    } else {
      print('No Image Selected');
    }
  }

  Future<void> createPost(
    String? title,
    String? type,
    String? location,
    String? destination,
    String? quantity,
    String? rate,
    // String? image_location,
  ) async {
    //show your own loading or progressing code here

    String datetime = DateTime.now().toString();

    String uploadurl =
        "http://localhost/Team04-BSCS-NS-3A-M/Pasabay_post/create_post";
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    try {
      //   List<int> imageBytes = logoBase64.readAsBytesSync();
      //   String baseimage = base64Encode(imageBytes);
      String baseimage = base64Encode(logoBase64!);
      //convert file image to Base64 encoding
      var s = "Seller Fname";
      var response = await http.post(Uri.parse(uploadurl), body: {
        'user_id': "1", // Laging 1

        'first_name': s,
        'last_name': "Seller Lname",

        'points': "2",
        'time_posted': datetime,
        'date': datetime,

        'title': title,
        'type': type, //Pahiram Pasabay

        'location': location,
        //'destination': destination,
        //'quantity': quantity,

        'rate': rate,
        'image_location': {'product_image/' + datetime + '/' + s}.toString(),

        'image': baseimage,
        'image_name': pickedImage!.names.elementAt(0).toString(),
        // 'chat_type': 'image',
        // 'post_id': "74", // sample lng to
        // 'user_id': "1", //sample lang din to
        // 'palagay dito yung filetype kung di kaya filename kung di kaya file path'
      });

      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body); //decode json data
        if (jsondata["error"]) {
          //check error sent from server
          print(jsondata["msg"]);
          //if error return from server, show message from server
        } else {
          print("Upload successful");
        }
      } else {
        print("Error during connection to server");
        //there is error during connecting to server,
        //status code might be 404 = url not found
      }
    } catch (e) {
      print("Error during converting to Base64");
      //there is error during converting file image to base64 encoding.
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Title',
      'Location',
      'Destination',
      'Rate',
      'Delivery Time',
    ];

    return BlocBuilder<SwitchButtonCubit, bool>(
      builder: (context, isPasabay) {
        String dropdownValue = isPasabay ? 'Courier' : 'Rentor';
        return BlocProvider(
          create: (context) => TypeCubit(),
          child: BlocProvider(
            create: (context) => QtyCubit(),
            child: Dialog(
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
                            isPasabay ? 'Pasabay' : 'Pahiram',
                            style: styleFABFont.clone()
                              ..textColor(kFontColorBlack),
                          ),
                          StatefulBuilder(
                            builder: (BuildContext context, setState) {
                              return DropdownButton<String>(
                                value: dropdownValue,
                                elevation: 16,
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                    height: 2, color: Colors.deepPurpleAccent),
                                onChanged: (newType) {
                                  setState(() => dropdownValue = newType!);
                                  // TODO
                                  print('\n' + newType!);
                                  // !pano ma capture 'tong Type
                                  // For repository
                                  // typeContext.read<TypeCubit>().changeType(newType!);
                                },
                                items: <String>[
                                  isPasabay ? 'Courier' : 'Rentor',
                                  isPasabay ? 'Request' : 'Rentee'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              );
                            },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _textFieldControllers[0],
                              decoration: InputDecoration(
                                // hintText: hintText2,
                                labelText: labels[0],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _textFieldControllers[1],
                              decoration: InputDecoration(
                                labelText: labels[1],
                              ),
                            ),
                          ),
                          const SizedBox(width: 40),
                          isPasabay
                              ? Expanded(
                                  child: TextFormField(
                                    controller: _textFieldControllers[2],
                                    decoration: InputDecoration(
                                      labelText: labels[2],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Row(
                        children: [
                          const Txt('Quantity:'),
                          const SizedBox(width: 5),
                          SetQty(),
                          const SizedBox(width: 10),
                          Expanded(
                              child: TextFormField(
                                  controller: _textFieldControllers[3],
                                  decoration: InputDecoration(
                                    labelText: labels[3],
                                  ))),
                          const SizedBox(width: 10),
                          Expanded(
                              child: TextFormField(
                                  controller: _textFieldControllers[4],
                                  decoration: InputDecoration(
                                    labelText: labels[4],
                                  ))),
                          const SizedBox(width: 5),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ElevatedButton(
                              onPressed: () => chooseImage(),
                              child: const Txt('Upload Image')),
                          ElevatedButton(
                              onPressed: () {
                                List<String> data = [];

                                createPost(
                                  _textFieldControllers[0].text,
                                  isPasabay ? 'Pasabay' : 'Pahiram',
                                  _textFieldControllers[1].text,
                                  _textFieldControllers[2].text,
                                  '1',
                                  _textFieldControllers[3].text,
                                  //   image_location,
                                );
                                // Wala lang destination yung Pahiram
                                // TODO  --- Call repository to send all these data to backend
                                //   isPasabay ? (dropdownValue,
                                //   _textFieldControllers[0],
                                //   ):,
                              },
                              child: const Txt('Submit')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//Cubit

// import 'package:equatable/equatable.dart';

// NOTE No State needed

// class PahiramType extends Cubit<String> {
//   PahiramType() : super('Rentor'); //Page 1 muna
//   void courier() => emit('Rentor');
//   void request() => emit('Rentee');
// }

class TypeCubit extends Cubit<String> {
  TypeCubit() : super('Courier'); //Page 1 muna
  void changeType(String currentType) => emit(currentType);
}

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
    return BlocConsumer<QtyCubit, int>(
      listener: (context, state) {},
      builder: (samContext, qty) {
        return Row(children: [
          ElevatedButton(
            onPressed: () => samContext.read<QtyCubit>().prevPage(),
            child: const Icon(Icons.remove_circle),
          ),
          const SizedBox(width: 5),
          Txt(qty.toString(),
              style: styleFABFont
                ..clone()
                ..textColor(kFontColorBlack)),
          const SizedBox(width: 5),
          ElevatedButton(
            onPressed: () => samContext.read<QtyCubit>().nextPage(),
            child: const Icon(Icons.add_circle),
          )
        ]);
      },
    );
  }
}

// class SelectType extends StatefulWidget {
//   SelectType({
//     Key? key,
//   }) : super(key: key);
//   @override
//   _SelectTypeState createState() => _SelectTypeState();
// }

// class _SelectTypeState extends State<SelectType> {
//   @override
//   Widget build(BuildContext context) {
//     // var dropdownValue = isPasabay ? 'Courier' : 'Rentor';
//     return BlocBuilder<TypeCubit, String>(
//       builder: (typeContext, type) {
//         return BlocBuilder<SwitchButtonCubit, bool>(
//           builder: (context, isPasabay) {
//             // para sa likod
//             // typeContext.read<TypeCubit>().changeType(dropdownValue);
//             return;
//           },
//         );
//       },
//     );
//   }
// }
