/*
import 'package:flutter/material.dart';

void main(){
    runApp(aishik_digital_app());
}

class aishik_digital_app extends StatefulWidget{
    @override
    _MyAppState createState()=> _MyAppState();
}

class _MyAppState extends State<aishik_digital_app>{
    String pythonResult='Press button to run Python!';

    @override
    void initState(){
        super.initState();
        _initailizePython();
    }

    @override
    Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                'Hello, Flutter! Your message here.',
                style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
                SizedBox(height: 30),
                Text(
                pythonResult,
                style: TextStyle(fontSize: 16, color: Colors.green),
                textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
            ElevatedButton(
            onPressed: _runPythonCommand,
            child: Text('Run Python Command'),
            ),
          ],
        ),
      ),
    ),
  );
}

void _initailizePython(){
    print('Health data initialized successfully');
}
void _runPythonCommand(){
    List<int> heartRates = [72, 85, 90, 78, 92];
    double averageHr = heartRates.reduce((a, b) => a + b) / heartRates.length;
    int steps = 8542;
    double calories = steps * 0.04;
    
    setState((){
        pythonResult='Average Heart Rate: ${averageHr.toStringAsFixed(1)} bpm\nDaily Steps: $steps\nCalories Burned: ${calories.toStringAsFixed(0)}';
        });
    }
}
*/
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String pythonResult = 'Ready for health data!';
  List<Map<String, dynamic>> healthData = [];
  Database? database;

  @override
  void initState() {
    super.initState();
    _initializePython();
    _initDatabase();
  }

  void _initializePython() {
    print('✅ Python + Database Ready!');
  }

  Future<void> _initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'health_data.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE health(id INTEGER PRIMARY KEY, heart_rate INTEGER, steps INTEGER, timestamp TEXT)',
        );
      },
      version: 1,
    );
    _loadHealthData();
  }

  Future<void> _loadHealthData() async {
    final List<Map<String, dynamic>> data = await database!.query('health');
    setState(() {
      healthData = data;
    });
  }

  Future<void> _addHealthData(int hr, int steps) async {
    await database!.insert(
      'health',
      {'heart_rate': hr, 'steps': steps, 'timestamp': DateTime.now().toString()},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _loadHealthData();
  }

void _runPythonAnalysis() {
  if (healthData.isEmpty) {
    setState(() {
      pythonResult = '📭 No data yet!';
    });
    return;
  }
  
  List<int> heartRates = healthData.map((e) => e['heart_rate'] as int).toList();
  double avgHr = heartRates.reduce((a, b) => a + b) / heartRates.length;
  
  setState(() {
    pythonResult = '📊 Average HR: ${avgHr.toStringAsFixed(1)} bpm\n📈 Records analyzed: ${healthData.length}';
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health App + Python + DB'),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Your original message
              Text(
                'Hello, Flutter! Your message here.',
                style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // Add sample health data
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _addHealthData(85, 7500),
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text('Add HR:85, Steps:7500'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _addHealthData(92, 9200),
                      icon: Icon(Icons.fitness_center),
                      label: Text('Add Workout'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Python analysis button
              ElevatedButton.icon(
                onPressed: _runPythonAnalysis,
                icon: Icon(Icons.analytics),
                label: Text('🔬 Analyze with Python'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                ),
                child: Text(pythonResult, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 20),

              // Database records
              Text('📋 Health Records (${healthData.length}):', 
                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: healthData.length,
                  itemBuilder: (context, index) {
                    final data = healthData[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${data['heart_rate']}')),
                        title: Text('HR: ${data['heart_rate']} bpm'),
                        subtitle: Text('Steps: ${data['steps']}'),
                        trailing: Text(data['timestamp'].toString().split(' ')[0]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
