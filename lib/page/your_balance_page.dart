import 'package:budget_monthly/color/home_color_page.dart';
import 'package:budget_monthly/json/categoryList_json.dart';
import 'package:budget_monthly/json/merchant_json.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';

class YourBalancePage extends StatefulWidget {
  const YourBalancePage({Key? key}) : super(key: key);

  @override
  State<YourBalancePage> createState() => _YourBalancePageState();
}

class _YourBalancePageState extends State<YourBalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
            size: 22,
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15),
          child: Text(
            "Set budget",
            style: TextStyle(
                color: primary, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          getBalance(),
          SizedBox(
            height: 8,
          ),
          getTopMerchant(),
          SizedBox(
            height: 20,
          ),
          getTopCategory(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget getBalance() {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Text(
            "Your balance is \$1,752",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "By this time last month, you spent\n slightly higher (\$2,450)",
            style: TextStyle(fontSize: 14, height: 1.6),
          ),
          Container(
            height: 200,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Image.asset('assets/promo_news.png'),
                ),
                Positioned(
                    bottom: 17,
                    left: 0,
                    right: 0,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: 65,
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
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Spent",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: black.withOpacity(0.5),
                                              ),
                                            ),
                                            SizedBox(height: 1),
                                            const Text(
                                              "\$1,460",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: black,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primary,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Earned",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: black.withOpacity(0.5),
                                              ),
                                            ),
                                            SizedBox(height: 1),
                                            Text(
                                              "\$3,850",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: black,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getTopMerchant() {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top merchent",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
                children: List<Widget>.generate(
              merchantList.length,
              (index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: black.withOpacity(0.015),
                                      blurRadius: 10,
                                      spreadRadius: 10,
                                    )
                                  ]),
                              child: Center(
                                  child: Image.network(
                                      merchantList[index]["img"])),
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  merchantList[index]["name"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: black.withOpacity(0.8)),
                                ),
                                Text(
                                  merchantList[index]["transaction"],
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: black.withOpacity(0.4)),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          merchantList[index]['price'],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 5),
                ],
              ),
            ))
          ],
        ));
  }

  Widget getTopCategory() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top category",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List<Widget>.generate(
              categoryList.length,
              (index) => Container(
                margin: EdgeInsets.only(right: 10, top: 15),
                width: 120,
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(0.015),
                        blurRadius: 10,
                        spreadRadius: 10,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 22, left: 15, right: 15, bottom: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 70,
                        child: CircleProgressBar(
                          strokeWidth: 4.20,
                          foregroundColor: primary,
                          value: categoryList[index]['percentage'],
                          backgroundColor: black.withOpacity(0.12),
                          child: Center(child: Text(categoryList[index]['img'],style: TextStyle(fontSize: 20),)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categoryList[index]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Text(
                        categoryList[index]['price'],
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                            color: black.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 70,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: black.withOpacity(0.09),
                              )
                            ],
                          ),
                          child: Center(
                              child: Text(
                            'on track',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: black.withOpacity(0.5)),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
