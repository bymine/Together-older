import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:together_android/page/after_login/live_project/live_project_page.dart';
import 'package:together_android/page/after_login/match_member/match_member_main_page.dart';
import 'package:together_android/page/after_login/match_project/match_project_page.dart';
import 'package:together_android/page/after_login/profile/user_detail_profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedMenuIndex = 0;
  List<GButton> tabs = [];
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600]!,
    Colors.teal,
    Colors.green,
  ];
  List<Widget> _children = [
    LiveProjectBody(),
    MatchProjectBody(),
    MatchMemberBody(),
    UserDetailProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  backgroundColor: Colors.green[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  titlePadding: EdgeInsets.all(0),
                  contentPadding: EdgeInsets.all(0),
                  actionsPadding: EdgeInsets.all(0),
                  content: Container(
                      width: width,
                      height: height * 0.3,
                      child: Image.asset(
                        "assets/exit.png",
                        fit: BoxFit.fitWidth,
                      )),
                  actions: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Together 앱을 종료하시겠습니까?",
                          style: TextStyle(fontSize: width * 0.048),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: width * 0.3,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("취소",
                                        style: TextStyle(color: Colors.black))),
                              ),
                              Container(
                                  width: width * 0.3,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white),
                                    onPressed: () {
                                      SystemNavigator.pop();
                                    },
                                    child: Text("확인",
                                        style: TextStyle(color: Colors.black)),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ]);
            });
        // showAlertDialog(
        //     context,
        //     Container(
        //         decoration: BoxDecoration(
        //             border: Border(bottom: BorderSide(color: Colors.grey))),
        //         width: width,
        //         height: height * 0.4,
        //         child: Image.asset(
        //           "assets/exit.png",
        //           fit: BoxFit.fitWidth,
        //         )),
        //     SizedBox(
        //       height: 1,
        //     ),
        //     [
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text(
        //             "Together 앱을 종료하시겠습니까?",
        //             style: TextStyle(fontSize: width * 0.048),
        //           ),
        //           Container(
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
        //               children: [
        //                 Container(
        //                   width: width * 0.3,
        //                   child: ElevatedButton(
        //                       style: ElevatedButton.styleFrom(
        //                           primary: Colors.white),
        //                       onPressed: () {
        //                         Navigator.of(context).pop();
        //                       },
        //                       child: Text("취소",
        //                           style: TextStyle(color: Colors.black))),
        //                 ),
        //                 Container(
        //                     width: width * 0.3,
        //                     child: ElevatedButton(
        //                       style: ElevatedButton.styleFrom(
        //                           primary: Colors.white),
        //                       onPressed: () {
        //                         SystemNavigator.pop();
        //                       },
        //                       child: Text("확인",
        //                           style: TextStyle(color: Colors.black)),
        //                     )),
        //               ],
        //             ),
        //           )
        //         ],
        //       ),
        //     ]);
        return false;
      },
      child: Scaffold(
        body: _children[_selectedMenuIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          width: width,
          height: 70,
          child: GNav(
            color: Colors.grey[800],
            activeColor: Colors.purple,
            iconSize: 24,
            tabBackgroundColor: Colors.green.withOpacity(0.1),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            duration: Duration(milliseconds: 1000),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.manage_search_outlined,
                text: 'Search project',
              ),
              GButton(
                icon: Icons.person_search_outlined,
                text: 'Search member',
              ),
              GButton(
                icon: Icons.person_outline_outlined,
                text: 'Profile',
              )
            ],
            selectedIndex: _selectedMenuIndex,
            onTabChange: (index) {
              setState(() {
                _selectedMenuIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
