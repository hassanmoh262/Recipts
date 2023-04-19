import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'SerachPage.dart';
import 'breakfast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _eatenCalories = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Profile")),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Flexible(
          child: Column(
            children: [
              Row(
                children: [
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 10.0,
                    percent: 0.5,
                    center: const Text(
                      "1850 Cal",
                    ),
                    progressColor: Colors.green,
                    backgroundColor: Colors.red,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(
                              "assets/home_screen/Apple.png",
                            ),
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "Eaten ",
                                style: const TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                "$_eatenCalories (kCal)",
                                style: const TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(
                              "assets/home_screen/Fire.png",
                            ),
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: const [
                              Text(
                                "Burned ",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "0 (kCal)",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 6,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(
                              "assets/home_screen/Plate.png",
                            ),
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: const [
                              Text(
                                "Carbs ",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " 255 (gramms)",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 2,),
                  Column(
                    children: [
                      Row(
                        children:  [
                          const Image(image: AssetImage("assets/home_screen/Meat.png",) ,width: 30, height: 30,),
                          const SizedBox(width: 10,),
                          Column(
                            children: const [
                              Text("Carbs ", style: TextStyle(color: Colors.green, fontSize: 12,fontWeight: FontWeight.bold),),
                              Text(" 255 (gramms)", style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 2,),
                  Column(
                    children: [
                      Row(
                        children:  [
                          const Image(image: AssetImage("assets/home_screen/Fats.png",) ,width: 30, height: 30,),
                          const SizedBox(width: 10,),
                          Column(
                            children: const [
                              Text("Fats ", style: TextStyle(color: Colors.green, fontSize: 12,fontWeight: FontWeight.bold),),
                              Text(" 255 (gramms)", style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),




                ],
              ),
              const SizedBox(height: 30,),
              const Divider(
                thickness: 6,
                color: Colors.grey, // add a margin of 10 pixels on the top and bottom
              ),
              Container(
          padding: const EdgeInsets.all(16), // add some padding to the container
          child: Row(
            children: [
              // add the image and text in an Expanded widget
              Expanded(
                child: Row(
                  children:  [
                    Image(
                      image: AssetImage('assets/home_screen/icon1.png'),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 16), // add some spacing between the image and text
                    TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(  builder: (context) => BreakfastScreen(ingredientLines: [], ingredients: [], recipe: [],) ),
                      );
                      },
                      child: Text(
                        'Breakfast',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              // add the button in another Expanded widget with a Row inside it
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      color: Colors.green,
                      icon: const Icon(Icons.add, color: Colors.green, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
              Container(
                padding: const EdgeInsets.all(16), // add some padding to the container
                child: Row(
                  children: [
                    // add the image and text in an Expanded widget
                    Expanded(
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('assets/home_screen/icon2.png'),
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(width: 16), // add some spacing between the image and text
                          Text(
                            'Lunch',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    // add the button in another Expanded widget with a Row inside it
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            color: Colors.green,
                            icon: const Icon(Icons.add, color: Colors.green, size: 30),
                            onPressed: () {

                              //add here navigation to home screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SearchPage()),
                              );

                              // add your button onPressed action here
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16), // add some padding to the container
                child: Row(
                  children: [
                    // add the image and text in an Expanded widget
                    Expanded(
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('assets/home_screen/icon3.png'),
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(width: 16), // add some spacing between the image and text
                          Text(
                            'Dinner',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    // add the button in another Expanded widget with a Row inside it
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            color: Colors.green,
                            icon: const Icon(Icons.add, color: Colors.green, size: 30),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SearchPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16), // add some padding to the container
                child: Row(
                  children: [
                    // add the image and text in an Expanded widget
                    Expanded(
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('assets/home_screen/icon4.png'),
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(width: 16), // add some spacing between the image and text
                          Text(
                            'Workout',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    // add the button in another Expanded widget with a Row inside it
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            color: Colors.green,
                            icon: const Icon(Icons.add, color: Colors.green, size: 30),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SearchPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),





        ],
          ),
        ),
      ),
    );
  }


}
