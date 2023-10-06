import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'DatabaseHelper.dart';
import 'QRData.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  late String qrCodeResult ;
  late  DateTime now ;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Message displayed over here
       
        Expanded(
          flex: 5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
        ),

            ElevatedButton(
              onPressed: () async {
                now = DateTime.now();
final db=DatabaseHelper();
                // Save QR data to the database
                await db.insertQRData(qrCodeResult!, now as String);
              },
              child: const Text('Save QR Code Data'),
            ),
    ]
            )
    )
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      qrCodeResult=scanData as String;
       });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}