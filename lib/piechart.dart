import 'dart:math';

import 'package:amazing_ui_1/data.dart';
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  const PieChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryColor,
          boxShadow: customShadow,
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: CustomPaint(
                child: Container(),
                foregroundPainter: PieChartPainter(),
              ),
            ),
            Center(
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                  boxShadow: customShadow,
                ),
                child: Align(alignment: Alignment.center,child: Text("\$1234",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center=Offset(size.width/2,size.height/2);
    double radius=min(size.width/2,size.height/2);
    var paint=Paint()
    ..style=PaintingStyle.stroke
    ..strokeWidth=100;
    double total=0;
    expenses.forEach((element) {
      total+=element['amount'];
     });
     var startRadian=-pi/2;
     for(int i=0;i<expenses.length;i++){
       var currentExpense=expenses[i];
       var sweepRadian=(currentExpense['amount']/total)*2*pi;
       paint.color=pieColors[i];
       canvas.drawArc(Rect.fromCircle(center:center,radius:radius), startRadian, sweepRadian, false, paint);
       startRadian+=sweepRadian;
     }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
