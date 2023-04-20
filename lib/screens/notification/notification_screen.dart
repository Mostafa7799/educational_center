import 'package:educational_center/controller/home_controller/home_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await HomeControllerCubit.get(context).getMessagesList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
        ),
      ),
      body: BlocBuilder<HomeControllerCubit, HomeControllerState>(
        builder: (context, state) {
          var messagesList = HomeControllerCubit.get(context).messageList;
          if (state is MessageListErrorState) {
            return const Center(
              child: Text('No Data'),
            );
          }
          if (state is MessageListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return messagesList!.isEmpty
              ? const Center(
                  child: Text('No Data'),
                )
              : ListView.builder(
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    DateTime apiDate = DateTime.parse(messagesList[index].updatedAt!);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.near_me,
                                color: Colors.orange,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Teacher message',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                DateFormat('yyyy-MM-dd').format(apiDate),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 28.0,
                            ),
                            child: Text(
                              messagesList[index].text!,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
