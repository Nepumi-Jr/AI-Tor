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
                Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(bottom: 2),
                    color: Theme.of(context).brightness == Brightness.dark ? const Color.fromRGBO(66, 66, 66, 1) : Colors.white,
                    child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _dropdown(),
                            const SizedBox(width: 20)]
                    )),
                Expanded(
                    child: DataList())
              ]),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(focused: BottomPages.home,),
    );
  }

  Widget _dropdown() {
    return DropdownButtonHideUnderline(
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
    );
  }
}





