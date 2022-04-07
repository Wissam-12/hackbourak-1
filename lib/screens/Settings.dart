import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

bool notificationsActive = true;
bool receiveEmails = false;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/loading_bg.png'),
                ),
                border: Border(
                    bottom: BorderSide(
                  color: Color.fromARGB(92, 0, 0, 0),
                ))),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 5),
              child: Row(
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size: 40,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Paramètres',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        fontFamily: 'Poppins'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Notifications',
                        style: TextStyle(
                          color: Color(0xFF343434),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      Switch(
                        value: notificationsActive,
                        onChanged: (bool value) {
                          setState(() {
                            notificationsActive = value;
                          });
                        },
                        activeColor: Color.fromARGB(255, 44, 242, 136),
                        activeTrackColor: Color(0xFF29E37F),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recevoir des e-mails',
                        style: TextStyle(
                          color: Color(0xFF343434),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      Switch(
                        value: receiveEmails,
                        onChanged: (bool value) {
                          setState(() {
                            receiveEmails = value;
                          });
                        },
                        activeColor: Color.fromARGB(255, 44, 242, 136),
                        activeTrackColor: Color(0xFF29E37F),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Contactez nous',
                        style: TextStyle(
                          color: Color(0xFF343434),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_right,
                              color: Color(0xFFC7C7C7), size: 30))
                    ]),
                TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Se déconnecter',
                      style: TextStyle(
                        color: Color(0xFF343434),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Supprimer le compte',
                      style: TextStyle(
                        color: Color(0xFFE53D3D),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
