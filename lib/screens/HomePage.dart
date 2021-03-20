import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/models/topOfApp.dart';
import 'package:sizer/sizer.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    const Color baseColor = Color(0xFFEFF3FF);
    const Color appColor = Color(0xFF5855C0);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return Scaffold(
              backgroundColor: NeumorphicTheme.baseColor(context),
              body: SafeArea(
                child: Container(
                  height: myHeight * 1,
                  width: myWidth * 1,
                  decoration: BoxDecoration(
                    color: baseColor,
                    border: Border.all(
                      color: appColor,
                      width: myWidth * .015,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 4.0.h, horizontal: 2.0.w),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopOfTheApp(),
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0.h, horizontal: 2.0.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(1.0.h),
                                    bottomRight: Radius.circular(1.0.h),
                                    topRight: Radius.circular(1.0.h),
                                    topLeft: Radius.circular(15.0.h),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      appColor,
                                      appColor.withOpacity(.55)
                                    ],
                                  ),
                                ),
                                height: 25.0.h,
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.0.h, horizontal: 5.0.w),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: 'Legs ',
                                              style: TextStyle(
                                                fontSize: 20.0.sp,
                                                fontWeight: FontWeight.bold,
                                                color: baseColor,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'and',
                                              style: TextStyle(
                                                fontSize: 20.0.sp,
                                                fontWeight: FontWeight.w300,
                                                color: baseColor,
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: 'Glutes ',
                                              style: TextStyle(
                                                fontSize: 20.0.sp,
                                                fontWeight: FontWeight.bold,
                                                color: baseColor,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Workout',
                                              style: TextStyle(
                                                fontSize: 20.0.sp,
                                                fontWeight: FontWeight.w300,
                                                color: baseColor,
                                              ),
                                            ),
                                          ]),
                                        ),
                                        SizedBox(height: 1.0.h),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.network_cell,
                                              color: baseColor,
                                            ),
                                            SizedBox(width: 1.0.h),
                                            Text(
                                              'Advance',
                                              style: TextStyle(
                                                  color: baseColor,
                                                  fontSize: 10.0.sp,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 1.0.h),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.alarm,
                                              color: baseColor,
                                            ),
                                            SizedBox(width: 1.0.h),
                                            Text(
                                              '45 Min',
                                              style: TextStyle(
                                                  color: baseColor,
                                                  fontSize: 10.0.sp,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 1.0.h),
                                        NeumorphicButton(
                                          style: NeumorphicStyle(
                                              intensity: 0.4, color: baseColor),
                                          onPressed: () {
                                            print('yep');
                                          },
                                          child: Text("Start Workout"),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: -25.0.w,
                              top: 3.0.h,
                              child: Image.asset(
                                'assets/images/squat.png',
                                height: 200,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.0.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Today\'s Activity',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0.sp),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Details",
                                  style: TextStyle(color: appColor),
                                ),
                                Icon(Icons.arrow_forward_outlined,
                                    color: appColor)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 2.0.h),
                        Container(
                          height: 10.0.h,
                          width: myWidth * 1,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              todaysWidget(
                                  icon: Icons.directions_run,
                                  text1: 'STEPS',
                                  text2: '1,298'),
                              todaysWidget(
                                  icon: Icons.emoji_food_beverage_outlined,
                                  text1: 'CALORIES',
                                  text2: '890'),
                              todaysWidget(
                                  icon: CupertinoIcons.heart_circle,
                                  text1: 'BPM',
                                  text2: '88'),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.0.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Daily Activity',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0.sp),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Details",
                                  style: TextStyle(color: appColor),
                                ),
                                Icon(Icons.arrow_forward_outlined,
                                    color: appColor)
                              ],
                            )
                          ],
                        ),
                        //date
                        SizedBox(height: 2.0.h),
                        Container(
                          child: DatePicker(
                            DateTime.now(),
                            daysCount: 365,
                            width: 60,
                            height: 80,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: appColor.withOpacity(.7),
                            selectedTextColor: baseColor,
                          ),
                        ),
                        SizedBox(height: 4.0.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            bottomCards(
                              appColor: Color(0xFF5855C0),
                              depth: -5,
                              icon: Icons.home_outlined,
                              text: 'Home',
                            ),
                            bottomCards(
                              depth: 5,
                              text: 'Activity',
                              icon: Icons.trending_up,
                            ),
                            bottomCards(
                              depth: 5,
                              text: 'Setting',
                              icon: Icons.settings_applications_outlined,
                            ),
                            bottomCards(
                              depth: 5,
                              text: 'profile',
                              icon: Icons.face,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class todaysWidget extends StatelessWidget {
  todaysWidget({this.icon, this.text1, this.text2});
  final Color appColor = Color(0xFF5855C0);
  final IconData icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 1.0.w),
      height: 10.0.h,
      width: 30.0.w,
      child: Neumorphic(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: appColor,
                  size: 20.0.sp,
                ),
                Text(
                  text1,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 10.0.sp,
                  ),
                ),
              ],
            ),
            Text(
              text2,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: appColor,
                fontSize: 20.0.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class bottomCards extends StatelessWidget {
  bottomCards({this.text, this.depth, this.icon, this.appColor = Colors.grey});
  final Color appColor;
  final String text;
  final double depth;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Neumorphic(
        style: NeumorphicStyle(depth: depth, color: Color(0xFFEEF5FE)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.0.w, horizontal: 3.0.w),
          child: Column(
            children: [
              Icon(
                icon,
                size: 30.0.sp,
                color: appColor.withOpacity(.8),
              ),
              Text(
                text,
                style: TextStyle(color: appColor.withOpacity(.5)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
