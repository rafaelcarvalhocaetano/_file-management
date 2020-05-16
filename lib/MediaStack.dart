import 'package:file_management/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MediaStack extends StatelessWidget {

  final String image;
  final Color color;
  final String media;
  final String item;
  final String privacy;
  final Color shadow;
  final Icon lock;

  MediaStack(this.image, this.color, this.media, this.item, this.privacy, this.shadow, this.lock);

  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.8,
          child: Container(
            height: 48 * Responsive.heightMultiplier,
            width: 55 * Responsive.widthMultiplier,
            decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
        Positioned(
          top: 5 * Responsive.heightMultiplier,
          left: 6 * Responsive.widthMultiplier,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                      color: this.shadow,
                      offset: Offset(2.0, 5.0),
                      blurRadius: 10.0
                  )
                ]),
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                this.image,
                height: 12 * Responsive.imageSizeMultiplier,
              ),
            ),
          ),
        ),
        Positioned(
          top: 22 * Responsive.heightMultiplier,
          left: 6 * Responsive.widthMultiplier,
          child: Column(
            children: <Widget>[
              Text(
                this.media,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800],
                    fontSize: 3.4 * Responsive.textMultiplier
                ),
              ),
              SizedBox(
                height: 1 * Responsive.heightMultiplier,
              ),
              Text(
                this.item,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                    fontSize: 2.2 * Responsive.textMultiplier
                ),
              ),
              SizedBox(
                height: 2 * Responsive.heightMultiplier,
              ),
            ],
          ),
        ),
        Positioned(
          top: 32 * Responsive.heightMultiplier,
          left: 2 * Responsive.widthMultiplier,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 4 * Responsive.widthMultiplier),
                child: this.lock,
              ),
            ],
          ),
        ),
      ],
    );
  }
}