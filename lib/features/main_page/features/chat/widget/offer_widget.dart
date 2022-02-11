import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pahiream_frontend/utils/constants.dart';

class OfferWidget extends StatelessWidget {
// TODO After magawa nung widget
//   final Post data;
//   String
  const OfferWidget({Key? key}) : super(key: key);

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
        leading: Image.network('https://i.imgur.com/YlBjThn.jpeg'),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Post Dat'),
            Text('PHP 120.00'),
          ],
        ),
        subtitle: Row(
          children: [
            // TODO Create OFFER class, then send to Backend
            Text('PHP:'),
            SizedBox( width: 100, height: 40,
              child: TextFormField( cursorColor: kDark, decoration: inputDecoration,
              inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
  ],
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Send Offer')),
          ],
        ),
      ),
    );
  }
}
