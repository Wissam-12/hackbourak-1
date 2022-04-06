import 'package:flutter/material.dart';
import 'signin.dart';

class NewEventPage extends StatefulWidget {
  NewEventPage({Key? key}) : super(key: key);

  @override
  State<NewEventPage> createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  List<String> _dynamicChip = ["Mataam Rahma", "Family Iftar", "Collection Kofat Ramadan", "Don"];
  String _type = "";
  TextEditingController inputControler = new TextEditingController();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        backgroundColor: Color(0xFFF2F2F2),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                    Stack(
                        children: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0,),
                                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0,),
                                child: Form(
                                    key: globalFormKey,
                                    child: Column(
                                        children: <Widget>[
                                            Container(
                                                color: Colors.white,
                                                padding: EdgeInsets.only(left: 24.0,),
                                                child: Row(
                                                    children: <Widget>[
                                                        Container(
                                                            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 0,),
                                                            child: Column(
                                                                children: <Widget>[
                                                                    Align(
                                                                        alignment: Alignment.topRight,
                                                                        child: Container(
                                                                            color: Colors.green,
                                                                            child: IconButton(
                                                                                onPressed: (){
                                                                                    Navigator.pop(context);
                                                                                },
                                                                                icon : Icon(Icons.close_rounded, color: Color(0xFF1E1E1E),),
                                                                            ),
                                                                        ),
                                                                    ),
                                                                    Text(
                                                                        "Nouvel événement",
                                                                        textAlign : TextAlign.right,
                                                                        style: TextStyle(
                                                                            fontFamily: 'DMSans',
                                                                            fontSize: 20,
                                                                            fontWeight: FontWeight.w700,
                                                                            color: Colors.black,
                                                                        ),
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                        SizedBox(width: 80,),
                                                        Container(
                                                            child: Image(
                                                                image: AssetImage('assets/img/flower.png'),
                                                                alignment: Alignment(-1.0, 1.0),
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                            SizedBox(
                                                height: 4,
                                            ),
                                            Container(
                                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40,),
                                                color: Colors.white,
                                                child: new TextFormField(
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                        color: Color(0xFF1E1E1E),
                                                        fontFamily: 'DMsans',
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                    decoration: new InputDecoration(
                                                        labelText: "Nom de l'événement",
                                                        labelStyle: TextStyle(
                                                            fontFamily: 'DMSans',
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: Color(0xFF9D9D9D),
                                                        ),
                                                        enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(0xFF9D9D9D),
                                                            ),
                                                        ),
                                                        focusedBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(0xFF757575),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            SizedBox(
                                                height: 2,
                                            ),
                                            Container(
                                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40,),
                                                color: Colors.white,
                                                child: new TextFormField(
                                                    keyboardType: TextInputType.text,
                                                    style: TextStyle(
                                                        color: Color(0xFF1E1E1E),
                                                        fontFamily: 'DMsans',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                    maxLines: null,
                                                    decoration: new InputDecoration(
                                                        labelText: "Déscription de l'événement",
                                                        labelStyle: TextStyle(
                                                            fontFamily: 'DMSans',
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: Color(0xFF9D9D9D),
                                                        ),
                                                        enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(0xFF9D9D9D),
                                                            ),
                                                        ),
                                                        focusedBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(0xFF757575),
                                                            ),
                                                        ),
                                                    ),
                                                    
                                                ),
                                            ),
                                            SizedBox(height: 2,),
                                            Container(
                                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40,),
                                                color: Colors.white,
                                                child: Column(
                                                    children: <Widget>[ 
                                                        new TextFormField(
                                                            controller: inputControler,
                                                            keyboardType: TextInputType.text,
                                                            style: TextStyle(
                                                                color: Color(0xFF1E1E1E),
                                                                fontFamily: 'DMsans',
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w500,
                                                            ),
                                                            decoration: new InputDecoration(
                                                                labelText: "Type de l'événement",
                                                                labelStyle: TextStyle(
                                                                    fontFamily: 'DMSans',
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w400,
                                                                    color: Color(0xFF9D9D9D),
                                                                ),
                                                                enabledBorder: UnderlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Color(0xFF9D9D9D),
                                                                    ),
                                                                ),
                                                                focusedBorder: UnderlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Color(0xFF757575),
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                        dynamicChip(),
                                                    ],
                                                ),
                                            ),
                                            SizedBox(height: 2,),
                                            Container(
                                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30,),
                                                width: double.infinity,
                                                alignment: Alignment.topLeft,
                                                color: Colors.white,
                                                child: TextButton.icon(
                                                    label: Text(
                                                        "Lieu de l'événement",
                                                        style: TextStyle(
                                                            fontFamily: 'DMSans',
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: Color(0xFF9D9D9D),
                                                            letterSpacing: 0,
                                                        )
                                                    ),
                                                    icon: CircleAvatar(
                                                            backgroundColor: Color(0xFFFFEAEA),
                                                            child: Icon(Icons.location_on_outlined, color: Color(0xFFE32929),),
                                                    ),
                                                    onPressed: () async {
                                                        // final result = await FilePicker.platform.pickFiles();
                                                    },
                                                ),
                                            ),   
                                            SizedBox(height: 2,),
                                            Container(
                                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40,),
                                                color: Colors.white,
                                                child: new TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    style: TextStyle(
                                                        color: Color(0xFF1E1E1E),
                                                        fontFamily: 'DMsans',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                    ),
                                                    decoration: new InputDecoration(
                                                        icon: CircleAvatar(
                                                            backgroundColor: Color(0xFFFFEAEA),
                                                            child: Icon(Icons.local_phone_sharp, color: Color(0xFFE32929),),
                                                        ),
                                                        prefix: Text(
                                                            "+ 213 ",
                                                            style: TextStyle(
                                                                fontFamily: 'DMSans',
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w400,
                                                                color: Color(0xFF1E1E1E),
                                                            ),
                                                        ),
                                                        hintText: "N° de téléphone",
                                                        hintStyle: TextStyle(
                                                            fontFamily: 'DMSans',
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: Color(0xFF9D9D9D),
                                                        ),
                                                        enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(0xFF9D9D9D),
                                                            ),
                                                        ),
                                                        focusedBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(0xFF757575),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            SizedBox(height: 2,),
                                            Container(
                                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40,),
                                                color: Colors.white,
                                                child: new TextFormField(
                                                    keyboardType: TextInputType.emailAddress,
                                                    style: TextStyle(
                                                        color: Color(0xFF1E1E1E),
                                                        fontFamily: 'DMsans',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                    ),
                                                    decoration: new InputDecoration(
                                                        icon: CircleAvatar(
                                                            backgroundColor: Color(0xFFFFEAEA),
                                                            child: Icon(Icons.email, color: Color(0xFFE32929),),
                                                        ),
                                                        hintText: "Adresse Email",
                                                        hintStyle: TextStyle(
                                                            fontFamily: 'DMSans',
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: Color(0xFF9D9D9D),
                                                        ),
                                                        enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(0xFF9D9D9D),
                                                            ),
                                                        ),
                                                        focusedBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(0xFF757575),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            SizedBox(height: 2,),
                                            Container(
                                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30,),
                                                width: double.infinity,
                                                alignment: Alignment.topLeft,
                                                color: Colors.white,
                                                child: TextButton.icon(
                                                    label: Text(
                                                        "Ajouter une image",
                                                        style: TextStyle(
                                                            fontFamily: 'DMSans',
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: Color(0xFF9D9D9D),
                                                            letterSpacing: 0,
                                                        )
                                                    ),
                                                    icon: CircleAvatar(
                                                            backgroundColor: Color(0xFFFFEAEA),
                                                            child: Icon(Icons.attach_file_rounded, color: Color(0xFFE32929),),
                                                    ),
                                                    onPressed: () async {
                                                        // final result = await FilePicker.platform.pickFiles();
                                                    },
                                                ),
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                                margin: EdgeInsets.only(right: 42,),
                                                child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: FlatButton(
                                                        padding: EdgeInsets.symmetric(
                                                            vertical: 5,
                                                            horizontal: 20,
                                                        ),
                                                        onPressed: () {},
                                                        child: Text(
                                                            "Enregister",
                                                            style: TextStyle(
                                                                fontFamily: 'DMSans',
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 14,
                                                                color: Colors.white,
                                                            ),
                                                        ),
                                                        color: Theme.of(context).accentColor,
                                                        shape: StadiumBorder(),
                                                    ),
                                                ),
                                            ),
                                            SizedBox(height: 10,),
                                        ],
                                    ),
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        ),
    );
  }
  dynamicChip(){
    return Align(
        alignment: Alignment.topLeft,
        child: Wrap(
            spacing: 6.0,
            runSpacing: 1,
            alignment : WrapAlignment.start,
            children: List<Widget>.generate(_dynamicChip.length, (int index){
                return Chip(
                    label: Text(
                        _dynamicChip[index],
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE32929),
                        ),
                    ),
                    onDeleted: (){
                        setState((){
                            _dynamicChip.removeAt(index);
                        });
                    },
                    deleteIcon: Icon(Icons.close_rounded, color: Color(0xFFE32929),),
                    backgroundColor : Color(0xFFFFEAEA),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                );
            }),
        ),
    );
  }
}