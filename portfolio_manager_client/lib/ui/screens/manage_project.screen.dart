import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageProjectPage extends ConsumerStatefulWidget {

  const ManageProjectPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ManageProjectPage> createState() => _ManageProjectPageState();
}

class _ManageProjectPageState extends ConsumerState<ManageProjectPage> {
  // Controller for text fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  // Variables to store state of checkboxes
  List<String> _categories = [];
  Map<String, bool> _categoryValues = {
    'Category 1': false,
    'Category 2': false,
    'Category 3': false,
    // Add more categories as needed
  };

  // Variables to store selected files
  List<String> _selectedFiles = [];

  // Function to handle form submission
  void _submitForm() {
    // Handle form submission here
    // You can access form data from controllers and variables
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Project'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Date'),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _linkController,
              decoration: const InputDecoration(labelText: 'Link'),
            ),
            const SizedBox(height: 20.0),
            const Text('Categories', style: TextStyle(fontSize: 18.0)),
            const SizedBox(height: 10.0),
            Column(
              children: _categoryValues.keys.map((String category) {
                return CheckboxListTile(
                  title: Text(category),
                  value: _categoryValues[category],
                  onChanged: (bool? value) {
                    setState(() {
                      if(value != null){
                        _categoryValues[category] = value;
                        if (value) {
                          _categories.add(category);
                        } else {
                          _categories.remove(category);
                        }
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20.0),
            const Text('Files', style: TextStyle(fontSize: 18.0)),
            const SizedBox(height: 10.0),
            // You can implement file selection here
            // This is just a placeholder
            ElevatedButton(
              onPressed: () {
                // Implement file selection
              },
              child: const Text('Select Files'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}