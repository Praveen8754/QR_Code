

import 'package:flutter/material.dart';
import 'package:untitled11/History.dart';

import 'ScanQR.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // You can change the number of columns here
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            DashboardButton(
              label: 'Button 1',
              icon: Icons.home,
              onTap: () {
                // Handle button 1 tap
              },
            ),
            DashboardButton(
              label: 'Button 2',
              icon: Icons.settings,
              onTap: () {
                // Handle button 2 tap
              },
            ),
            DashboardButton(
              label: 'Button 3',
              icon: Icons.mail,
              onTap: () {
                // Handle button 3 tap
              },
            ),
            DashboardButton(
              label: 'Scan History',
              icon: Icons.history,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const History()));
              },
            ),
            DashboardButton(
              label: 'Export',
              icon: Icons.import_export,
              onTap: () {

              },
            ),
            DashboardButton(
              label: 'Scan',
              icon: Icons.qr_code_scanner_rounded,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ScanQR()));
              },
            ),


          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;

  DashboardButton({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.blue,
            ),
            SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
