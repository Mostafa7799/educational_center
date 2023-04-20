import 'package:educational_center/controller/profile_controller/profile_cubit.dart';
import 'package:educational_center/screens/profile/teacher/teacher_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TeachersSearch extends StatefulWidget {
  const TeachersSearch({Key? key}) : super(key: key);

  @override
  State<TeachersSearch> createState() => _TeachersSearchState();
}

class _TeachersSearchState extends State<TeachersSearch> {
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    await ProfileCubit.get(context).getTeacherList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        shadowColor: Colors.white.withOpacity(0.01),
        title: const Text(
          "Teachers",
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var teachers = ProfileCubit.get(context).teacherList;
          if (state is TeacherListErrorState) {
            return const Center(
              child: Text('No Data'),
            );
          }
          if (state is TeacherListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.5, color: Colors.orange),
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1.5, color: Colors.orange),
                          borderRadius: BorderRadius.circular(45.0)),
                      hintText: "Name of Teacher...",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemCount: teachers.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20.0),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                    teachers[index].image ??
                                        'https://cdn-icons-png./1048/1048949.png',
                                  ),
                                  // child:image==null? Text(data),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      teachers[index].username!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      teachers[index].subject?[index].name ??
                                          'none',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 35,
                                      itemCount: teachers[index].rate ?? 3,
                                      minRating: .5,
                                      maxRating: 5,
                                      initialRating:
                                          teachers[index].rate?.toDouble() ?? 3,
                                      allowHalfRating: true,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (value) {
                                        return;
                                      },
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TeacherProfile(
                                                teacherModel: teachers[index],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return Colors.orange;
                                          }
                                          return Colors.green;
                                        }),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "View",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
