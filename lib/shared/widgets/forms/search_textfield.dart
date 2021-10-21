import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Search...',
        ),
        maxLength: 7,
      ),
    );
  }
}
