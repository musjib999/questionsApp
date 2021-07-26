import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:pastq/shared/models/course_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static String assetName = 'assets/svg/search.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: 5),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(8),
                  child: TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                          bottom: 11,
                          top: 11,
                        ),
                      ),
                    ),
                    suggestionsCallback:
                        pastQservice.databaseService.getQuestionSuggestion,
                    itemBuilder: (context, Course? suggestion) {
                      final course = suggestion!;
                      return ListTile(
                        title: Text(course.title),
                      );
                    },
                    onSuggestionSelected: (Course? suggestion) {},
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    child: SvgPicture.asset(
                      assetName,
                      semanticsLabel: 'Search',
                      height: 300,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
