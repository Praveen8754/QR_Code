import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled11/DatabaseHelper.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code History'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbHelper.getQRCodeHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No QR code history available.'),
            );
          } else {
            final qrCodeHistory = snapshot.data!;
            return ListView.builder(
              itemCount: qrCodeHistory.length,
              itemBuilder: (context, index) {
                final qrCode = qrCodeHistory[index]['qr_code'];
                final timestamp = qrCodeHistory[index]['timestamp'];
                return ListTile(
                  title: Text(qrCode),
                  subtitle: Text(
                      timestamp),
                );
              },
            );
          }
        },
      ),
    );
  }
}