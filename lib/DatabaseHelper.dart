import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'QRData.dart';





/*
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'your_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  static Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE qr_data(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        qr_value TEXT,
        time TEXT
      )
    ''');
  }

  static Future<void> insertQRData(String qrData, String time) async {
    final db = await database;
    await db.insert(
      'qr_data',
      {'qr_value': qrData, 'time': time},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getQRCodeHistory() async {
    final db = await database;
    return await db.query('qr_history', orderBy: 'timestamp DESC');
  }
}
*/

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'qr_history.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE qr_history (
            id INTEGER PRIMARY KEY,
            qr_code TEXT,
            timestamp TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertQRData(String qrCode,String now) async {
    final db = await database;
     await db.insert('qr_history', {
      'qr_code': qrCode,
      'timestamp': now,
    });
  }

  Future<List<Map<String, dynamic>>> getQRCodeHistory() async {
    final db = await database;
    return await db.query('qr_history', orderBy: 'timestamp DESC');
  }
}
