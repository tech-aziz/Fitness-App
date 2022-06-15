import 'package:fitness_app/model/model.dart';
import 'package:fitness_app/start_exercise.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseDetails extends StatefulWidget {
  ExerciseDetails({Key? key, this.exercisesModel}) : super(key: key);
  ExercisesModel? exercisesModel;

  @override
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  double second = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'EXERCISE DETAILS',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "${widget.exercisesModel!.thumbnail}",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 5,
                    right: 0,
                    left: 0,
                    child: Column(
                      children: [
                        SleekCircularSlider(
                          innerWidget: (value) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                "${second.toStringAsFixed(0)} s",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.pinkAccent,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w800),
                              ),
                            );
                          },
                          appearance: CircularSliderAppearance(
                              customWidths: CustomSliderWidths(
                                progressBarWidth: 8,
                              ),
                              size: 130.0),
                          min: 5,
                          max: 100,
                          initialValue: second,
                          onChange: (value) {
                            setState(() {
                              second = value;
                            });
                          },
                        ),
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.pinkAccent,
                          child: Text('Go!'),
                        )
                      ],
                    ))
              ],
            ),

            SizedBox(height: 3,),
            SingleChildScrollView(

              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Icon(Icons.accessibility_new_sharp),
                          title: Text('JUMPING JACKS', style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                          subtitle: Text('00:20',style: TextStyle(
                              fontSize: 20, color: Colors.black12),),
                          trailing: Icon(Icons.forward_outlined),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Icon(Icons.accessibility_new_sharp),
                          title: Text('HELP TOUCH', style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                          subtitle: Text('x20',style: TextStyle(
                              fontSize: 20, color: Colors.black12),),
                          trailing: Icon(Icons.forward_outlined),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),

                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Icon(Icons.accessibility_new_sharp),
                          title: Text('RUSSIAN TWIST', style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                          subtitle: Text('x20',style: TextStyle(
                              fontSize: 20, color: Colors.black12),),
                          trailing: Icon(Icons.forward_outlined),
                        ),
                      ),
                    ),
                  ),

                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> StartExercise()));
                      },style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                      child: Text('START')),
                  CircularProgressIndicator(
                    backgroundColor: Colors.redAccent,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                    strokeWidth: 4,
                  ),

                  LinearProgressIndicator(
                    backgroundColor: Colors.redAccent,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                    minHeight: 5,
                  ),
                ],

              ),
            )
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           height: 100,
            //           width: double.infinity,
            //           color: Colors.redAccent,
            //           child: Row(
            //             children: [
            //               ListTile(
            //                 leading: Icon(
            //                   Icons.accessibility_new_sharp,
            //                   color: Colors.green,
            //                 ),
            //                 trailing: Text(
            //                   'JUMPING JACKS',
            //                   style: TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.bold,
            //                       color: Colors.black),
            //                 ),
            //                 subtitle: Text(
            //                   '00:20',
            //                   style: TextStyle(
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.bold,
            //                       color: Colors.black38),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           height: 100,
            //           width: double.infinity,
            //           color: Colors.green,
            //         ),
            //       ),
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           height: 100,
            //           width: double.infinity,
            //           color: Colors.blueGrey,
            //         ),
            //       ),
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           height: 100,
            //           width: double.infinity,
            //           color: Colors.blue,
            //         ),
            //       ),
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           height: 100,
            //           width: double.infinity,
            //           color: Colors.amber,
            //         ),
            //       ),
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           height: 100,
            //           width: double.infinity,
            //           color: Colors.black38,
            //         ),
            //       ),
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           height: 100,
            //           width: double.infinity,
            //           color: Colors.orange,
            //         ),
            //       ),
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Container(
            //           height: 100,
            //           width: double.infinity,
            //           color: Colors.lightGreen,
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
