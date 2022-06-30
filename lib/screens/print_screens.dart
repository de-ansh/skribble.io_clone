import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PaintScreen extends StatefulWidget {
  final Map data;
  final String screenFrom;
  const PaintScreen({Key? key, required this.data, required this.screenFrom})
      : super(key: key);

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  late IO.Socket _socket;

  @override
  void initState() {
    super.initState();
    connect();
  }

  //socket.io
  void connect() {
    _socket = IO.io('http://192.168.1.102:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false
    });
    _socket.connect();
    if (widget.screenFrom == 'createRoom') {
      _socket.emit('craete_game', widget.data);
    }

    _socket.onConnect((data) {
      print(widget.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
