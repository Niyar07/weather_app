import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  // String apiKey = "vRAYpV5BPdbyTYdmWUtaGRipEfJ7w3A9";
  double tempareture = 0;

  int weatherIconKey = 0;

  String weatherTest = "";

  double realFeel = 0;

  double windSpeed = 0;

  int uVindex = 0;

  int humidity = 0;

  bool isLoding = true;

  String moreDetailUri = "";
  // Next 12 hours Section List
  List<Map<String, dynamic>> data12Hr = [];

  // Next 5 Days Section List
  List<Map<String, dynamic>> data5days = [];

  fetchCurrentCond() async {
    try {
      final url =
          'http://dataservice.accuweather.com/currentconditions/v1/204844?apikey=vRAYpV5BPdbyTYdmWUtaGRipEfJ7w3A9&details= true';
      final res = await http.get(Uri.parse(url));
      final data = jsonDecode(res.body);
      Map<String, dynamic> weatherData = data[0];
      // print(weatherData["WeatherText"]);
      tempareture = double.parse(
          (((weatherData["Temperature"])["Metric"])["Value"]).toString());

      weatherIconKey = weatherData["WeatherIcon"];

      weatherTest = weatherData["WeatherText"];

      realFeel = double.parse(
          (((weatherData["RealFeelTemperature"])["Metric"])["Value"])
              .toString());

      windSpeed = (((weatherData["Wind"])["Speed"])["Metric"])["Value"];

      uVindex = weatherData["UVIndex"];
      moreDetailUri = weatherData["Link"];
      humidity = weatherData["RelativeHumidity"];

      setState(() {});
    } catch (e) {
      print("Error Occured - ${e.toString()}");
    }
  }

  fetch12HoursData() async {
    try {
      // Next 12 hours Section variables
      int weatherIconKey12Hr = 01;
      String timeString = "00";
      double temp_12Hr = 00;

      final url =
          'http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/204844?apikey=vRAYpV5BPdbyTYdmWUtaGRipEfJ7w3A9';
      final res = await http.get(Uri.parse(url));
      // print(res.body);

      List<dynamic> data = jsonDecode(res.body);
      data.forEach((map) {
        weatherIconKey12Hr = map["WeatherIcon"];
        timeString = (DateTime.parse(map["DateTime"]).hour).toString();
        temp_12Hr = 5 / 9 * (map["Temperature"]["Value"] - 32);
        Map<String, dynamic> indexData = {
          "wi": weatherIconKey12Hr,
          "t": timeString,
          "temp": temp_12Hr
        };
        data12Hr.add(indexData);
      });
    } catch (e) {
      print("Error Occured - ${e.toString()}");
    }
  }

  fetch5DaysData() async {
    int weatherIconKey5day = 01;
    String dayString = "01";
    double temp_5day = 00;
    final url =
        'http://dataservice.accuweather.com/forecasts/v1/daily/5day/204844?apikey=vRAYpV5BPdbyTYdmWUtaGRipEfJ7w3A9';
    final res = await http.get(Uri.parse(url));
    print(res.body);

    final data = jsonDecode(res.body);

    List<dynamic> df = data["DailyForecasts"];
    df.forEach((map) {
      weatherIconKey5day = map["Day"]["Icon"];
      dayString = DateTime.parse(map["Date"].toString()).day.toString();
      double minTemp = 5 / 9 * (map["Temperature"]["Minimum"]["Value"] - 32);
      double maxTemp = 5 / 9 * (map["Temperature"]["Maximum"]["Value"] - 32);

      temp_5day = (maxTemp + minTemp) / 2;

      Map<String, dynamic> data5d = {
        "wi": weatherIconKey5day,
        "d": dayString,
        "temp": temp_5day
      };
      data5days.add(data5d);
    });

    setState(() {
      isLoding = false;
    });
  }

  Future<void> _launchUrl(String urrlString) async {
    if (!await launchUrl(Uri.parse(urrlString))) {
      throw Exception('Could not launch $urrlString ');
    }
  }

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
    return isLoding
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    "Nagpur , Maharashtra",
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
                                  tempareture.toString(),
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                // Icon(
                                //   Icons.cloud,
                                //   size: 45,
                                // ),
                                Image.network(
                                    "https://developer.accuweather.com/sites/default/files/${weatherIconKey.toString().padLeft(2, '0')}-s.png")
                              ],
                            ),
                            Text(
                              "RealFeel $realFeel",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              weatherTest,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Humidity : $humidity %",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "Wind :$windSpeed km/h",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "UVIndex : $uVindex",
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data12Hr.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: Column(
                                    children: [
                                      Text(
                                        data12Hr[index]["t"],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      // Icon(
                                      //   Icons.cloud,
                                      //   size: 27,
                                      // ),
                                      Image.network(
                                          "https://developer.accuweather.com/sites/default/files/${data12Hr[index]['wi'].toString().padLeft(2, '0')}-s.png"),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        data12Hr[index]["temp"]
                                            .toString()
                                            .substring(0, 4),
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data5days.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: Column(
                                    children: [
                                      Text(
                                        data5days[index]["d"],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      // Icon(
                                      //   Icons.cloud,
                                      //   size: 27,
                                      // ),
                                      Image.network(
                                          "https://developer.accuweather.com/sites/default/files/${data5days[index]["wi"].toString().padLeft(2, '0')}-s.png"),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        data5days[index]["temp"]
                                            .toString()
                                            .substring(0, 4),
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
                      ElevatedButton(
                          onPressed: () {
                            _launchUrl("https://accuweather.com/");
                          },
                          child: Text("AccuWeather")),
                      ElevatedButton(
                          onPressed: () {
                            _launchUrl(moreDetailUri);
                          },
                          child: Text("More Details"))
                    ],
                  )
                ],
              ),
            ),
          );
  }

  void loadNextPage() {}
}
