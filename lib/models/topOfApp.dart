import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sizer/sizer.dart';

class TopOfTheApp extends StatefulWidget {
  @override
  _TopOfTheAppState createState() => _TopOfTheAppState();
}

class _TopOfTheAppState extends State<TopOfTheApp> {
  bool searchBar = true;
  @override
  Widget build(BuildContext context) {
    const Color appColor = Color(0xFF5855C0);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil().init(constraints, orientation);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Zoef',
                  style: TextStyle(
                      fontSize: 16.0.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: 'Find A ',
                      style: TextStyle(
                          fontSize: 20.0.sp, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Workout',
                      style: TextStyle(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                          color: appColor),
                    )
                  ]),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  print("object");
                  if (searchBar == true) {
                    searchBar = false;
                  } else {
                    searchBar = true;
                  }
                  print(searchBar);
                });
              },
              child: searchBar
                  ? NeumorphicIcon(
                      Icons.search_rounded,
                      size: 40.0.sp,
                      style: NeumorphicStyle(color: Colors.black54, depth: 8),
                    )
                  : Container(
                      width: 50.0.w,
                      child: Neumorphic(
                        child: TextField(
                          autofocus: true,
                          onSubmitted: (_) {
                            setState(() {
                              searchBar = true;
                            });
                          },
                        ),
                      ),
                    ),
            ),
          ],
        );
      });
    });
  }
}
