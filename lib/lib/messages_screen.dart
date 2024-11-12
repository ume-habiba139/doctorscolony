import 'package:flutter/material.dart';
import 'chatscreen.dart';

class MessagesScreen extends StatelessWidget {
  List<String> imgs = [
    "Dr1.jpg",
    "doctor1.png",
    "doctor2.png",
    "doctor3.png",
    "doctor4.png",
  ];

  List<String> doctorNames = [
    "Dr. Jahanzaib",
    "Dr. Sarah ",
    "Dr. John Doe",
    "Dr. Emily White",
    "Dr. Mike Brown",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: false,
        title: Text(
          'Messages',
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
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 250,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.search,
                        color: Colors.cyan,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    " Active Now",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imgs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: Stack(
                      textDirection: TextDirection.rtl,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 65,
                            width: 65,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "images/${imgs[index]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(3),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    " Recent Chats",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: imgs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "images/${imgs[index]}",
                      ),
                    ),
                    title: Text(
                      doctorNames[index], // Use index to get correct name
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Hello Doctor, are you there?',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: Text(
                      '12:30',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
