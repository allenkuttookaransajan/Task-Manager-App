import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewTaskPage extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const AddNewTaskPage(),
      );
  const AddNewTaskPage({super.key});

  @override
  State<AddNewTaskPage> createState() => _AddNewTaskPageState();
}

class _AddNewTaskPageState extends State<AddNewTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descrptionContoller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Color selectedColor = const Color.fromRGBO(246, 222, 194, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Task"),
        actions: [
          GestureDetector(
            onTap: () async {
              final _selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 90)),
              );
              if (_selectedDate != null) {
                setState(
                  () {
                    selectedDate = _selectedDate;
                  },
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat("MM-d-y").format(selectedDate),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              maxLines: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            ColorPicker(
              heading: const Text('Select Color'),
              subheading: const Text('Select a different shade'),
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
              color: selectedColor,
              pickersEnabled: const {
                ColorPickerType.wheel: true,
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
