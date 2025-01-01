import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 143, 7, 120),
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 100,
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=400'),
          ),
          Text(
            "Alwin George",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "FLUTTER DEVELOPER",
            style: TextStyle(color: Colors.yellow, fontSize: 15),
          ),
          Divider(
            color: Colors.white,
            indent: 550,
            endIndent: 550,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            width: 350,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                SizedBox(width: 10,),

                Text(
                  '+6258955455',
                  style: TextStyle(color: Colors.teal),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            width: 350,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.teal,
                ),
                SizedBox(width: 10,),
                Text(
                  'kerala@gmail.com',
                  style: TextStyle(color: Colors.teal),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}