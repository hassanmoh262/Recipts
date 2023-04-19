import 'package:flutter/material.dart';
class NearbyGym extends StatelessWidget {
  const NearbyGym({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/home_screen/gym.png'),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){},
            child: Container(
              child: Center(child: const Text('Check Nearby Gyms' ,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              )),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
          )
        ],
      ),),
    );
  }
}