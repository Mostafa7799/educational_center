import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final String? courseName;
  final String? time;
  final int? index;

  const CustomTable({
    super.key,
    required this.courseName,
    required this.time,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      child: Table(
        children: [
          TableRow(
            children: [
              Container(
                height: 40,
                width: 100,
                color: Colors.teal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.date_range,
                    ),
                    Text(
                      "  Today Courses",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *.8,
                child: ListView.builder(
                  itemCount: index,
                  itemBuilder: (context,index){
                    return Container(
                      height: 40,
                      width: 100,
                      color: Colors.orange,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            time!,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            color: Colors.black87,
                            height: 20,
                            width: 1.9,
                          ),
                           Text(
                             courseName!,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
