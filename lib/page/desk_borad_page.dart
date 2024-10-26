import 'package:budget_monthly/color/home_color_page.dart';
import 'package:budget_monthly/json/activity_json.dart';
import 'package:budget_monthly/page/your_balance_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class DeskBoradPage extends StatelessWidget {
  const DeskBoradPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(context), // Pass context here
    );
  }
  Widget getBody(BuildContext context) {
    // Receive context here
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 340,
            child: Stack(
              children: [
                appBarCurve(context),
                appBarBalance(context)
              ], // Pass context
            ),
          ),
          const SizedBox(height: 20),
          getActivityBar(context),
          const SizedBox(height: 20),
          getVerification(context),
          const SizedBox(height: 25),
          getNewsPrpmo(context),
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget appBarCurve(BuildContext context) {
    // Receive context here
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.25,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [primary, secondary]),
            boxShadow: [
              BoxShadow(
                color: bgColor.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 10,
                // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>YourBalancePage()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const  Text(
                            "\$",
                            style: TextStyle(fontSize: 22, color: white),
                          ),
                          const  Text(
                            "1,752",
                            style: TextStyle(fontSize: 30, color: white),
                          ),
                        ],
                      ),
                      const  SizedBox(height: 2),
                      Text(
                        "Available balance",
                        style: TextStyle(color: white.withOpacity(0.8)),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1663431512297-993006b0098b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2M3x8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Positioned(
                      top: 35,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            border: Border.all(color: primary)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarBalance(BuildContext context) {
    // Pass context similarly
    var size = MediaQuery.of(context).size;
    return Positioned(
        bottom: 17,
        left: 0,
        right: 0,
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 200,
              width: size.width,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.01),
                      spreadRadius: 110,
                      blurRadius: 10,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent,
                                ),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Spent",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: black.withOpacity(0.5),
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  const Text(
                                    "\$1,460",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: black,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primary,
                                ),
                              ),
                              SizedBox(width:15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Earned",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: black.withOpacity(0.5),
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "\$3,850",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: black,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(),
                    SizedBox(height: 5),
                    Text(
                      "You spent \$1,230 on dinning out this mounth,\n"
                      "let's try to make it lower",
                      style: TextStyle(
                        height: 1.6,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Tell me more",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: primary,
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  Widget getActivityBar(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Activity",
            style: TextStyle(
              fontSize: 17,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 25,
            children: List<Widget>.generate(items.length, (value) {
              return Container(
                width: (size.width / 3) - 30,
                height: (size.width / 3) - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(0.01),
                          spreadRadius: 10,
                          blurRadius: 10)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors: [
                            primary,
                            secondary,
                          ])),
                      child: Icon(
                        items[value]['icon'],
                        color: white.withOpacity(0.9),
                        size: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      items[value]['title'],
                      style: TextStyle(
                        color: black.withOpacity(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget getVerification(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Completed verification",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: black,
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: size.width,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.01),
                    blurRadius: 10,
                    spreadRadius: 10,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "60%",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "3 of 10 completed",
                        style: TextStyle(
                          fontSize: 13,
                          color: black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      Container(
                        height: 8,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: black.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 8,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [primary, secondary],
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.person, color: primary, size: 26),
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal information",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color:black.withOpacity(0.6)
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "When you register for an account.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color:black.withOpacity(0.5)
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "we collect personal information",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color:black.withOpacity(0.5)
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Continue",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color:primary
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.contacts,size: 25,color: primary,),
                      SizedBox(width: 15),
                      Text(
                        "Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color:black.withOpacity(0.7)
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.email,size: 26,color: primary,),
                      SizedBox(width: 15),
                      Text(
                        "Confirm email",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color:black.withOpacity(0.7)
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          )
        ]));
  }
  Widget getNewsPrpmo(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "News and promo",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: black,
            ),
          ),
          const  SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [BoxShadow(
                color: black.withOpacity(0.015),
                blurRadius: 1,
                spreadRadius: 10
              )],
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: AssetImage("assets/promo_news.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all( 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shared and invite your friends",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color:black.withOpacity(0.6)
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Invite friend to register on your app.for every",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color:black.withOpacity(0.5)
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "user your invite, you will earn up to \$10.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color:black.withOpacity(0.5)
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Invite Now",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color:primary
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
