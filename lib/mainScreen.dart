import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  String apiKey = "vRAYpV5BPdbyTYdmWUtaGRipEfJ7w3A9";

  fetchCurrentCond() async {
    final url =
        'http://dataservice.accuweather.com/currentconditions/v1/204844?apikey=$apiKey&details= true';
    final res = await http.get(Uri.parse(url));
    print(res.body);
  }

  fetch12HoursData() async {
    final url =
        'http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/204844?apikey=$apiKey';
    final res = await http.get(Uri.parse(url));
    print(res.body);
  }

  fetch5DaysData() async {
    final url =
        'http://dataservice.accuweather.com/forecasts/v1/daily/5day/204844?apikey=$apiKey';
    final res = await http.get(Uri.parse(url));
    print(res.body);
  }

  int tempareture = 0;

  int weatherIconKey = 0;

  String weatherTest = "";

  double realFeel = 0;

  double windSpeed = 0;

  int uVindex = 0;

  int humidity = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCurrentCond();
    fetch12HoursData();
    fetch5DaysData();
  }

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
