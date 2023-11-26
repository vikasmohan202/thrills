import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/pages/matches/matches_api.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  late List<dynamic> matches;
  bool isLoading = false;
  getRequests() async {
    setState(() {
      isLoading = true;
    });
    var response = await MatchesAPI().getMatches();
    if (response.success) {
      matches = response.data['result'];
      isLoading = false;
      setState(() {});
    } else {
      matches = [];
      isLoading = false;
      setState(() {});
    }

    // {result:
    //[{_id: 654ce711f01c1427bed60058, kind: CONNECTION, status: ACCEPTED, description: Hey i want to connec with you , is_active: true, to: 654cdeb0d8afb80bc9cb6f05, from: 654ce5ac8c48695202a901ef, createdAt: 2023-11-09T14:02:56.382Z, updatedAt: 2023-11-09T16:47:06.071Z, __v: 0}, {_id: 654d3eb2be98b441fc3f08e1, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05, createdAt: 2023-11-09T20:18:58.989Z, updatedAt: 2023-11-09T20:18:58.989Z, __v: 0}, {_id: 654d3ef4be98b441fc3f08e4, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05, createdAt: 2023-11-09T20:20:04.799Z, updatedAt: 2023-11-09T20:20:04.799Z, __v: 0}, {_id: 654d3f1ebe98b441fc3f08e7, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05,
  }

  @override
  void initState() {
    getRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "matches",
                        style: const TextStyle(
                          color: Color(0xFF5F5B5B),
                          fontSize: 34,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          height: 0.04,
                        ),
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12)),
                          onPressed: () {},
                          icon: Icon(
                            Icons.sort,
                            size: 30,
                          ),
                          label: Text(''))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'This is a list of people who have liked you and your matches.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.699999988079071),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 2,
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: matches.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 140,
                            height: 120,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.transparent,
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    AllAssests.sampleWomen,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                  bottom: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      width: 108,
                                      child: Text(
                                        'Leilani, 19',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w700,
                                          height: 0.09,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 32,
                                  left: 0,
                                  right: 0,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person_add_alt_1,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
  }
}
