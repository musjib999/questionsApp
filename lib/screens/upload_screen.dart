import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:pastq/core/service_injector/service_injector.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  String courseCode = '';
  String courseTitle = '';
  String year = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController _courseCodeController = TextEditingController();
  TextEditingController _courseTitleController = TextEditingController();
  TextEditingController _yearController = TextEditingController();

  void clearFields() {
    setState(() {
      _courseCodeController.clear();
      _courseTitleController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uplaod Past Question'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownButtonFormField<dynamic>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a depertment';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text(
                    'Depertment',
                    style: TextStyle(color: Colors.grey),
                  ),
                  items:
                      pastQservice.dropDownHelper.getDepertmentDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      pastQservice.dropDownHelper.selectedDepertment = value;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField<dynamic>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select level';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text(
                    'Level',
                    style: TextStyle(color: Colors.grey),
                  ),
                  items: pastQservice.dropDownHelper.getLevelDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      pastQservice.dropDownHelper.selectedLevel = value;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField<dynamic>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select semester';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text(
                    'Semester',
                    style: TextStyle(color: Colors.grey),
                  ),
                  // value: _dropdownHelper.selectedSemester,
                  items: pastQservice.dropDownHelper.getSemesterDropdownItems(),
                  onChanged: (value) {
                    setState(() {
                      pastQservice.dropDownHelper.selectedSemester = value;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please supply a course code';
                    } else {
                      return null;
                    }
                  },
                  controller: _courseCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Course Code',
                  ),
                  maxLength: 7,
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please supply a course name';
                    } else {
                      return null;
                    }
                  },
                  controller: _courseTitleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Course Name',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please supply a year';
                    } else {
                      return null;
                    }
                  },
                  controller: _yearController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Year',
                  ),
                  maxLength: 4,
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(
                  height: 15,
                ),
                pastQservice.filePickerHelper.selectedfile == ''
                    ? GestureDetector(
                        onTap: () async {
                          await pastQservice.filePickerHelper.selectFile();
                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Upload Past Question',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.cloud_upload),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.only(left: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${pastQservice.filePickerHelper.fileName}'),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                pastQservice.filePickerHelper.selectedfile = '';
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                ArgonButton(
                  child: Text(
                    'Upload',
                    style: TextStyle(color: Colors.white),
                  ),
                  width: 300,
                  height: 45,
                  color: Color(0xff445B83),
                  onTap: (startLoading, stopLoading, btnState) async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      startLoading();
                      await pastQservice.databaseService
                          .uploadPastQuestion(
                        filePath: pastQservice.filePickerHelper.selectedfile,
                        fileName: _courseCodeController.text,
                        courseTitle: _courseTitleController.text,
                        depertment:
                            pastQservice.dropDownHelper.selectedDepertment,
                        level: pastQservice.dropDownHelper.selectedLevel,
                        semester: pastQservice.dropDownHelper.selectedSemester,
                        year: _yearController.text,
                      )
                          .then((url) {
                        pastQservice.databaseService.addPastQuestion({
                          'courseCode': _courseCodeController.text,
                          'title': _courseTitleController.text,
                          'question': url,
                          'year': _yearController.text,
                          'status': 0
                        }).then((value) {
                          stopLoading();
                          pastQservice.dialogInfoService.showDialog(
                            title: 'Success',
                            subtitle:
                                'Past Question uploaded and will be reviewd within the next 24hrs',
                            alertType: AlertType.success,
                            context: context,
                          );
                        });
                        clearFields();
                      });
                    }
                  },
                  loader: Container(
                    margin: EdgeInsets.all(15),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
