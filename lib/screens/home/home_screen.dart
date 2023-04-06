import 'package:educational_center/screens/notification/notification_screen.dart';
import 'package:educational_center/screens/quiz/quiz_student_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const QuizStudentScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.mark_unread_chat_alt_sharp,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text(
          'Hello',
        ),
      ),
    );
  }
}
