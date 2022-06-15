import 'package:flutter/material.dart';
class StartExercise extends StatefulWidget {
  const StartExercise({Key? key}) : super(key: key);

  @override
  State<StartExercise> createState() => _StartExerciseState();
}

class _StartExerciseState extends State<StartExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 8,),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
