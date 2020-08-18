import 'package:data_visualization_app/models/recorded_activity.dart';
import 'package:data_visualization_app/services/sorting_data.dart';
import 'package:data_visualization_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Class implementing a widget giving an overview over past activities.
/// Data is being given by [activities] whereas the [overviewCode] defines the
/// time period over which the overview is being given, 0: one week 1: one month
/// 2: one year
class OverviewWidget extends StatelessWidget {
  final List<RecordedActivity> activities;
  final int overviewCode;

  OverviewWidget(this.activities, this.overviewCode);

  @override
  Widget build(BuildContext context) {
    List<List<int>> dataList =
        SortingDataService().getOverviewData(activities, overviewCode);
    List<int> runningTime = dataList[0];
    List<int> cyclingTime = dataList[1];
    List<int> climbingTime = dataList[2];

    return Container(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 4, right: 4),
              padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
              decoration: BoxDecoration(
                color: ThemeColors.darkBlue,
                borderRadius: BorderRadius.all(Radius.circular(32)),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        runningTime[3].toString() + " x ",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 12),
                      ),
                      Icon(
                        Icons.directions_run,
                        color: ThemeColors.lightBlue,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      runningTime[0].toString() +
                          " h : " +
                          runningTime[1].toString() +
                          " m",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                    child: Text(
                      runningTime[2].toString() + " km",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                    child: Text(
                      runningTime[3] == 0
                          ? "- km/run"
                          : (runningTime[2] / runningTime[3])
                                  .toStringAsPrecision(2) +
                              " km/run",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 4, right: 4),
              padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: ThemeColors.darkBlue,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        cyclingTime[3].toString() + " x ",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 12),
                      ),
                      Icon(
                        Icons.directions_bike,
                        color: ThemeColors.orange,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      cyclingTime[0].toString() +
                          " h : " +
                          cyclingTime[1].toString() +
                          " m",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                    child: Text(
                      cyclingTime[2].toString() + " km",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                    child: Text(
                      cyclingTime[3] == 0
                          ? "- km/ride"
                          : (cyclingTime[2] / cyclingTime[3])
                                  .toStringAsPrecision(2) +
                              " km/ride",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 4, right: 4),
              padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
              decoration: BoxDecoration(
                color: ThemeColors.darkBlue,
                borderRadius: BorderRadius.all(Radius.circular(32)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        climbingTime[2].toString() + " x ",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 12),
                      ),
                      Icon(
                        Icons.filter_hdr,
                        color: ThemeColors.yellowGreenish,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      climbingTime[0].toString() +
                          " h : " +
                          climbingTime[1].toString() +
                          " m",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 12),
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
