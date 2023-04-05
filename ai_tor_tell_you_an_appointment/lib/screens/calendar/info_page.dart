import 'package:ai_tor_tell_you_an_appointment/backend/LangManager.dart';
import 'package:flutter/material.dart';
import 'add_page.dart';
import 'edit_page.dart';
const List<String> dateOfWeek = <String>['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
const List<String> months = <String>['January','February','March','April','May','June','July','August','September','October','November','December'];

class InfoPage extends StatefulWidget {
  final String title, description, location;
  final TimeOfDay timeOfDayStarts, timeOfDayEnds;
  final DateTime dateTimeOfStart, dateTimeOfEnd;
  const InfoPage(
      {Key? key, required this.timeOfDayStarts, required this.timeOfDayEnds, required this.dateTimeOfStart, required this.dateTimeOfEnd, required this.title, required this.description, required this.location,
      })
      : super(key: key);
  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  late DateTime _dateTimeOfStart;
  late DateTime _dateTimeOfEnd;
  late TimeOfDay timeOfStart;
  late TimeOfDay timeOfEnd;
  late TextEditingController _controller;

  @override
  void initState() {
    _dateTimeOfStart = widget.dateTimeOfStart;
    _dateTimeOfEnd = widget.dateTimeOfEnd;
    timeOfStart = widget.timeOfDayStarts;
    timeOfEnd = widget.timeOfDayEnds;
    _controller = TextEditingController(text: widget.title);
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
                          Navigator.of(context).pop();},
                        icon: Icon(Icons.close,
                            color: Theme.of(context).colorScheme.primary)))
              ],
            )),
        Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeArea(
                        child: EditPage(
                            title: widget.title,
                            timeOfDayStarts: widget.timeOfDayStarts,
                            timeOfDayEnds: widget.timeOfDayEnds,
                            dateTimeOfStart: widget.dateTimeOfStart,
                            dateTimeOfEnd: widget.dateTimeOfEnd,
                            description: widget.description,
                            location: widget.location))));
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
                    child: Column(
                        children: [
                          ListTile(leading: Icon(Icons.arrow_right, color: Theme.of(context).colorScheme.primary,), title: Text('$dateOfStart/$monthOfStart/2023 \nเวลา $hoursOfStart:$minutesOfStart - \n$dateOfEnd/$monthOfEnd/2023 \nเวลา $hoursOfEnd:$minutesOfEnd', style: const TextStyle(fontSize: 16),)),
                          ListTile(leading: Icon(Icons.notifications, color: Theme.of(context).colorScheme.primary), title: const Text('30 นาทีก่อนกิจกรรม', style: TextStyle(fontSize: 18)),),
                          ListTile(leading: Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary), title: Text(widget.location, style: const TextStyle(fontSize: 16))),
                          ListTile(leading: Icon(Icons.list, color: Theme.of(context).colorScheme.primary), title: Text(widget.description, style: const TextStyle(fontSize: 16))),
                        ]))]))));
  }
}