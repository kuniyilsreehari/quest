import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeacherRegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher Registration',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TeacherRegistrationScreen(),
    );
  }
}

class TeacherRegistrationScreen extends StatefulWidget {
  @override
  _TeacherRegistrationScreenState createState() =>
      _TeacherRegistrationScreenState();
}

class _TeacherRegistrationScreenState
    extends State<TeacherRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();

  String? _selectedGender;
  String? _selectedQualification;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic here
      print('Form submitted');
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Address: ${_addressController.text}');
      print('Gender: $_selectedGender');
      print('Phone Number: ${_phoneController.text}');
      print('Qualification: $_selectedQualification');
      print('Experience: ${_experienceController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){},
        ),
        title: Text('Teacher Registration',
          style: TextStyle(
            color: Colors.lightBlue,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5),
                Text(
                  'Full Name*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Email*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Address*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: 'Enter your address',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Choose Your Gender*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Male', 'Female', 'Other'].map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please choose your gender';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Phone-no*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Text(
                  'Qualification*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField<String>(
                  value: _selectedQualification,
                  items: [ 'Bachelor\'s', 'Master\'s', 'Ph.D.','Other\s']
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
                SizedBox(height: 5),
                Text(
                  'Wok Experience*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _experienceController,
                  decoration: InputDecoration(
                    hintText: 'Enter your Experience',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your experience';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Perform registration logic here
                      // You can send the form data to a server, save to a database, etc.
                    }
                  },
                  child: Text('Submit',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
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
