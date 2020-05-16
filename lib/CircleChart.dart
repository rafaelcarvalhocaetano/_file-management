import 'package:file_management/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class CircleChart extends StatelessWidget {

  final double sizing;
  final double complete;
  final double incomplete;
  final Color color;

  CircleChart(this.sizing, this.complete, this.incomplete, this.color);

  Widget build(BuildContext context) {
    return AnimatedCircularChart(
      size: Size(this.sizing * Responsive.imageSizeMultiplier, 0.0),
      initialChartData: <CircularStackEntry> [
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
                this.complete,
                this.color,
                rankKey: 'completed'
            ),
            new CircularSegmentEntry(
                this.complete,
                Colors.grey[100],
                rankKey: 'completed'
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      edgeStyle: SegmentEdgeStyle.round,
      percentageValues: true,
    );
  }
}