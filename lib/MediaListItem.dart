import 'package:file_management/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaItemList extends StatelessWidget {

  final String title;
  final Color icon;
  final Color accent;
  final String meta;
  final IconData mediaIcon;

  MediaItemList(this.title, this.icon, this.accent, this.meta, this.mediaIcon);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: 2 * Responsive.heightMultiplier,
          left: 6 * Responsive.widthMultiplier
      ),
      child: Row(
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: this.accent,
              ),
              child: Padding(
                padding: EdgeInsets.all(3 * Responsive.imageSizeMultiplier),
                child: Icon(
                  this.mediaIcon,
                  size: 6 * Responsive.imageSizeMultiplier,
                  color: this.icon,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0 * Responsive.widthMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(
                    fontSize: 2.3 * Responsive.textMultiplier,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[600],
                  ),
                ),
                SizedBox(
                  height: 0.5 * Responsive.heightMultiplier,
                ),
                Text(
                  this.meta,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 1.0 * Responsive.textMultiplier,
                    color: Colors.grey[500]
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}