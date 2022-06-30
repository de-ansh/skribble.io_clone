import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skrible/screens/print_screens.dart';
import 'package:skrible/widget/CustomTextField.dart';

class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({Key? key}) : super(key: key);

  @override
  State<CreateRoomPage> createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomnameController = TextEditingController();
  late String? _MaxRoundsvalue;
  late String? _MaxRoomSizevalue;
  void createRoom() {
    if (_nameController.text.isNotEmpty &&
        _roomnameController.text.isNotEmpty &&
        _MaxRoundsvalue != null &&
        _MaxRoomSizevalue != null) {
      Map data = {
        "nickname": _nameController.text,
        "name": _roomnameController.text,
        "occupancy": _MaxRoundsvalue,
        "maxRounds": _MaxRoomSizevalue
      };
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PaintScreen(data: data, screenFrom: 'createRoom')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Create Room",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFiled(
              hintText: 'Enter Your Name',
              controller: _nameController,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFiled(
              hintText: 'Enter the Room Name',
              controller: _roomnameController,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButton(
            focusColor: Color(0xffF5F6FA),
            items: <String>["2", "4", "5", "6", "8", "10", "15"]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ))
                .toList(),
            hint: const Text(
              'Select Max rounds',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _MaxRoundsvalue = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButton(
            focusColor: Color(0xffF5F6FA),
            items: <String>["2", "4", "5", "6", "7", "8"]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ))
                .toList(),
            hint: const Text(
              'Select Max RoomSize',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _MaxRoomSizevalue = value;
              });
            },
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: createRoom,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white, fontSize: 16)),
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 2.5, 50)),
            ),
            child: const Text(
              "Create",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
