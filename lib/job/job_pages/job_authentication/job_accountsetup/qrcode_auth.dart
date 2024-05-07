import 'package:job_seeker/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../providers/userprovider.dart';

void main() => runApp(MaterialApp(home: QRViewExample()));

class QRViewExample extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  IO.Socket? socket;

  @override
  void initState() {
    super.initState();
    connectToServer();
  }

  void connectToServer() {
    socket = IO.io(Constants.uri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket!.onConnect((_) => print('Connected to Socket.IO server'));
    socket!.onDisconnect((_) => print('disconnected from Socket.IO server'));

    socket!.onConnectError((data) => print('Connect error: $data'));
    socket!.onError((data) => print('Error: $data'));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      var user = Provider.of<UserProvider>(context, listen: false).user;
      var session_id = scanData.code; // Extract session ID from the QR code
      var token = user.token;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? refreshToken = prefs.getString('refresh');
      print(refreshToken);
      // Emit 'validate_qr' event with session_id and user_id
      socket?.emit('validate_qr', {
        'session_id': session_id,
        'user_id': token,
        'refresh_token': refreshToken
      });
      //socket?.disconnect();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    socket?.disconnect();
    super.dispose();
  }
}
