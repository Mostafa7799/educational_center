import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.near_me,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Teacher message',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '2022-2-2',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 28.0,
                  ),
                  child: Text(
                    'working in postman but failing with Dio. Ive tried wrapping it in the fromMap call and it was no different than how I have it below',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
