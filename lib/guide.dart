import 'package:flutter/material.dart';
import 'package:medicine_alarm/ad_banner.dart';
import 'ad_banner.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Guide"),
          backgroundColor: Color.fromARGB(255, 0, 224, 187),
        ),
        body: Column(
          children: [
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text(
                'When you take your medicine in the morning/afternoon/evening, check it off on the checklist in the app.',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text(
                'This app will notify you of medicine time at 8am/12pm/9pm.',
                style: TextStyle(fontSize: 20),
              ),
            ),
            AdBanner(size: AdSize.largeBanner)
          ],
        ));
  }
}
