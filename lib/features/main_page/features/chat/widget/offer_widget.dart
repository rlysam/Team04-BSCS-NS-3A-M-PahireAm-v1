import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/post.dart';
import 'package:pahiream_frontend/utils/constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class OfferWidget extends StatelessWidget {
// TODO After magawa nung widget
  final Post data;
//   String
  const OfferWidget({Key? key, required this.data}) : super(key: key);

  sendOffer(Post data) async {
// String datetime = DateTime.now().toString();
    final response = await http.post(
        // Uri.parse('http://localhost/Team04-BSCS-NS-3A-M/Register/insert_user'),
        //yung function na hahanapin si x user using email and pass
        Uri.parse(
            'http://localhost/Team04-BSCS-NS-3A-M/pahiram_post/send_request'),
        body: {
          "post_id": data.post_id,
          "poster_id": data.user_id,

          //! NAKA LOGIN
          "user_id": "2", //laging 2 yung requestor
          "first_name": "Requestor Fname",
          "last_name": "Requestor Lname",

          "type": data.type, //Pahiram Pasabay
          "rate": data.rate,
          "status": data.status,

          //   "location": data.location,
          //   "destination": data.destination,
          //   "quantity": data.quantity,
        });
  }

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(15, 5, 11, 5),
        // labelText: '',
        hintText: 'Search',
        filled: true,
        fillColor: const Color(0xFFEDEEF2),
        enabledBorder: (OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10))),
        // suffixIcon: const Icon(Icons.search_outlined),
        border: (OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10))));
    return Expanded(
      child: ListTile(
        leading: Image.network(data.image_location),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Post Date ${data.date}'),
            Text('PHP ${data.rate}'),
          ],
        ),
        subtitle: Row(
          children: [
            // TODO Create OFFER class, then send to Backend
            Text('PHP:'),
            SizedBox(
              width: 100,
              height: 40,
              child: TextFormField(
                cursorColor: kDark,
                decoration: inputDecoration,
                // controller: ,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  sendOffer(data);
                },
                child: const Text('Send Offer')),
          ],
        ),
      ),
    );
  }
}
