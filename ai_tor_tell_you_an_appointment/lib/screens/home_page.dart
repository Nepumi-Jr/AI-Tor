import 'package:ai_tor_tell_you_an_appointment/screens/data.dart';
import 'package:flutter/material.dart';
import '../bottomNavigation.dart';
import 'data_list.dart';
import 'info_card.dart';

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
          color: Colors.grey[400],
          alignment: Alignment.center,
          child: Column(
              children: [
                const infoCard(name: 'Fordcer', lv: 'Level 1 (1/100)', img: 'images/test.jpg', progress: '69%', motivateText: '"Keep Going!"'),
                Container(
                    alignment: Alignment.centerRight,
                    color: Colors.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DropdownButtonHideUnderline(
                              child: Container(
                                padding: const EdgeInsets.only(top: 5, right: 5, bottom: 5, left: 10),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey.withOpacity(.3))),
                                child: DropdownButton<String>(
                                  isDense: true,
                                  borderRadius: BorderRadius.circular(10),
                                  alignment: Alignment.center,
                                  value: dropdownValue,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                  items: items.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: const TextStyle(fontWeight: FontWeight.w600),),
                                    );
                                  }).toList(),
                                ),
                              )
                          ),
                          const SizedBox(width: 20)
                        ]
                    )),
                Expanded(
                    child: DataList())
              ]),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(focused: BottomPages.home,),
    );
  }
}





