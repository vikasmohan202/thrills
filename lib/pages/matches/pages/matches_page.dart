import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/pages/matches/matches_api.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  getRequests() async {
    var response = await MatchesAPI().getMatches();
    print(response);


    // {result: 
    //[{_id: 654ce711f01c1427bed60058, kind: CONNECTION, status: ACCEPTED, description: Hey i want to connec with you , is_active: true, to: 654cdeb0d8afb80bc9cb6f05, from: 654ce5ac8c48695202a901ef, createdAt: 2023-11-09T14:02:56.382Z, updatedAt: 2023-11-09T16:47:06.071Z, __v: 0}, {_id: 654d3eb2be98b441fc3f08e1, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05, createdAt: 2023-11-09T20:18:58.989Z, updatedAt: 2023-11-09T20:18:58.989Z, __v: 0}, {_id: 654d3ef4be98b441fc3f08e4, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05, createdAt: 2023-11-09T20:20:04.799Z, updatedAt: 2023-11-09T20:20:04.799Z, __v: 0}, {_id: 654d3f1ebe98b441fc3f08e7, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05,
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      // 243,239,254
      // color:             Color.fromARGB(255, 249, 216, 248),
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 252, 232, 251),
            Color.fromRGBO(245, 242, 253, 1),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
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
                    style:
                        ElevatedButton.styleFrom(padding: EdgeInsets.all(12)),
                    onPressed: () {},
                    icon: Icon(
                      Icons.sort,
                      size: 30,
                    ),
                    label: Text(''))
              ],
            ),
            const SizedBox(height: 20),
            FutureBuilder(
                future: getRequests(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                  if (snapshot.hasData) {
                    List data = snapshot.data as List;
                    return Expanded(
                      child: SingleChildScrollView(
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 2,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                // height: 150,
                                // width: 60,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Stack(
                                  // alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    // Image.asset(
                                    //   AllAssests.sampleWomen,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    Center(child: Text('I wan to connect')),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: ShapeDecoration(
                                            color: Color.fromRGBO(0, 0, 0, 0.3),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(8.0),
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                              ),
                                            )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Name',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.share_rounded,
                                                  color: Colors.white,
                                                ),
                                                Icon(
                                                  Icons.comment,
                                                  color: Colors.white,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    );
                  }
                  return Center(child: Text('No data'));
                }),
          ],
        ),
      ),
    );
  }
}


// Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Column(
//           // physics: NeverScrollableScrollPhysics(),
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "matches",
//                   style: const TextStyle(
//                     color: Color(0xFF5F5B5B),
//                     fontSize: 34,
//                     fontFamily: 'DM Sans',
//                     fontWeight: FontWeight.w700,
//                     height: 0.04,
//                   ),
//                 ),
//                 ElevatedButton.icon(
//                     style:
//                         ElevatedButton.styleFrom(padding: EdgeInsets.all(12)),
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.sort,
//                       size: 30,
//                     ),
//                     label: Text(''))
//               ],
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: GridView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       childAspectRatio: 1 / 2,
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemCount: 10,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         // height: 150,
//                         // width: 60,
//                         decoration: ShapeDecoration(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           color: Colors.white,
//                         ),
//                         child: Stack(
//                           // alignment: AlignmentDirectional.bottomCenter,
//                           children: [
//                             Image.asset(
//                               AllAssests.sampleWomen,
//                               fit: BoxFit.cover,
//                             ),
//                             Positioned(
//                               bottom: 0,
//                               right: 0,
//                               left: 0,
//                               child: Container(
//                                 padding: EdgeInsets.all(8.0),
//                                 decoration: ShapeDecoration(
//                                     color: Color.fromRGBO(0, 0, 0, 0.3),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.only(
//                                         bottomRight: Radius.circular(8.0),
//                                         bottomLeft: Radius.circular(8.0),
//                                       ),
//                                     )),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       'Name',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Icon(
//                                           Icons.share_rounded,
//                                           color: Colors.white,
//                                         ),
//                                         Icon(
//                                           Icons.comment,
//                                           color: Colors.white,
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     }),
//               ),
//             ),
//           ],
//         ),
//       ),