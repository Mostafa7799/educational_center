import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:educational_center/controller/profile_controller/profile_cubit.dart';
import 'package:educational_center/screens/course/Classes%20time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Matt.dart';
import '../QuizS.dart';
import '../aboutUs.dart';
import '../homeNotActive.dart';
import '../notification/notification_screen.dart';
import '../profile/student/student_profile.dart';
import '../timetable.dart';
import 'home_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = const [
    HomeScreen(),
    Classes(),
    TimeTable(endPoint: 'user/todayCoursesList'),
    ProfileStudent(),
  ];
  int currentIndex = 0;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await ProfileCubit.get(context).getStudentProfile();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is StudentProfileErrorState) {
          return const Center(
            child: Text('No Data'),
          );
        }
        if (state is StudentProfileLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return ProfileCubit.get(context).emailVerifiedAt == null
            ? const HomeNotActive()
            : Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Educational Center",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const NotificationScreen();
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.mark_unread_chat_alt_sharp,
                        color: Colors.orange,
                        size: 30,
                      ),
                    )
                  ],
                ),
                // body: screens[currentIndex],
                bottomNavigationBar: CurvedNavigationBar(
                  index: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  height: 50,
                  backgroundColor: Colors.white,
                  color: const Color(0xFF002746),
                  items: [
                    CustomNav(
                      icon: 'assets/images/home.png',
                    ),
                    CustomNav(
                      icon: 'assets/images/ach.png',
                    ),
                    CustomNav(
                      icon: 'assets/images/checklist.png',
                    ),
                    CustomNav(
                      icon: 'assets/images/user.png',
                    ),
                  ],
                ),
                body: screens[currentIndex],
              );
      },
    );
  }
}
