import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class TeachersSearch extends StatefulWidget {
  const TeachersSearch({Key? key}) : super(key: key);

  @override
  State<TeachersSearch> createState() => _TeachersSearchState();
}

class _TeachersSearchState extends State<TeachersSearch> {
  List<String> name =['Mohamed'];

  get image => image;

  Image logoWidget({required String imageName,required double width, required double height}){
    return Image.asset(imageName,
      fit:BoxFit.fitHeight,
      width:width,
      height:height,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        shadowColor: Colors.white.withOpacity(0.01),
        leading:
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.message_outlined, color: Colors.black),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
           if (states.contains(MaterialState.pressed)) {
              return Colors.white;
           }
              return Colors.white;
              }),
        ),
        ),
        title:
          Text(
              "Teachers",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [],
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Center(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text("Search:",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.orange),),
              )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                  child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5,color: Colors.orange),
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.5,color: Colors.orange),
                              borderRadius: BorderRadius.circular(45.0)
                          ),
                          hintText: "Name of Teacher...",
                          prefixIcon:Icon(Icons.search,color: Colors.orange,),
                        ),
                  ),
                ),
              //ImageProvider image,
               SafeArea(
                 child: Container(
                      child: SizedBox
                        (width: 1000,height: 500,
                        child: Padding(
                          padding: const EdgeInsets.only(left:0.0,top: 10),
                          child: ListView.separated(
                              itemCount: 3,
                              separatorBuilder:(context,index)=> SizedBox(height:20.0),
                              scrollDirection: Axis.vertical,
                              itemBuilder:(context,i){
                                return SafeArea(
                                  child: Container(
                                  child: Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: NetworkImage('https://scontent.fcai22-2.fna.fbcdn.net/v/t39.30808-6/313895300_1713055272421336_4576919179340951637_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=uGOdeUYs91IAX8Wwkhb&_nc_ht=scontent.fcai22-2.fna&oh=00_AfDsqRMuPUcF4rljgqyxJIQlgoBG_hlxAo1reATlyFVifA&oe=642509BE',),
                                        // child:image==null? Text(data),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Text(
                                          name.toString(),style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 1, overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 3),
                                        Text("English",style: TextStyle(),maxLines: 1, overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),SizedBox(width: 20,),
                                    Column(
                                      children: [
                                        RatingBar.builder(itemSize: 35,itemCount: 4,minRating: .5,allowHalfRating: true,
                                            itemBuilder: (context,index) => const Icon(
                                          Icons.star,color: Colors.green,
                                        ), onRatingUpdate: (value){
                                          return print(value);
                                        }),
                                        ElevatedButton(
                                          onPressed: (){
                                          },
                                          child: Text("View",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 15),),
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.resolveWith((states){
                                                if(states.contains(MaterialState.pressed)){
                                                  return Colors.orange;
                                                }
                                                return Colors.green;
                                              }),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                              )
                                          ),
                                        ),

                                      ],
                                    ),
                                    /*RatingBarIndicator(
                                        rating: 3,
                                        itemSize: 20,
                                        itemCount: 5,
                                        itemBuilder: (context,index){
                                      return const Icon(Icons.star,color: Colors.amberAccent,)
                                    })*/
                                  ],
                                  )
                                  ),
                                );

                              }),
                        ),
                      ),
                    ),
               ),
            ],
          )
        ),
      ),
    );
  }
}
