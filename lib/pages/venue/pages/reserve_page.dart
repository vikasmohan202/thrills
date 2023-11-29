import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/all_colors.dart';
import 'package:trills/background.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        Padding: EdgeInsets.only(top: 20, right: 15, left: 15),
        widget: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Icon(
              Icons.arrow_back_ios,
              color: ColorPallate.purple,
            ),
            centerTitle: true,
            title: Text(
              'Reserve',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4B164C),
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                // height: 0.08,
                // letterSpacing: 0.20,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: ListView(children: [
            SizedBox(
              height: 15,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                AllAssests.sampleHotel,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Solaria ',
              style: TextStyle(
                // color: Color(0xFF262628),
                fontSize: 26,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                // height: 0,
              ),
            ),
            Text(
              'Solaria adalah restoran lokal asli Indonesia yang berdiri sejak tahun 1995, merupakan restoran keluarga dengan konsep casual dining yang menyajikan menu-menu makanan khas yang disajikan secara fresh food (dimasak setelah makanan dipsesan).',
              style: TextStyle(
                // color: Color(0xFF262628),
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                // height: 0,
                // letterSpacing: -0.30,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.event_seat_outlined,
                  color: Color(0xFF787878),
                ),
                Text(
                  '12 Seat left',
                  style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.location_on,
                  color: Color(0xFF787878),
                ),
                Text(
                  '200 M',
                  style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Book Venue'))
          ]),
        ));
  }
}
