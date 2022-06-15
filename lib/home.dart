import 'dart:convert';

import 'package:fitness_app/exercise_details.dart';
import 'package:fitness_app/model/model.dart';
import 'package:fitness_app/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ExercisesModel> allData = [];

  String link =
      'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json';
  bool isLoading = false;
  fetchData() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(Uri.parse(link)); // link hit
      //print('status code is ${response.statusCode}');
      //print('${response.body}');
      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        for (var data in item["exercises"]) {
          ExercisesModel exercisesModel = ExercisesModel(
              id: data["id"],
              title: data["title"],
              thumbnail: data["thumbnail"],
              gif: data["gif"],
              seconds: data["seconds"]);
          setState(() {
            allData.add(exercisesModel);
          });
        }
        print('total length is ${allData.length}');
      } else {
        showToast('Something went wrong');
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Something is wrong $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'HOME WORKOUT',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading == true,
        progressIndicator: spinkit,
        child: Container(
          width: double.infinity,
          child: ListView.builder(
            itemCount: allData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ExerciseDetails(
                            exercisesModel: allData[index],
                          )));
                },
                child: Container(
                  height: 160,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [

                        Image.network(
                          "${allData[index].thumbnail}",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(
                                top: 0, right: 10, bottom: 10, left: 0),
                            child: Text(
                              "${allData[index].title}",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Colors.black12,
                                  Colors.black54,
                                  Colors.black87,
                                  Colors.black
                                ])),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
