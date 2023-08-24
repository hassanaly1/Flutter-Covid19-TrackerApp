import 'package:covid_tracker/Models/world_states_model.dart';
import 'package:covid_tracker/Services/stats_services.dart';
import 'package:covid_tracker/View/track_countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({Key? key}) : super(key: key);

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void initState() {
    super.initState();
    _animationController.dispose;
  }

  final colorList = [
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 60),
            FutureBuilder(
              future: statsServices.fetchWorldStatsRecords(),
              builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                debugPrint("has data ${snapshot.hasData}");
                debugPrint("has error ${snapshot.hasError}");
                debugPrint("has error ${(snapshot.error)}");
                debugPrint("has connection ${snapshot.connectionState}");
                if (!snapshot.hasData) {
                  debugPrint('Data araha hai');

                  return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                        color: Colors.white,
                        controller: _animationController,
                        size: 50.0),
                  );
                } else {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: {
                          "Total":
                              double.parse(snapshot.data!.cases.toString()),
                          "Recovered":
                              double.parse(snapshot.data!.recovered.toString()),
                          "Death":
                              double.parse(snapshot.data!.deaths.toString()),
                        },
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true),
                        chartRadius: 120,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left),
                        animationDuration: const Duration(milliseconds: 1200),
                        chartType: ChartType.ring,
                        colorList: colorList,
                      ),
                      const SizedBox(height: 50),
                      Card(
                        elevation: 2,
                        child: Column(
                          children: [
                            ReUsableRow(
                              title: 'Total',
                              value: snapshot.data!.cases.toString(),
                            ),
                            ReUsableRow(
                                title: 'Deaths',
                                value: snapshot.data!.deaths.toString()),
                            ReUsableRow(
                                title: 'Recovered',
                                value: snapshot.data!.recovered.toString()),
                            ReUsableRow(
                                title: 'Active',
                                value: snapshot.data!.active.toString()),
                            ReUsableRow(
                                title: 'Critical',
                                value: snapshot.data!.critical.toString()),
                            ReUsableRow(
                                title: "Today's Cases",
                                value: snapshot.data!.critical.toString()),
                            ReUsableRow(
                                title: "Today's Deaths",
                                value: snapshot.data!.todayDeaths.toString()),
                            ReUsableRow(
                                title: "Today's Recovered",
                                value:
                                    snapshot.data!.todayRecovered.toString()),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TrackCountriesScreen())),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Track Countries',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReUsableRow extends StatelessWidget {
  final String title;
  final String value;
  const ReUsableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          )
        ],
      ),
    );
  }
}
