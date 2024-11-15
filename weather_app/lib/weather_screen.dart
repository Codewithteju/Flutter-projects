import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_material_item.dart';
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getWeatherData() async {
    try {
      String cityName = "Friedberg, DE";
      final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$aPIKEY"),
      );
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw data['message'];
      }

      return data;
      // temp = data['list'][0]['main']['temp'];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            wordSpacing: 8,
            height: 10,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weather = getWeatherData();
              });
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          }

          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentWSpeed = currentWeatherData['wind']['speed'];
          final currentHumidity = currentWeatherData['main']['humidity'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                "$currentTemp K",
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 60,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                currentSky.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Hourly Forecast",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final hourlyForecastItem = data['list'][index + 1];
                      final hourlyIcon =
                          hourlyForecastItem['weather'][0]['main'];
                      final hourlyTime =
                          DateTime.parse(hourlyForecastItem['dt_txt']);
                      final hourlyTemp = hourlyForecastItem['main']['temp'];
                      return HourlyForecastItem(
                        icon: hourlyIcon == 'Clouds' || hourlyIcon == 'Rain'
                            ? Icons.cloud
                            : Icons.sunny,
                        time: DateFormat.j().format(hourlyTime),
                        temp: hourlyTemp.toString(),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInformationCard(
                        icon: Icons.water_drop,
                        label: "Humidity",
                        value: currentHumidity.toString()),
                    AdditionalInformationCard(
                        icon: Icons.air,
                        label: "Wind Speed",
                        value: currentWSpeed.toString()),
                    AdditionalInformationCard(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: currentPressure.toString(),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
