import 'package:flutter/material.dart';

class CourseCard extends StatefulWidget {
   CourseCard({
    Key? key,
    required this.subjectName,
    required this.day,
    required this.time,
     this.iconCourse,
  }) : super(key: key);
  final String subjectName;
  final String day;
  final String time;
  Widget? iconCourse;

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10,
        top: 20,
      ),
      child: Container(
        width: 80,
        height: 85,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.green.shade800,
                width: 2.0,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(45.0)),
        child: ListTile(
          leading: Image.asset(
            'assets/images/1.png',
            width: 50,
            height: 50,
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.subjectName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${widget.day}, ${widget.time}',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Flexible(
                      child: widget.iconCourse!,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
