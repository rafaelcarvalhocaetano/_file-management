import 'package:file_management/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilePercent extends StatelessWidget {

  final String dataName;
  final String dataPercent;
  final Color color;

  FilePercent(this.dataName, this.dataPercent, this.color);

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(3 * Responsive.imageSizeMultiplier),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: this.color,
                radius: 1 * Responsive.imageSizeMultiplier,
              )
            ],
          ),
        ),
        Text(
          this.dataName,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          this.dataPercent,
          style: TextStyle(
              color: Colors.grey[600],
              letterSpacing: 0.25,
              fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }
}