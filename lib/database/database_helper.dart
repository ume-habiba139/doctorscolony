
// Database Helper
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  // Private constructor
  DatabaseHelper._();

  // Factory constructor to return the same instance
  factory DatabaseHelper() => _instance;

  // Get the database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('User.db');
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDB(String filePath) async {
    String path = join(await getDatabasesPath(), filePath);
    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        // Create User table
        await db.execute(''' 
          CREATE TABLE User (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT DEFAULT NULL,
            lastName TEXT DEFAULT NULL,
            email TEXT UNIQUE,
            phoneNo TEXT DEFAULT NULL,
            age TEXT DEFAULT NULL,
            password TEXT DEFAULT NULL,
            confirmPassword TEXT DEFAULT NULL
          )
        ''');

        // Create doctors table
        await db.execute(''' 
          CREATE TABLE doctors (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fullname TEXT DEFAULT NULL,
            specialty TEXT DEFAULT NULL,
            imagePath TEXT
          )
        ''');
      },
    );
  }

  // Fetch all doctors
  Future<List<Map<String, dynamic>>> getDoctors() async {
    final db = await database;
    return await db.query('doctors');
  }

  Future<List<AddDoctors>> getVisaInfoList() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('doctors');

    return List.generate(maps.length, (i) {
      return AddDoctors(
        fullName: maps[i]['fullname'],
        specialty : maps[i]['specialty'],
        imagePath: maps[i]['imagePath'],
      );
    });
  }
  // Insert a new doctor
  Future<void> insertDoctorInfo(AddDoctors addDoctor) async {
    final db = await database;
    await db.insert(
      'doctors',
      addDoctor.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Register a new user
  Future<int> registerUser(
      String firstName,
      String lastName,
      String email,
      String phoneNo,
      String password,
      String confirmedPassword,
      int age) async {
    final db = await database;
    return await db.insert('User', {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNo': phoneNo,
      'email': email,
      'age': age.toString(),
      'password': password,
      'confirmPassword': confirmedPassword,
    });
  }

  // Login user
  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'User',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty ? result.first : null;
  }
}

// Model class for doctor information
class AddDoctors {
  final String fullName;
  final String specialty;
  final String? imagePath;

  AddDoctors({
    required this.fullName,
    required this.specialty,
    required this.imagePath,
  });

  // Convert to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'fullname': fullName,
      'specialty': specialty,
      'imagePath': imagePath,
    };
  }
}