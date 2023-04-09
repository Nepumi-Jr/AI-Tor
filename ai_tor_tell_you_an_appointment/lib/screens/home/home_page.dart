import 'package:ai_tor_tell_you_an_appointment/backend/LangManager.dart';
import 'package:flutter/material.dart';
import '../../bottomNavigation.dart';
import 'data_list.dart';
import 'info_card.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black45
              : Colors.grey[400],
          child: Column(children: [
            const UserInfoCard(),
            Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(bottom: 2),
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromRGBO(66, 66, 66, 1)
                    : Colors.white,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  // _dropdown(),
                  const SizedBox(height: 20)
                ])),
            Expanded(child: DataList())
          ]),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        focused: BottomPages.home,
      ),
    );
  }
}
