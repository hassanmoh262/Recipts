import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:flutter/material.dart';


class StepCounterScreen extends StatefulWidget {
  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  String _stepCount = '0';

  StreamSubscription<int>? _subscription;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  @override
  void dispose() {
    super.dispose();
    _stopListening();
  }

  void _startListening() {
    _subscription = Pedometer.stepCountStream
        .cast<int>()
        .listen((stepCount) {
      setState(() {
        _stepCount = stepCount.toString();
      });
    });
  }

  void _stopListening() {
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Step Count:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              _stepCount,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _stopListening();
          _startListening();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}