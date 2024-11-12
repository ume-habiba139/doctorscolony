import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Doctor model
class Doctor {
  final int? id;
  final String name;
  final String specialty;
  final String imageUrl;

  Doctor({this.id, required this.name, required this.specialty, required this.imageUrl});

  // Convert Doctor object to map for insertion in the database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'specialty': specialty,
      'imageUrl': imageUrl,
    };
  }
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'doctors.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create table for storing doctor data
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE doctors (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        specialty TEXT,
        imageUrl TEXT
      )
    ''');
  }

  // Insert a new doctor into the database
  Future<int> insertDoctor(Doctor doctor) async {
    final db = await database;
    return await db.insert('doctors', doctor.toMap());
  }

  // Get all doctors from the database
  Future<List<Doctor>> getDoctors() async {
    final db = await database;
    var result = await db.query('doctors');
    return result.map((map) => Doctor(
      id: map['id'] as int,
      name: map['name'] as String,
      specialty: map['specialty'] as String,
      imageUrl: map['imageUrl'] as String,
    )).toList();
  }
}
void addSampleDoctors() async {
  final dbHelper = DatabaseHelper();

  await dbHelper.insertDoctor(
    Doctor(
      name: 'Dr. Jahanzaib',
      specialty: 'Therapist',
      imageUrl: 'images/Dr1.jpg',
    ),
  );

  await dbHelper.insertDoctor(
    Doctor(
      name: 'Dr. John Doe',
      specialty: 'Cardiologist',
      imageUrl: 'images/doctor2.png',
    ),
  );

  await dbHelper.insertDoctor(
    Doctor(
      name: 'Dr. Sarah Smith',
      specialty: 'Dermatologist',
      imageUrl: 'images/doctor3.png',
    ),
  );
}

