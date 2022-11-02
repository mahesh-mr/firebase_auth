import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_sample/controller/authservice.dart';
import 'package:firebase_auth_sample/view/create_note.dart';
import 'package:firebase_auth_sample/view/login_screen.dart';
import 'package:firebase_auth_sample/view/style/style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key,}) : super(key: key);

  // User user;
FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(backgroundColor: blackLight,
      //   onPressed: (){
      //       Navigator.pushReplacement(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => CreateNote(user: user),
      //               ));
      //   },child: Icon(Icons.add,color: gold,),),
      backgroundColor: blackLight,
      appBar: AppBar(elevation: 0,
        backgroundColor: blackLight,
        actions: [
          IconButton(
              onPressed: () async {
                await AuthService().singnOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body:Container(
        width: double.infinity,color: white,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment:CrossAxisAlignment.center,
        children: [ElevatedButton(onPressed: ()async{
CollectionReference reference =firestore.collection("users");
await reference.add({"name":"mahesh"});
print("${reference}===================================================================");
        }, child: Text("add"))],),
      )
      // body: GridView.builder(
      //   itemCount: 10,
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         childAspectRatio: 2 / 2.5,
      //         crossAxisSpacing: 10,
      //         mainAxisSpacing: 10),
      //     itemBuilder: (context, index) {
      //       return Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(10),
      //           color: black,
      //           border: Border.all(
      //             color: gold,
      //           ),
      //         ),
      //         child: Column(
      //          crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text("adddd",style: headlilne,),
      //             Container(color: red,width: 200,height: 200,child: Text("hfhsfghfdghsjf ghjsdldgdjg sdgdfg sdfgdsf sdfgsdf dsfgdf sdfgdfg sdffg dgdf sdfgdh dg dgdsfg sdfgdsf sdfg sdfgsdfg sd sdgds fg sdfgdsfg dfg dgsd fg dskgjdfklg sdfgjdfs dkfgjdsfk lksdfgslk sfgsdfghjskfgjskf sjfhsjkdghjsdg skjghsjkfghsfj skfjhskdfg skjgkdsfjg",style: sublilne,overflow: TextOverflow.ellipsis,maxLines: 5,),)
      //           ],
      //         ),
      //       );
      //     }),
    );
  }
}
