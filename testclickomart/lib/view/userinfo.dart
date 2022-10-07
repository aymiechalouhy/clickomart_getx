import 'package:flutter/material.dart';

enum PersonGender { female, male }

class UserInfo extends StatefulWidget {
  final String? restorationId;
  const UserInfo({Key? key, this.restorationId}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> with RestorationMixin {
  PersonGender? _personGender = PersonGender.female;

  @override
  String? get restorationId => widget.restorationId;
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 3, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
            primary: Colors.blue,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          )),
          child: DatePickerDialog(
            restorationId: 'date_picker_dialog',
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
            firstDate: DateTime(1950),
            // firstDate: DateTime.now(),
            lastDate: DateTime(2023),
          ),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 10),
            child: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 40),
            child: Container(
              height: 400,
              width: 330,
              color: Colors.white,
              child: Column(
                children: [
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: Row(
                        children: const [
                          Text(
                            "User Information",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(174, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 35),
                    child: Row(
                      children: [
                        Column(
                          children: const [Text("Full Name")],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: const [
                              Text(
                                "Aymie Chalouhy",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 35),
                    child: Row(
                      children: [
                        Column(
                          children: const [Text("Mobile")],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            children: const [
                              Text(
                                "78954042",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 35),
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            Text("Email"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Column(
                            children: const [
                              Text(
                                "Aymie@navyBits.com",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          width: 300,
                          height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                                side: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            onPressed: () {
                              _restorableDatePickerRouteFuture.present();
                            },
                            child: Row(
                              children: [
                                const Text(
                                  '  Birthday',
                                  style: TextStyle(
                                      color: Color.fromARGB(228, 0, 0, 0),
                                      fontWeight: FontWeight.w400),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 48),
                                    child: Text(
                                        // 'MM/DD/YYYYY',
                                        ' ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
                                        style: const TextStyle(
                                            color:Colors.blue,
                                            fontWeight: FontWeight.w400)))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 35),
                                  child: Text("Gender"),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio<PersonGender>(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.blue),
                                    value: PersonGender.female,
                                    groupValue: _personGender,
                                    onChanged: (PersonGender? value) {
                                      setState(() {
                                        _personGender = value;
                                      });
                                    }),
                                const Expanded(
                                    child: Text(
                                  'Female',
                                  style: TextStyle(fontSize: 14),
                                ))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio<PersonGender>(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.blue),
                                    value: PersonGender.male,
                                    groupValue: _personGender,
                                    onChanged: (PersonGender? value) {
                                      setState(() {
                                        _personGender = value;
                                      });
                                    }),
                                const Expanded(
                                    child: Text(
                                  'Male',
                                  style: TextStyle(fontSize: 14),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 30),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 45,
                          width: 140,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: const Color.fromRGBO(91, 189, 146, 1), backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.blue,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Cancel',
                              style: TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            height: 45,
                            width: 140,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor:
                                    const Color.fromARGB(255, 210, 221, 216),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 210, 221, 216),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Save',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Container(
                  height: 55,
                  width: 330,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: TextButton.icon(
                      label: const Text(
                        "Privacy Policy",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.privacy_tip_rounded,
                          color: Colors.blue),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Container(
                  height: 55,
                  width: 330,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 230),
                    child: TextButton.icon(
                      label: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.logout_rounded,
                          color: Colors.blue),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
