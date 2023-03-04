import 'package:ai_tor_tell_you_an_appointment/backend/LangManager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../bottomNavigation.dart';
import 'package:intl/intl.dart';
import 'info_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  String? _subjectText = '',
      _startTimeText = '',
      _endTimeText = '',
      _dateText = '',
      _timeDetails = '';

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      final Appointment appointmentDetails = details.appointments![0];
      _subjectText = appointmentDetails.subject;
      //TODO: date format support other langs.
      _dateText = DateFormat('MMMM dd, yyyy', LangMan.selectedLang)
          .format(appointmentDetails.startTime)
          .toString();
      _startTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.startTime).toString();
      _endTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.endTime).toString();
      if (appointmentDetails.isAllDay) {
        _timeDetails = 'All day';
      } else {
        _timeDetails = '$_startTimeText - $_endTimeText';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(child: new Text('$_subjectText')),
              content: Container(
                height: 80,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$_dateText',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(''),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(_timeDetails!,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            alignment: Alignment.bottomCenter,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1.0, // Underline thickness
                            ))),
                            child: GestureDetector(
                              child: Text(
                                  LangMan.get().calendar.alertMoreDetail,
                                  style: const TextStyle(color: Colors.grey)),
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        SafeArea(child: InfoPage())));
                              },
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(1))),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(LangMan.get().calendar.alertClose),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    )
                  ],
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: SfCalendar(
          view: CalendarView.month,
          allowedViews: const [
            CalendarView.day,
            CalendarView.week,
            CalendarView.month
          ],
          headerStyle: const CalendarHeaderStyle(textAlign: TextAlign.center),
          headerHeight: 60,
          onTap: calendarTapped,
          showNavigationArrow: true,
          dataSource: _getCalendarDataSource(),
        )),
      ),
      bottomNavigationBar: const BottomNavigation(
        focused: BottomPages.calendar,
      ),
    );
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(hours: 2)),
    subject: 'Meeting',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
