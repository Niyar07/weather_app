import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Text(
              "Location , State",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 184, 239, 252),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(left: 2)),
                      Text(
                        "Now",
                        style: TextStyle(fontSize: 15),
                      ),
                      Row(
                        children: [
                          Text(
                            "27",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 45,
                          ),
                        ],
                      ),
                      Text(
                        "RealFeel 36",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Partly Cloudy",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Percip : 20%",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "Humidity : 77%",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "Wind :8km",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 184, 239, 252),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next 12 Hours",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 95,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: Column(
                              children: [
                                Text(
                                  "11am",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Icon(
                                  Icons.cloud,
                                  size: 27,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "29",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 184, 239, 252),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next 5 Days",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 95,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: Column(
                              children: [
                                Text(
                                  "11am",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Icon(
                                  Icons.cloud,
                                  size: 27,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "29",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("AccuWeather")),
                ElevatedButton(onPressed: () {}, child: Text("More Details"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
