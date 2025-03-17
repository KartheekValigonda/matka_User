import 'package:flutter/material.dart';
import 'package:matka_user/Chart.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth*0.4, screenHeight*0.1)
              ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Chart()));
                },
                child: Text("Next",)
            )
          ],
        ),
      ),
    );
  }
}
