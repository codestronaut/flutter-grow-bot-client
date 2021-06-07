import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_bot_app/pages/loading_page.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic> statusData;
  final int temperature;
  final int humidity;
  final int greenLevel;
  HomePage({
    required this.statusData,
    required this.temperature,
    required this.humidity,
    required this.greenLevel,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grow Bot Fuzzy',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Status',
                  style: GoogleFonts.poppins(
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                CurrentStatusCard(
                  temp: widget.temperature,
                  humidity: widget.humidity,
                  greenLevel: widget.greenLevel,
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Analytics',
                  style: GoogleFonts.poppins(
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Used Rules',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                      for (var i in widget.statusData['rulesApplied'])
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'IF Temperature = ${widget.statusData['rules'][i['ruleNumber']]['temperatureLinguisticValue']} AND Humidity = ${widget.statusData['rules'][i['ruleNumber']]['humidityLinguisticValue']} AND Green Level = ${widget.statusData['rules'][i['ruleNumber']]['greenLevelLinguisticValue']} THEN Siram = ${widget.statusData['rules'][i['ruleNumber']]['output']}',
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Minimum Implication',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      for (var i in widget.statusData['rulesApplied'])
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'µ Tidak = µ${widget.statusData['rules'][i['ruleNumber']]['temperatureLinguisticValue']} ˄ µ${widget.statusData['rules'][i['ruleNumber']]['humidityLinguisticValue']} ˄ µ${widget.statusData['rules'][i['ruleNumber']]['greenLevelLinguisticValue']}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'µ Tidak = min(${i['temperatureFuzzyMember'].toStringAsFixed(2)}, ${i['humidityFuzzyMember'].toStringAsFixed(2)}, ${i['greenLevelFuzzyMember'].toStringAsFixed(2)})',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'µ Tidak = ${[
                                  double.parse(i['temperatureFuzzyMember']
                                      .toStringAsFixed(2)),
                                  double.parse(i['humidityFuzzyMember']
                                      .toStringAsFixed(2)),
                                  double.parse(i['greenLevelFuzzyMember']
                                      .toStringAsFixed(2)),
                                ].reduce(
                                  (curr, next) => curr < next ? curr : next,
                                )}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Maximum Implication',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F7),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'µ Tidak = ${widget.statusData['maximumImplicationResult']['Tidak']}',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F7),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'µ Siram = ${widget.statusData['maximumImplicationResult']['Siram']}',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Defuzzyfication',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F7),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'y\' = ${widget.statusData['mamdaniDefuzzificationResult']}',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.offAll(() => LoadingPage());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class CurrentStatusCard extends StatelessWidget {
  final int temp;
  final int humidity;
  final int greenLevel;
  const CurrentStatusCard({
    required this.temp,
    required this.humidity,
    required this.greenLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Temp',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '$tempºC',
                    style: GoogleFonts.poppins(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Humidity',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '$humidity',
                    style: GoogleFonts.poppins(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Green Level',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '$greenLevel',
                    style: GoogleFonts.poppins(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
