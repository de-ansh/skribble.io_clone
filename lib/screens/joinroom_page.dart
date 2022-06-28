import 'package:flutter/material.dart';
import 'package:skrible/widget/CustomTextField.dart';

class JoinRoomPage extends StatefulWidget {
  const JoinRoomPage({Key? key}) : super(key: key);

  @override
  State<JoinRoomPage> createState() => _JoinRoomPageState();
}

class _JoinRoomPageState extends State<JoinRoomPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Join Room",
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
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
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
