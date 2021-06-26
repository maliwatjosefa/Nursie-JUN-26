import 'package:se_final/dashboard/medReminder/reminder.dart';
import 'package:flutter/material.dart';
import 'package:se_final/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AddAlarm extends StatefulWidget {
  AddAlarm({Key key}) : super(key: key);

  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  TimeOfDay _selectedTime;
  ValueChanged<TimeOfDay> selectTime;

  @override
  void initState() {
    _selectedTime = new TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/alarm_wp.png'), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
            child: Column(children: <Widget>[
          SizedBox(
            height: 200.0,
          ),
          new GestureDetector(
            child: Container(
              color: Colors.black,
              child: Text(
                _selectedTime.format(context),
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () {
              _selectTime(context);
              scheduleAlarm();
            },
          ),
          SizedBox(
            height: 60.0,
          ),
          AlarmAdd(),
          SizedBox(
            height: 60.0,
          ),
          AlarmAdd1(),
          SizedBox(
            height: 90.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Material(
                color: Color(0xff000000),
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MedReminder()));
                    _showAlertDialog();
                  },
                  child: Text("Save",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                )),
          ),
        ])),
      ),
    ));
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    setState(() {
      _selectedTime = picked;
    });
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Text('Reminder set!'),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: new Text('OK'))
            ],
          );
        });
  }

  void scheduleAlarm() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(minutes: 1, seconds: 10));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'n_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('n_logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Medicine',
        'Please drink your medicine.',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}

class AlarmAdd extends StatefulWidget {
  @override
  _AlarmAddState createState() => _AlarmAddState();
}

class _AlarmAddState extends State<AlarmAdd> {
  TimeOfDay _selectedTime;
  ValueChanged<TimeOfDay> selectTime;

  @override
  void initState() {
    _selectedTime = new TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.black,
        child: Text(
          _selectedTime.format(context),
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        _selectTime(context);
      },
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    setState(() {
      _selectedTime = picked;
    });
  }

  void scheduleAlarm() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(minutes: 2));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'n_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('n_logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Medicine',
        'Please drink your medicine.',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}

class AlarmAdd1 extends StatefulWidget {
  @override
  _AlarmAdd1State createState() => _AlarmAdd1State();
}

class _AlarmAdd1State extends State<AlarmAdd1> {
  TimeOfDay _selectedTime;
  ValueChanged<TimeOfDay> selectTime;

  @override
  void initState() {
    _selectedTime = new TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.black,
        child: Text(
          _selectedTime.format(context),
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        _selectTime(context);
      },
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    setState(() {
      _selectedTime = picked;
    });
  }

  void scheduleAlarm() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(minutes: 2));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'n_logo',
      largeIcon: DrawableResourceAndroidBitmap('n_logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Medicine',
        'Please drink your medicine.',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}
