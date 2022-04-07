import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hackbourak/Shared/SharedFunctions.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('notification').snapshots();
  bool isInEnAttente = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Container(
          color: Colors.white,
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.all(20),
                height: 120,
                alignment: Alignment.bottomLeft,
                child: Text('Notifications', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: (){
                        setState(() {
                          isInEnAttente = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text('Tout', style: TextStyle(fontSize: 18,color: isInEnAttente ? Color(0xFFD4D4D4) : Color(0xFFE32929),)),
                          Container(
                            width: 100,
                            child: Divider(
                              color: isInEnAttente ? Colors.white : Color(0xFFE32929),
                              thickness: 5,

                            ),
                          )
                        ],
                      ),
                  ),

                  TextButton(
                    onPressed: (){
                      setState(() {
                        isInEnAttente = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text('En Attente', style: TextStyle(fontSize: 18,color: !isInEnAttente ? Color(0xFFD4D4D4) : Color(0xFFE32929),)),
                        Container(
                          width: 100,
                          child: Divider(
                            color: !isInEnAttente ? Colors.white : Color(0xFFE32929),
                            thickness: 5,

                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return (!isInEnAttente || (isInEnAttente && data['isFeedback'])) ? Container(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20 , 20, 20),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0) ,
                                child: Image.asset('assets/notif.png',scale: 0.85,)
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text((data['isFeedback']?'Vous vous êtes rendu à ':'')+data['text']+(data['isFeedback']?' ? Donnez votre avis!':"")),
                                        ),
                                      ),
                                      Container(
                                        width : 70,
                                          child: Flexible(child: Text('Il y a '+data['time'].toString()+' minutes'))
                                      ),

                                    ],
                                  ),

                                  data['isFeedback'] ?
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: (){},
                                        child: Container(
                                          child: Text('Refuser', style: TextStyle(color: Color(0xFF818588)),),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: (){

                                          SharedFunctions.showPopup(context);

                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1AE4A6),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Text('Accepter', style: TextStyle(color: Colors.white),),
                                        ),
                                      )
                                    ],
                                  ): SizedBox.shrink(),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) : SizedBox.shrink();
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
