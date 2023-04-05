import 'package:flutter/material.dart';
import '../../bottomNavigation.dart';
import 'data_list.dart';
import 'info_card_show.dart';

const List<String> items = <String>['Date', 'Priority'];
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String dropdownValue = items.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: Theme.of(context).brightness == Brightness.dark ? Colors.black45 : Colors.grey[400],
          child: Column(
              children: [
                const UserInfo(),
                Expanded(
                    child: DataList())
              ]),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(focused: BottomPages.home,),
    );
  }
}





