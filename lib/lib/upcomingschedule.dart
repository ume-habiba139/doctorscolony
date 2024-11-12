import 'package:flutter/material.dart';
import 'package:mysecondprogram/lib/reschedulescreen.dart';

class UpcomingSchedule extends StatelessWidget {
  const UpcomingSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Doctor',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [ BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4 ,
                  spreadRadius: 2,
                )
                ]
              ),
              child: SizedBox( width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Dr. M.Jahanzaib Jvaid',
                        style: TextStyle(
                         fontWeight: FontWeight.bold,
                        ),
                    ),
                    subtitle: Text(
                      'Therapist'
                    ),
                    trailing: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/Dr1.jpg"),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(
                          thickness: 1,
                          height: 20,
                        ),
                  ),
                  Row(

                    children: [
                      SizedBox(width: 13,),
                     Icon(
                       Icons.calendar_month,
                       color: Colors.black54,
                     ),
                      SizedBox(width: 5,),
                      Text(
                        '9/4/2024',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                     SizedBox(width: 20,),
                     Row(
                      children: [ Icon(Icons.access_time,
                         color: Colors.black54,
                       ),
                         SizedBox(width: 5,),
                       Text('4:19AM'),
                       SizedBox(width: 5,),

            ]
                     ),
                      SizedBox(width: 20,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),

                          ),
                          SizedBox(width: 5,),
                          Text('confirmed'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     InkWell(
                       onTap: (){},
                        child: Container(
                          width: 130,
                          height: 40,
                          padding: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                     ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>  RescheduleScreen()));

                        },
                        child: Container(
                          width: 130,
                          height: 40,
                          padding: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text(
                              'reschedule',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [ BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4 ,
                    spreadRadius: 2,
                  )
                  ]
              ),
              child: SizedBox( width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Dr. John Doe ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          'Therapist'
                      ),
                      trailing: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/doctor3.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(

                      children: [
                        SizedBox(width: 13,),
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '9/4/2024',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Row(
                            children: [ Icon(Icons.access_time,
                              color: Colors.black54,
                            ),
                              SizedBox(width: 5,),
                              Text('4:19AM'),
                              SizedBox(width: 5,),

                            ]
                        ),
                        SizedBox(width: 20,),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),

                            ),
                            SizedBox(width: 5,),
                            Text('confirmed'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 130,
                            height: 40,
                            padding: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>  RescheduleScreen()));
                          },
                          child: Container(
                            width: 130,
                            height: 40,
                            padding: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text(
                                'reschedule',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [ BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4 ,
                    spreadRadius: 2,
                  )
                  ]
              ),
              child: SizedBox( width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Dr. Sarah',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          'Therapist'
                      ),
                      trailing: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/doctor1.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(

                      children: [
                        SizedBox(width: 13,),
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '9/4/2024',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Row(
                            children: [ Icon(Icons.access_time,
                              color: Colors.black54,
                            ),
                              SizedBox(width: 5,),
                              Text('4:19AM'),
                              SizedBox(width: 5,),

                            ]
                        ),
                        SizedBox(width: 20,),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),

                            ),
                            SizedBox(width: 5,),
                            Text('confirmed'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 130,
                            height: 40,
                            padding: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>  RescheduleScreen()));
                          },
                          child: Container(
                            width: 130,
                            height: 40,
                            padding: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text(
                                'reschedule',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [ BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4 ,
                    spreadRadius: 2,
                  )
                  ]
              ),
              child: SizedBox( width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Dr. Smith',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          'Therapist'
                      ),
                      trailing: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/doctor2.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(

                      children: [
                        SizedBox(width: 13,),
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '9/4/2024',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Row(
                            children: [ Icon(Icons.access_time,
                              color: Colors.black54,
                            ),
                              SizedBox(width: 5,),
                              Text('4:19AM'),
                              SizedBox(width: 5,),

                            ]
                        ),
                        SizedBox(width: 20,),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),

                            ),
                            SizedBox(width: 5,),
                            Text('confirmed'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: 130,
                            height: 40,
                            padding: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>  RescheduleScreen()));
                          },
                          child: Container(
                            width: 130,
                            height: 40,
                            padding: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text(
                                'reschedule',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],

        ),


      ),

    );
  }
}
