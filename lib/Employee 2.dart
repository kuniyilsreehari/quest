import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class Employee2_reg extends StatefulWidget {
  @override
  _Employee2_regState createState() =>
      _Employee2_regState();
}

class _Employee2_regState
    extends State<Employee2_reg> {
  final _formKey = GlobalKey<FormState>();
  final _skillsController = TextEditingController();
  List<String> _selectedSkills = [];
  String? _selectedLocation;
  double? _expectedSalary;
  String? _selectedQualification;
  String? _selectedCVFile;

  void _addSkill() {
    if (_skillsController.text.isNotEmpty) {
      setState(() {
        _selectedSkills.add(_skillsController.text);
        _skillsController.clear();
      });
    }
  }
  Future<void> _pickCVFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        setState(() {
          _selectedCVFile = file.name;
        });
      } else {
        print('File picking canceled');
      }
    } on PlatformException catch (e) {
      print('Error picking file: $e');
    }
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission here
      print('Form submitted');
      print('Skills: $_selectedSkills');
      print('Location: $_selectedLocation');
      print('Expected Salary: $_expectedSalary');
      print('Qualification: $_selectedQualification');
      print('CV File: $_selectedCVFile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employee Registration',
          style: TextStyle(
            color: Colors.lightBlue,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.upload_file),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _pickCVFile();
                      },
                      child: Text(
                        'Choose Your CV',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    if (_selectedCVFile != null) SizedBox(width: 10),
                    if (_selectedCVFile != null) Text(_selectedCVFile ?? ''),
                  ],
                ),

                SizedBox(height: 5),
                // TextFormField(
                //   readOnly: true,
                //   initialValue: _selectedCVFile ?? '',
                //   decoration: InputDecoration(
                //     labelText: 'Selected CV',
                //     suffixIcon: IconButton(
                //       onPressed: _pickCVFile,
                //       icon: Icon(Icons.upload_file), // Changed icon here
                //     ),
                //   ),
                //   validator: (value) {
                //     if (_selectedCVFile == null) {
                //       return 'Please upload your CV';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _skillsController,
                  decoration: InputDecoration(labelText: 'Add Skills'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addSkill,
                  child: Text('Add Skill'),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: _selectedSkills
                      .map((skill) => Chip(
                    label: Text(skill),
                    onDeleted: () {
                      setState(() {
                        _selectedSkills.remove(skill);
                      });
                    },
                  ))
                      .toList(),
                ),
                SizedBox(height: 10),
                Text(
                  'Qualification*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField<String>(
                  value: _selectedQualification,
                  items: ['High School', "Bachelor's", "Master's", 'Ph.D.']
                      .map((String qualification) {
                    return DropdownMenuItem<String>(
                      value: qualification,
                      child: Text(qualification),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedQualification = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please choose your qualification';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Expected salary*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter salary',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your expectation';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _expectedSalary = double.tryParse(value);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _submitForm,
                    child: Text("Submit"),
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
