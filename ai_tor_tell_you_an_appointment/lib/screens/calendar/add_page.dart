import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const List<String> dateOfWeek = <String>['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
const List<String> months = <String>['January','February','March','April','May','June','July','August','September','October','November','December'];

class AddPage extends StatefulWidget {
  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  DateTime _dateTimeOfStart = DateTime.now();
  DateTime _dateTimeOfEnd = DateTime.now();
  TimeOfDay timeOfStart = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay timeOfEnd = const TimeOfDay(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {
    // start DATE/TIME
    final hoursOfStart = timeOfStart.hour.toString().padLeft(2, '0');
    final minutesOfStart = timeOfStart.minute.toString().padLeft(2, '0');
    final dateOfStart = _dateTimeOfStart.day;
    final monthOfStart = _dateTimeOfStart.month.toString();
    final dateNameOfStart = dateOfWeek[_dateTimeOfStart.weekday - 1];
    final monthNameOfStart = months[int.parse(monthOfStart) - 1];
    // end DATE/TIME
    final hoursOfEnd = timeOfEnd.hour.toString().padLeft(2, '0');
    final minutesOfEnd = timeOfEnd.minute.toString().padLeft(2, '0');
    final dateOfEnd = _dateTimeOfEnd.day;
    final monthOfEnd = _dateTimeOfEnd.month.toString();
    final dateNameOfEnd = dateOfWeek[_dateTimeOfEnd.weekday - 1];
    final  monthNameOfEnd = months[int.parse(monthOfEnd) - 1];

    return Scaffold(
      body: SafeArea(
        child:Container(
        color: Theme.of(context).brightness == Brightness.dark ? Colors.black26 : Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 20),
              _icon(),
              const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 30, left: 30, bottom: 5),
                  border: InputBorder.none,
                  hintText: 'Add Event Title',
                  hintStyle: TextStyle(fontSize: 28, decoration: TextDecoration.none),
                ),
                style: TextStyle(decoration: TextDecoration.none, fontSize: 28),
              ), //Title
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(margin: const EdgeInsets.only(left: 20,),child: const Icon(CupertinoIcons.clock),),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            child: Text('$dateNameOfStart, $dateOfStart, $monthNameOfStart', style: TextStyle(fontSize: 16)),
                            onTap: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2023),
                                  lastDate: DateTime(2025))
                                  .then((date) {
                                    setState(() {
                                      _dateTimeOfStart = date!;
                              });});
                            },
                          ),
                        ),
                        Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                alignment: AlignmentDirectional.centerEnd,
                                child: GestureDetector(
                                  child: Text('$hoursOfStart:$minutesOfStart', style: const TextStyle(fontSize: 16)),
                                  onTap: () async {
                                    TimeOfDay? newTime = await showTimePicker(
                                        context: context,
                                        initialTime: timeOfStart);
                                    if (newTime == null) return; // cancel
                                    setState(() => timeOfStart = newTime);
                                  },
                                )))],
                    ),
                    const SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 64),
                            child: GestureDetector(
                              child: Text('$dateNameOfEnd, $dateOfEnd, $monthNameOfEnd', style: TextStyle(fontSize: 16)),
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2023),
                                    lastDate: DateTime(2025))
                                    .then((date) {
                                  setState(() {
                                    _dateTimeOfEnd = date!;
                                  });});
                              },
                            ),
                          ),
                          Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                alignment: AlignmentDirectional.centerEnd,
                                child: GestureDetector(
                                  child: Text('$hoursOfEnd:$minutesOfEnd', style: const TextStyle(fontSize: 16)),
                                  onTap: () async {
                                    TimeOfDay? newTime = await showTimePicker(
                                        context: context,
                                        initialTime: timeOfEnd);
                                    if (newTime == null) return; // cancel
                                    setState(() => timeOfEnd = newTime);
                                  },
                                ),
                              ))]
                    ),
                  ],
                ),
              ), //Time

              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    const Icon(Icons.notifications_active_outlined),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        child: const Text('30 minute before event', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          alignment: AlignmentDirectional.centerEnd,
                          child: GestureDetector(
                            child: const Text('edit', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          ),))
                  ],
                ),
              ), //Notification Time

              const Divider(),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(padding: EdgeInsetsDirectional.only(start: 20),
                      child: Icon(Icons.location_on_outlined)),
                  prefix: SizedBox(width: 15),
                  contentPadding: EdgeInsets.only(top: 18, bottom: 5),
                  border: InputBorder.none,
                  hintText: 'Add location',
                  hintStyle: TextStyle(fontSize: 16, decoration: TextDecoration.none),
                ),
                style: TextStyle(decoration: TextDecoration.none, fontSize: 16),
              ), //Location

              const Divider(),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(padding: EdgeInsetsDirectional.only(start: 20),
                      child: Icon(CupertinoIcons.list_bullet)),
                  prefix: SizedBox(width: 15),
                  contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                  border: InputBorder.none,
                  hintText: 'Add description',
                  hintStyle: TextStyle(fontSize: 16, decoration: TextDecoration.none),
                ),
                style: TextStyle(decoration: TextDecoration.none, fontSize: 16),
              ), //description
            ],
          )
        )),
    );
  }

  Widget _icon() {
    return Row(
      children: [
        Expanded(
            child: Row(
              children: [
                const SizedBox(width: 20,),
                Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconButton(onPressed: () {
                      Navigator.of(context).pop();

                    },
                        icon: Icon(Icons.close, color: Theme.of(context).colorScheme.primary)))
              ],
            )),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container()),
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      color: Theme.of(context).colorScheme.primary,
                      margin: const EdgeInsets.only(left: 20, right: 30),
                      child: GestureDetector(
                        child: Text('save', style: TextStyle(fontSize: 16, color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ))
              ],
            ))],
    );
  }

}