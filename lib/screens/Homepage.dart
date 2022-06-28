import 'package:flutter/material.dart';
import 'package:skrible/screens/create_room_page.dart';
import 'package:skrible/screens/joinroom_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skribbl Clone"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Create/join  a room to play ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateRoomPage(),
                        ),
                      ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(color: Colors.white, fontSize: 16)),
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width / 2.5, 50)),
                  ),
                  child: const Text(
                    "Create",
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const JoinRoomPage(),
                        ),
                      ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.white, fontSize: 16)),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width / 2.5, 50)),
                ),
                child: const Text(
                  "Join",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
