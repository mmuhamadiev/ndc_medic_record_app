import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/widgets/date_field.dart';
import 'package:provider/provider.dart';
import '../services/notification_service.dart';
import 'action_buttons.dart';
import 'time_field.dart';
import '../models/task_data.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';


class AddListTile extends StatefulWidget {
  @override
  State<AddListTile> createState() => _AddListTileState();
}

class _AddListTileState extends State<AddListTile> {

  final _timePickerTheme = TimePickerThemeData(
    backgroundColor: Colors.blueGrey,
    hourMinuteShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: kOrange, width: 4),
    ),
    dayPeriodBorderSide: const BorderSide(color: kOrange, width: 4),
    dayPeriodColor: Colors.blueGrey.shade600,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: kOrange, width: 4),
    ),
    dayPeriodTextColor: Colors.white,
    dayPeriodShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: kOrange, width: 4),
    ),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
    states.contains(MaterialState.selected) ? kOrange : Colors.blueGrey.shade800),
    hourMinuteTextColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected) ? Colors.white : kOrange),
    dialHandColor: Colors.blueGrey.shade700,
    dialBackgroundColor: Colors.blueGrey.shade800,
    hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    helpTextStyle:
    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
    dialTextColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected) ? kOrange : Colors.white),
    entryModeIconColor: kOrange,
  );

  String? newTaskTitle;

  NotificationService notificationService = NotificationService();

  final int maxTitleLength = 60;
  TextEditingController _textEditingController =
      TextEditingController(text: "");

  int segmentedControlGroupValue = 0;

  DateTime currentDate = DateTime.now();
  DateTime? eventDate;

  TimeOfDay currentTime = TimeOfDay.now();
  TimeOfDay? eventTime;

  void _updateUniqueID(BuildContext context) {
    Provider.of<TaskData>(context, listen: false).updateUniqueID();
  }

  Future<void> onCreate() async {

    var counter = Provider.of<TaskData>(context,listen: false).id;

    if (eventDate == null || eventTime == null || _textEditingController.text == '' || eventTime == TimeOfDay.now()) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error',style: TextStyle(
              fontSize: 20,
              fontFamily: 'Grotesque')),
          content: const Text('Please fill the Text field,Date and Time ',
              style: TextStyle(
                fontFamily: 'Grotesque',
                fontSize: 20.0,
              )),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel',style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Grotesque')),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK',style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Grotesque')),
            ),
          ],
        ),
      );
    } else {
      await notificationService.showNotification(
        counter,
        _textEditingController.text,
        "A new event has been created.",
        jsonEncode({
          "title": _textEditingController.text,
          "eventDate": DateFormat("EEEE, d MMM y").format(eventDate!),
          "eventTime": eventTime!.format(context),
        }),
      );
      await notificationService.scheduleNotification(
        counter,
        _textEditingController.text,
        "Reminder for your scheduled event at ${eventTime!.format(context)}",
        eventDate!,
        eventTime!,
        jsonEncode({
          "title": _textEditingController.text,
          "eventDate": DateFormat("EEEE, d MMM y").format(eventDate!),
          "eventTime": eventTime!.format(context),
        }),
        getDateTimeComponents(),
      );

      if (_textEditingController.text == '') {
        Navigator.pop(context);
      } else {
        if(segmentedControlGroupValue == 0) {
          Provider.of<TaskData>(context, listen: false).addTask('Take ${_textEditingController.text}. \nOnce at ${eventTime!.format(context)}', counter);
          Navigator.pop(context);
        }
        else if(segmentedControlGroupValue == 1) {
          Provider.of<TaskData>(context, listen: false).addTask(
              'Take ${_textEditingController.text}. \nDaily at ${eventTime!.format(context)}', counter);
          Navigator.pop(context);
        }
      }
      _updateUniqueID(context);
      resetForm();
      setState(() {});
    }
  }

  Future<void> cancelAllNotifications() async {
    await notificationService.cancelAllNotifications();
  }

  Future<void> cancelNotifications(int id) async {
    await notificationService.cancelNotification(id);
  }

  void resetForm() {
    segmentedControlGroupValue = 0;
    eventDate = null;
    eventTime = null;
    _textEditingController.text = '';
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kStaticMainColor,
          title: Text("Event Reminder",style: TextStyle(
              fontSize: 25,
              fontFamily: 'Grotesque')),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
            color: Color.fromRGBO(235, 235, 235, 100),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create an event",
                          style: TextStyle(
                            fontFamily: 'Grotesque',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _textEditingController,
                    maxLength: maxTitleLength,
                    decoration: InputDecoration(
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlue),
                        borderRadius: BorderRadius.all(Radius.circular(25),),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlue),
                        borderRadius: BorderRadius.all(Radius.circular(25),),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlue),
                        borderRadius: BorderRadius.all(Radius.circular(25),
                        ),
                      ),
                      suffix: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.grey[200],
                        ),
                        child: Text((maxTitleLength -
                                _textEditingController.text.length)
                            .toString(),
                            style: TextStyle(
                              fontFamily: 'Grotesque',
                              fontSize: 18.0,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CupertinoSlidingSegmentedControl<int>(
                    onValueChanged: (value) {
                      if (value == 1) eventDate = null;
                      setState(() => segmentedControlGroupValue = value!);
                    },
                    backgroundColor: kDarkBlue,
                    thumbColor: kOrange,
                    groupValue: segmentedControlGroupValue,
                    padding: const EdgeInsets.all(4.0),
                    children: <int, Widget>{
                      0: Text("One time",
                          style: TextStyle(
                            color: kWhite,
                            fontFamily: 'Grotesque',
                            fontSize: 18.0,
                          )),
                      1: Text("Daily",
                          style: TextStyle(
                            color: kWhite,
                            fontFamily: 'Grotesque',
                            fontSize: 18.0,
                          )),
                    },
                  ),
                  SizedBox(height: 24.0),
                  Text("Date & Time",
                      style: TextStyle(
                        fontFamily: 'Grotesque',
                        fontSize: 18.0,
                      )),
                  SizedBox(height: 12.0),
                  GestureDetector(
                    onTap: selectEventDate,
                    child: DateField(eventDate: eventDate),
                  ),
                  SizedBox(height: 12.0),
                  GestureDetector(
                    onTap: () async {
                      eventTime = await showTimePicker(
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              // This uses the _timePickerTheme defined above
                              timePickerTheme: _timePickerTheme,
                              textButtonTheme: TextButtonThemeData(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith((states) => kOrange),
                                  foregroundColor: MaterialStateColor.resolveWith((states) => kWhite),
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                        context: context,
                        initialTime: TimeOfDay(
                          hour: currentTime.hour,
                          minute: currentTime.minute + 1,
                        ),
                      );
                      setState(() {});
                    },
                    child: TimeField(eventTime: eventTime),
                  ),
                  SizedBox(height: 20.0),
                  ActionButtons(
                    onCreate: onCreate,
                    onCancel: resetForm,
                  ),
                  SizedBox(height: 12.0),
                  GestureDetector(
                    onTap: () async {
                      await cancelAllNotifications();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("All notifications cancelled",
                              style: TextStyle(
                                fontFamily: 'Grotesque',
                                fontSize: 18.0,
                              )),
                        ),
                      );
                    },
                    child: _buildCancelAllButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCancelAllButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: kStaticMainColor,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cancel all the reminders",
            style: TextStyle(
              fontFamily: 'Grotesque',
              fontSize: 18.0,
              color: kWhite,
            ),
          ),
        ],
      ),
    );
  }

  DateTimeComponents? getDateTimeComponents() {
    if (segmentedControlGroupValue == 1) {
      return DateTimeComponents.time;
    } else if (segmentedControlGroupValue == 2) {
      return DateTimeComponents.dayOfWeekAndTime;
    }
    return null;
  }

  void selectEventDate() async {
    final today =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    if (segmentedControlGroupValue == 0) {
      eventDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              // This uses the _timePickerTheme defined above
            colorScheme: ColorScheme.light(
              primary: kDarkBlue, // header background color
              onPrimary: kBlack, // header text color
              onSurface: kStaticMainColor,
            ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => kOrange),
                  foregroundColor: MaterialStateColor.resolveWith((states) => kWhite),
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: today,
        firstDate: today,
        lastDate: new DateTime(currentDate.year + 10),
      );
      setState(() {});
    } else if (segmentedControlGroupValue == 1) {
      eventDate = today;
    }
  }
}