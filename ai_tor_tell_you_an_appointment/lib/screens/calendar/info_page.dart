import 'package:ai_tor_tell_you_an_appointment/backend/LangManager.dart';
import 'package:flutter/material.dart';
import 'add_page.dart';
import 'edit_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../data/data.dart';
import 'calendar_page.dart';

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

class InfoPage extends StatefulWidget {
  final String idEvent;
  const InfoPage(this.idEvent, {Key? key}) : super(key: key);
  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  late DateTime _dateTimeOfStart;
  late DateTime _dateTimeOfEnd;
  late TimeOfDay timeOfStart;
  late TimeOfDay timeOfEnd;
  late TextEditingController _controller;
  late Activities _activities;

  @override
  void initState() {
    User Udata = Provider.of<User>(context, listen: false);
    _activities = Udata.getActivitiesById(widget.idEvent);
    _dateTimeOfStart = _activities.getEventTime();
    _dateTimeOfEnd = _activities.getEndEventTime();
    timeOfStart = TimeOfDay.fromDateTime(_activities.getEventTime());
    timeOfEnd = TimeOfDay.fromDateTime(_activities.getEndEventTime());
    _controller =
        TextEditingController(text: _activities.calendarEvent.summary);
  }

  Widget _icon() {
    return Row(
      children: [
        Expanded(
            child: Row(
          children: [
            const SizedBox(width: 20),
            Container(
                alignment: AlignmentDirectional.centerStart,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close,
                        color: Theme.of(context).colorScheme.primary)))
          ],
        )),
        Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SafeArea(
                        child: EditPage(
                            activityId: _activities.calendarEvent.id!))));
              },
              icon: Icon(Icons.edit,
                  color: Theme.of(context).colorScheme.primary)),
          const SizedBox(width: 25)
        ]))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // start DATE/TIME
    final String hoursOfStart = timeOfStart.hour.toString().padLeft(2, '0');
    final minutesOfStart = timeOfStart.minute.toString().padLeft(2, '0');
    final dateOfStart = _dateTimeOfStart.day;
    final monthOfStart = _dateTimeOfStart.month.toString();

    // end DATE/TIME
    final hoursOfEnd = timeOfEnd.hour.toString().padLeft(2, '0');
    final minutesOfEnd = timeOfEnd.minute.toString().padLeft(2, '0');
    final dateOfEnd = _dateTimeOfEnd.day;
    final monthOfEnd = _dateTimeOfEnd.month.toString();

    return Scaffold(
        body: SafeArea(
            child: Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black26
                    : Colors.white,
                child: Column(children: [
                  const SizedBox(height: 20),
                  _icon(),
                  Container(
                      margin: const EdgeInsets.only(top: 20, left: 40),
                      child: Column(children: [
                        //? display title
                        Title(titleText: _activities.calendarEvent.summary!),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                            leading: Icon(
                              Icons.arrow_right,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            title: Text(
                              '$dateOfStart/$monthOfStart/2023 \nเวลา $hoursOfStart:$minutesOfStart - \n$dateOfEnd/$monthOfEnd/2023 \nเวลา $hoursOfEnd:$minutesOfEnd',
                              style: const TextStyle(fontSize: 16),
                            )),
                        ListTile(
                          leading: Icon(Icons.notifications,
                              color: Theme.of(context).colorScheme.primary),
                          title: const Text('30 นาทีก่อนกิจกรรม',
                              style: TextStyle(fontSize: 18)),
                        ),
                        ListTile(
                            leading: Icon(Icons.location_on,
                                color: Theme.of(context).colorScheme.primary),
                            title: Text(_activities.location.name,
                                style: const TextStyle(fontSize: 16))),
                        ListTile(
                            leading: Icon(Icons.list,
                                color: Theme.of(context).colorScheme.primary),
                            title: Text(
                                _activities.calendarEvent.description ?? "",
                                style: const TextStyle(fontSize: 16))),
                      ]))
                ]))));
  }
}

class Title extends StatelessWidget {
  final String titleText;
  const Title({Key? key, required this.titleText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: const EdgeInsets.only(top: 20, left: 40),
      child: Text(titleText,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 36)),
    );
  }
}
