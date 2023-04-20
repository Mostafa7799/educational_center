import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Matt.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60.0, left: 10, bottom: 0),
                  child: Text("About Us", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 25
                  ),),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 110),
                  child:
                  Container(

                  ),
                ),

              ],
            ),
            SizedBox(width: 500,
                height: 350,
                child: Image.asset(
                  'assets/images/aboutus.png', bundle: null,)),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc congue nisi vitae suscipit tellus mauris a. Quis lectus nulla at volutpat. Risus commodo viverra maecenas accumsan lacus vel facilisis volutpat. Quis lectus nulla at volutpat. Augue ut lectus arcu bibendum at varius. Nunc aliquet bibendum enim facilisis gravida. Leo duis ut diam quam nulla porttitor massa id neque. Placerat duis ultricies lacus sed turpis tincidunt id aliquet risus. In nisl nisi scelerisque eu ultrices vitae auctor eu augue. Odio aenean sed adipiscing diam. Eget egestas purus viverra accumsan. Libero nunc consequat interdum varius sit amet mattis vulputate. Semper quis lectus nulla at volutpat diam ut venenatis. Lacus sed viverra tellus in. In mollis nunc sed id semper risus in. Non enim praesent elementum facilisis")


          ],
        ),
      ),


    );
  }
}
