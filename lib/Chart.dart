import 'package:flutter/material.dart';
import 'dart:convert';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  String? date;
  String? day;
  String? sum;
  String? entryTime;
  String? exitTime;


  Future<List<dynamic>> getData() async {
    try {
      const jsonString = '''
      {
        "Data": [
          {"Date": "10 March 2025", "Day": "Mon", "entry_time": "663", "exit_time": "497"},
          {"Date": "11 March 2025", "Day": "Tue", "entry_time": "874", "exit_time": "271"},
          {"Date": "12 March 2025", "Day": "Wed", "entry_time": "983", "exit_time": "501"},
          {"Date": "13 March 2025", "Day": "Thu", "entry_time": "631", "exit_time": "844"},
          {"Date": "14 March 2025", "Day": "Fri", "entry_time": "879", "exit_time": "768"},
          {"Date": "15 March 2025", "Day": "Sat", "entry_time": "896", "exit_time": "285"},
          {"Date": "16 March 2025", "Day": "Sun", "entry_time": "854", "exit_time": "406"},
          {"Date": "17 March 2025", "Day": "Mon", "entry_time": "110", "exit_time": "828"},
          {"Date": "18 March 2025", "Day": "Tue", "entry_time": "346", "exit_time": "128"},
          {"Date": "19 March 2025", "Day": "Wed", "entry_time": "308", "exit_time": "854"},
          {"Date": "20 March 2025", "Day": "Thu", "entry_time": "388", "exit_time": "243"},
          {"Date": "21 March 2025", "Day": "Fri", "entry_time": "177", "exit_time": "186"},
          {"Date": "22 March 2025", "Day": "Sat", "entry_time": "842", "exit_time": "714"},
          {"Date": "23 March 2025", "Day": "Sun", "entry_time": "353", "exit_time": "519"},
          {"Date": "24 March 2025", "Day": "Mon", "entry_time": "366", "exit_time": "851"},
          {"Date": "25 March 2025", "Day": "Tue", "entry_time": "862", "exit_time": "621"},
          {"Date": "26 March 2025", "Day": "Wed", "entry_time": "789", "exit_time": "453"},
          {"Date": "27 March 2025", "Day": "Thu", "entry_time": "492", "exit_time": "129"},
          {"Date": "28 March 2025", "Day": "Fri", "entry_time": "279", "exit_time": "331"},
          {"Date": "29 March 2025", "Day": "Sat", "entry_time": "897", "exit_time": "441"},
          {"Date": "30 March 2025", "Day": "Sun", "entry_time": "825", "exit_time": "292"},
          {"Date": "31 March 2025", "Day": "Mon", "entry_time": "501", "exit_time": "605"},
          {"Date": "01 April 2025", "Day": "Tue", "entry_time": "901", "exit_time": "886"},
          {"Date": "02 April 2025", "Day": "Wed", "entry_time": "323", "exit_time": "706"},
          {"Date": "03 April 2025", "Day": "Thu", "entry_time": "452", "exit_time": "859"},
          {"Date": "04 April 2025", "Day": "Fri", "entry_time": "333", "exit_time": "433"},
          {"Date": "05 April 2025", "Day": "Sat", "entry_time": "346", "exit_time": "286"},
          {"Date": "06 April 2025", "Day": "Sun", "entry_time": "828", "exit_time": "742"},
          {"Date": "07 April 2025", "Day": "Mon", "entry_time": "730", "exit_time": "457"},
          {"Date": "08 April 2025", "Day": "Tue", "entry_time": "662", "exit_time": "912"},
          {"Date": "09 April 2025", "Day": "Wed", "entry_time": "323", "exit_time": "320"},
          {"Date": "10 April 2025", "Day": "Thu", "entry_time": "667", "exit_time": "205"},
          {"Date": "11 April 2025", "Day": "Fri", "entry_time": "661", "exit_time": "183"},
          {"Date": "12 April 2025", "Day": "Sat", "entry_time": "499", "exit_time": "451"},
          {"Date": "13 April 2025", "Day": "Sun", "entry_time": "829", "exit_time": "232"},
          {"Date": "14 April 2025", "Day": "Mon", "entry_time": "834", "exit_time": "196"},
          {"Date": "15 April 2025", "Day": "Tue", "entry_time": "488", "exit_time": "319"},
          {"Date": "16 April 2025", "Day": "Wed", "entry_time": "268", "exit_time": "938"},
          {"Date": "17 April 2025", "Day": "Thu", "entry_time": "772", "exit_time": "625"},
          {"Date": "18 April 2025", "Day": "Fri", "entry_time": "456", "exit_time": "822"},
          {"Date": "19 April 2025", "Day": "Sat", "entry_time": "958", "exit_time": "532"},
          {"Date": "20 April 2025", "Day": "Sun", "entry_time": "227", "exit_time": "289"},
          {"Date": "21 April 2025", "Day": "Mon", "entry_time": "156", "exit_time": "474"},
          {"Date": "22 April 2025", "Day": "Tue", "entry_time": "127", "exit_time": "493"},
          {"Date": "23 April 2025", "Day": "Wed", "entry_time": "631", "exit_time": "987"},
          {"Date": "24 April 2025", "Day": "Thu", "entry_time": "166", "exit_time": "853"},
          {"Date": "25 April 2025", "Day": "Fri", "entry_time": "884", "exit_time": "686"},
          {"Date": "26 April 2025", "Day": "Sat", "entry_time": "856", "exit_time": "482"},
          {"Date": "27 April 2025", "Day": "Sun", "entry_time": "592", "exit_time": "663"}
        ]
      }
      ''';

      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final dataList = jsonData['Data'] as List<dynamic>;

      return dataList;
    } catch (e) {
      throw Exception('Error loading JSON data: $e');
    }
  }

  String calculateSum(String entryTime, String exitTime) {
    int sumEntry = entryTime.split('').map(int.parse).reduce((a, b) => a + b);
    int sumExit = exitTime.split('').map(int.parse).reduce((a, b) => a + b);

    int tenthPlace = sumEntry % 10;
    int onesPlace = sumExit % 10;

    return "$tenthPlace$onesPlace";
  }

  String formatDate(String date) {
    List<String> parts = date.split(' ');
    if (parts.length >= 3) {
      String day = parts[0];
      String shortMonth = parts[1].substring(0, 3); // Get first 3 letters in uppercase
      String year = parts[2];
      return "$day $shortMonth $year";
    }
    return date;
  }


  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Row(
          children: [
            Text("Chart-Shridevi Morning"),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Set height of the divider
          child: Divider(
            height: 1,
            thickness: 2,
            color: Color(0xffDCCEBD), // Change color as needed
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No data available',
                style: TextStyle(fontSize: 16),
              ),
            );
          } else {
            final dataList = snapshot.data!;
            return ListView.builder(
              itemCount: (dataList.length / 7).ceil(),
              itemBuilder: (context, weekIndex) {

                int startIndex = weekIndex * 7;
                int endIndex = (startIndex + 6 < dataList.length) ? startIndex + 6 : dataList.length - 1;

                String startDate = formatDate(dataList[startIndex]['Date']);
                String endDate = formatDate(dataList[endIndex]['Date']);

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$startDate - $endDate", style: TextStyle(fontSize: 12, color: Colors.black),),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffBEBEBE),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        clipBehavior:Clip.antiAlias,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(7, (dayIndex) {
                            int dataIndex = weekIndex * 7 + dayIndex;
                            if (dataIndex < dataList.length) {
                              final data = dataList[dataIndex];
                              String sum = calculateSum(data['entry_time'], data['exit_time']);
                              return Row(
                                children: [
                                  Container(
                                    width: (screenWidth-33)/7,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: const Color(0xFFDCF9C0),
                                            ),
                                            child: Text(data['Day'], textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF464F0B)),),
                                          ),
                                        ),
                                        Text(formatDate(data['Date']), textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87,),),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 0.005,
                                          child: Divider(
                                            thickness: 1,
                                            color: Color(0xffBEBEBE),
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: data['entry_time'].toString().split('').map((digit) =>
                                                    Text(digit, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                                ).toList(),
                                              ),
                                              Container(
                                                width: 1,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffBEBEBE)
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(sum, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,),),
                                                ],
                                              ),
                                              Container(
                                                width: 1,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffBEBEBE)
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: data['exit_time'].toString().split('').map((digit) =>
                                                    Text(digit, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),)
                                                ).toList(),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  if(dayIndex!=6)
                                    Container(
                                      height: 145,
                                      width: 1,
                                      decoration: BoxDecoration(
                                          color: Color(0xffBEBEBE)
                                      ),
                                    )
                                ],
                              );
                            } else {
                              return const Expanded(child: SizedBox.shrink());
                            }
                          }),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
