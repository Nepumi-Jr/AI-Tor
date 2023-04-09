import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';

const List<String> dateOfWeek = <String>[
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];
const List<String> months = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

class EditPage extends StatefulWidget {
  final String activityId;
  const EditPage({Key? key, required this.activityId}) : super(key: key);
  @override
  EditPageState createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  late DateTime _dateTimeOfStart;
  late DateTime _dateTimeOfEnd;
  late TimeOfDay timeOfStart;
  late TimeOfDay timeOfEnd;
  late TextEditingController _controller;
  final locationCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  @override
  void initState() {
    User Udata = Provider.of<User>(context, listen: false);
    var _activities = Udata.getActivitiesById(widget.activityId);
    _dateTimeOfStart = _activities.getEventTime();
    _dateTimeOfEnd = _activities.getEndEventTime();
    timeOfStart = TimeOfDay.fromDateTime(_activities.getEventTime());
    timeOfEnd = TimeOfDay.fromDateTime(_activities.getEndEventTime());
    _controller =
        TextEditingController(text: _activities.calendarEvent.summary);
  }

  @override
  Widget build(BuildContext context) {
    // start DATE/TIME
    final String hoursOfStart = timeOfStart.hour.toString().padLeft(2, '0');
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
    final monthNameOfEnd = months[int.parse(monthOfEnd) - 1];

    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black26
                  : Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _icon(),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: 30, left: 30, bottom: 5),
                      border: InputBorder.none,
                      hintText: 'Edit Event Title',
                      hintStyle: TextStyle(
                          fontSize: 28, decoration: TextDecoration.none),
                    ),
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 28,
                    ),
                  ), //Title
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                              ),
                              child: const Icon(CupertinoIcons.clock),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                child: Text(
                                    '$dateNameOfStart, $dateOfStart, $monthNameOfStart',
                                    style: TextStyle(fontSize: 16)),
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2023),
                                          lastDate: DateTime(2025))
                                      .then((date) {
                                    setState(() {
                                      _dateTimeOfStart = date!;
                                    });
                                  });
                                },
                              ),
                            ),
                            Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: GestureDetector(
                                      child: Text(
                                          '$hoursOfStart:$minutesOfStart',
                                          style: const TextStyle(fontSize: 16)),
                                      onTap: () async {
                                        TimeOfDay? newTime =
                                            await showTimePicker(
                                                context: context,
                                                initialTime: timeOfStart);
                                        if (newTime == null) return; // cancel
                                        setState(() => timeOfStart = newTime);
                                      },
                                    )))
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 64),
                                child: GestureDetector(
                                  child: Text(
                                      '$dateNameOfEnd, $dateOfEnd, $monthNameOfEnd',
                                      style: TextStyle(fontSize: 16)),
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2023),
                                            lastDate: DateTime(2025))
                                        .then((date) {
                                      setState(() {
                                        _dateTimeOfEnd = date!;
                                      });
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                alignment: AlignmentDirectional.centerEnd,
                                child: GestureDetector(
                                  child: Text('$hoursOfEnd:$minutesOfEnd',
                                      style: const TextStyle(fontSize: 16)),
                                  onTap: () async {
                                    TimeOfDay? newTime = await showTimePicker(
                                        context: context,
                                        initialTime: timeOfEnd);
                                    if (newTime == null) return; // cancel
                                    setState(() => timeOfEnd = newTime);
                                  },
                                ),
                              ))
                            ]),
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
                            child: const Text('30 minute before event',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          alignment: AlignmentDirectional.centerEnd,
                          child: GestureDetector(
                            child: const Text('edit',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ),
                        ))
                      ],
                    ),
                  ), //Notification Time

                  const Divider(),
                  TextField(
                    controller: locationCtrl,
                    decoration: const InputDecoration(
                      prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 20),
                          child: Icon(Icons.location_on_outlined)),
                      prefix: SizedBox(width: 15),
                      contentPadding: EdgeInsets.only(top: 18, bottom: 5),
                      border: InputBorder.none,
                      hintText: 'Add location',
                      hintStyle: TextStyle(
                          fontSize: 16, decoration: TextDecoration.none),
                    ),
                    style: const TextStyle(
                        decoration: TextDecoration.none, fontSize: 16),
                  ), //Location

                  const Divider(),
                  TextField(
                    controller: descriptionCtrl,
                    decoration: const InputDecoration(
                      prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 20),
                          child: Icon(CupertinoIcons.list_bullet)),
                      prefix: SizedBox(width: 15),
                      contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                      border: InputBorder.none,
                      hintText: 'Add description',
                      hintStyle: TextStyle(
                          fontSize: 16, decoration: TextDecoration.none),
                    ),
                    style: const TextStyle(
                        decoration: TextDecoration.none, fontSize: 16),
                  ), //description
                ],
              ))),
    );
  }

  Widget _icon() {
    return Row(
      children: [
        Expanded(
            child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
                alignment: AlignmentDirectional.centerStart,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close,
                        color: Theme.of(context).colorScheme.primary)))
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
                child: Text(
                  'save',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Colors.black),
                ),
                onTap: () {
                  //try to save
                  User uData = Provider.of<User>(context, listen: false);

                  //? show alert dialog
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Creating new activity...'),
                        content: Container(
                          width: 100,
                          height: 100,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    },
                    barrierDismissible: false,
                  );
                  _dateTimeOfStart = _dateTimeOfStart.copyWith(
                      hour: timeOfStart.hour, minute: timeOfStart.minute);
                  _dateTimeOfEnd = _dateTimeOfEnd.copyWith(
                      hour: timeOfEnd.hour, minute: timeOfEnd.minute);

                  uData
                      .editActivities(
                        widget.activityId,
                        _controller.text,
                        _dateTimeOfStart,
                        _dateTimeOfEnd,
                        descriptionCtrl.text,
                        locationCtrl.text,
                      )
                      .then((value) => Navigator.of(context)
                          .popUntil((route) => route.isFirst))
                      .catchError((e) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(e.toString()),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  });
                },
              ),
            ))
          ],
        ))
      ],
    );
  }
}
