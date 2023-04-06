import 'package:flutter/material.dart';
class Classes extends StatefulWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        shadowColor: Colors.white.withOpacity(0.01),
        leading:
        Icon(Icons.message_sharp, color: Colors.black),
        title:
        Text(
          "Classes",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            child: ListView.builder(
                itemCount: 20,
                //separatorBuilder:(context,index)=> SizedBox(height:20.0),
                itemBuilder:(context,i){
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10,top: 20),
                    child: Container(
                      width: 80,
                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.green.shade800,
                            width: 2.0,
                            style: BorderStyle.solid
                        ),
                          borderRadius: BorderRadius.circular(45.0)
                      ),
                      child:
                      ListTile(
                        leading:Image.asset('assets/images/3.png',width: 50,height: 50,),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0,top: 5,bottom: 5),
                                  child: Row(
                                    children: [
                                      Text('T name',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),maxLines: 1, overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text('SU 05:00',style: TextStyle(fontSize: 17, color: Colors.black),maxLines: 1, overflow: TextOverflow.ellipsis),
                                    CheckboxListTile(value: _isChecked, onChanged: (bool? newValue){
                                      setState((){
                                        _isChecked= newValue;
                                      });
                                    },
                                      activeColor: Colors.white,
                                      checkColor: Colors.black,
                                      //controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                      ),
                    ),
                  );
              }),
          ),
        ),
      ),
    );
  }
}
