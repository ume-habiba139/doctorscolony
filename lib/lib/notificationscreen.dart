import 'package:flutter/material.dart';
class NotificationScreen extends StatelessWidget {


  List imgs= [
    "Dr1.jpg",
    "img_2.png",
    "img_2.png",
    "img_2.png",
    "img_2.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan ,
          centerTitle: false,
          title: Text('Notifications',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
body: SingleChildScrollView(
child: Column(
  children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),

            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(

                  onTap: (){
                   // Navigator.push(context,
                       // MaterialPageRoute(builder: (context) =>  Chatscreen()));
                  },
                  leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.cyan,
                    child: Icon(Icons.notifications,
                    size: 40,
                    color: Colors.red,
                    ),
                  ),
                  title: Text(
                    'Appointment Successful',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'On 23,dec,2024 reach before 3pm',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  trailing: Text(
                    '12:30',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),
              );
            }
        ),
    ListView.builder(
        physics: NeverScrollableScrollPhysics(),

        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(

              onTap: (){
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) =>  Chatscreen()));
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.cyan,
                child: Icon(Icons.notifications,
                  size: 40,
                  color: Colors.red,
                ),
              ),
              title: Text(
                'Sugar Test Reminder',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'On 12,july,2024 reach before 10am',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
              trailing: Text(
                '12:30',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),
          );
        }
    )
        ]
)
)
    );
  }
}
