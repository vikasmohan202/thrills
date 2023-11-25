import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/pages/home/home_api.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget(
      {super.key,
      required this.description,
      required this.likes,
      required this.post_id,
      required this.user_id});
  String description;
  String likes;
  String post_id;
  String user_id;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  bool liked = false;
  bool request = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange,
      // width: MediaQuery.sizeOf(context).width,
      // height: ,
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1.4))),
      child: IntrinsicHeight(
        child: Row(
            // mainAxisAlignment: Maina,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                // direction: Axis.vertical,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  // Container(
                  //   color: Color.fromRGBO(217, 217, 217, 1),
                  //   // height: double.maxFinite,
                  //   width: 2,
                  // ),
                  Expanded(
                    child: VerticalDivider(
                      width: 20,
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                  ),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'tobi',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                    Text(
                      widget.description,
                      textAlign: TextAlign.start,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'DM Sans',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            if (liked == false) {
                              await HomeAPI().likeThePOst(widget.post_id);
                            }
                            setState(() {
                              liked = true;
                            });
                          },
                          child: Icon(
                            liked == true
                                ? Icons.favorite
                                : Icons.favorite_border_rounded,
                            color: liked == true ? Colors.red : Colors.black,
                            size: 30,
                          ),
                        ),
                        Image.asset(
                          AllAssests.commentIcon,
                          height: 35,
                          width: 35,
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              request = true;
                            });
                            if (liked == false) {
                              await HomeAPI().sendUserRequest(widget.user_id);
                            }
                          },
                          child: Icon(
                            request == true
                                ? Icons.person_add_alt_rounded
                                : Icons.person_add_alt_outlined,
                            color: request == true ? Colors.blue : Colors.black,
                            size: 30,
                          ),
                        ),
                        // Image.asset(
                        //   AllAssests.userIcon,
                        //   height: 30,
                        //   width: 30,
                        // ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft, // Align text to the left
                      child: Text(
                        '26 replies  ${widget.likes} likes',
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
