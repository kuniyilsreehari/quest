import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

import 'drawer_page.dart';

void main() => runApp(Reg2());

class Reg2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  var items = [
    'Select your Location',
    'Calicut(Kerala,Vadakara)',
    'Kannur',
    'Kochi',
    'Kottayam',
    'Edukki',
    'Wayanad'
  ];
  String dropdownvalue = 'Select your Location';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FilePickerResult? _cvFile;
  TextEditingController _skillsController = TextEditingController();
  TextEditingController _expectedSalaryController = TextEditingController();
  List<String> _typedSkills = [];

  Future<void> _pickCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _cvFile = result;
      });
    }
  }

  void _addSkill() {
    String skill = _skillsController.text.trim();
    if (skill.isNotEmpty && !_typedSkills.contains(skill)) {
      setState(() {
        _typedSkills.add(skill);
        _skillsController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String cvFileName = _cvFile != null ? _cvFile!.files.single.name : '';

    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTRATION FORM 2'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                onPressed: _pickCV,
                icon: Icon(Icons.upload_file),
                label: Text('*Choose File (PDF only)'),
              ),
              SizedBox(height: 10),
              Text('Uploaded CV: $cvFileName'),
              SizedBox(height: 20),
              TextFormField(
                controller: _skillsController,
                decoration: InputDecoration(labelText: 'Skills*'),
                onChanged: (value) {
                  setState(() {
                    // Update the skills value
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addSkill,
                child: Text('Add Skill'),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _typedSkills.map((skill) {
                  return Chip(
                    label: Text(skill),
                    onDeleted: () {
                      setState(() {
                        _typedSkills.remove(skill);
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: widget.dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: widget.items.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.dropdownvalue = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select your Location',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _expectedSalaryController,
                keyboardType: TextInputType.number, // Only allow numbers
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: 'Expected Salary(LPA)'),
                onChanged: (value) {
                  setState(() {
                    // Update the expected salary value
                  });
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  child: const Text("REGISTER"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
