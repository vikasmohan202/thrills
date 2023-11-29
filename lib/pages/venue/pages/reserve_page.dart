import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/all_colors.dart';
import 'package:trills/background.dart';
import 'package:trills/pages/home/widgets/appbar_back_button.dart';
import 'package:trills/routes.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        Padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        widget: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: customBackButton(context),
            centerTitle: true,
            title: const Text(
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
            const SizedBox(
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
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Solaria ',
              style: TextStyle(
                // color: Color(0xFF262628),
                fontSize: 26,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                // height: 0,
              ),
            ),
            const Text(
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
            const Row(
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
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.meetupPage);
                },
                child: const Text('Book Venue'))
          ]),
        ));
  }
}
