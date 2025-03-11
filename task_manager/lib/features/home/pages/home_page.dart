import 'package:flutter/material.dart';
import 'package:task_manager/core/constants/utils.dart';
import 'package:task_manager/features/home/pages/add_new_task_page.dart';
import 'package:task_manager/features/home/widgets/date_selector.dart';
import 'package:task_manager/features/home/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Tasks"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, AddNewTaskPage.route());
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const DateSelector(),
          Row(
            children: [
              Expanded(
                child: TaskCard(
                    color: const Color.fromRGBO(246, 222, 194, 1),
                    headerText: 'Test Task',
                    descriptionText:
                        'This is a new task about checking how long the lines can go if it goes longer than expected it can result in which is due to the overflow mechanism kicking in This is a new task about checking how long the lines can go if it goes longer than expected it can result in which is due to the overflow mechanism kicking inThis is a new task about checking how long the lines can go if it goes longer than expected it can result in which is due to the overflow mechanism kicking inThis is a new task about checking how long the lines can go if it goes longer than expected it can result in which is due to the overflow mechanism kicking in This is a new task about checking how long the lines can go if it goes longer than expected it can result in which is due to the overflow mechanism kicking in'),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: strengthenColor(
                    const Color.fromRGBO(246, 222, 194, 1),
                    0.69,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '10:00AM',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
