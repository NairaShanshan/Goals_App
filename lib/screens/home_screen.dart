import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals_app/cubit/cubit.dart';
import 'package:goals_app/cubit/states.dart';

import 'package:goals_app/widgets/goal_list.dart';
import 'package:goals_app/widgets/no_goal_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoalCubit()..initialSql()..getData(),
      child:BlocConsumer<GoalCubit, GoalStates>(
          listener: (context , state) {
            if(state is InsertDataSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("✅ Task added successfully"))) ;
            }
          } ,
          builder: (context , state) {
            return  Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: 90,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                          colors: [Colors.indigo[700]!, Colors.indigo[900]!])),
                ),
                title: const Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Goals',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Track Your Progress',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                              colors: [Colors.indigo[200]!, Colors.indigo[50]!]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.indigo[600],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.track_changes,
                                size: 27,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  '${GoalCubit.get(context).goalsList.length} Goals',
                                  style:const  TextStyle(
                                      fontSize: 25,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Keep Pushing Forward !',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      GoalCubit.get(context).goalsList.isEmpty
                          ? const SizedBox(
                        height: 40,
                      )
                          : const SizedBox(
                        height: 30,
                      ),
                      GoalCubit.get(context).goalsList.isEmpty
                          ?const  NoGoalWidget()
                          : SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: GoalList()),
                    ],
                  ),
                ),
              ),
              floatingActionButton: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: FloatingActionButton.extended(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 0,
                  backgroundColor: Colors.indigo[700],
                  label: const Text(
                    'Add Goal',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    final cubit = GoalCubit.get(context);
                    showDialog(
                        context: context,
                        barrierDismissible: false ,
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.indigo[50],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.indigo[50]),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            color: Colors.indigo[800],
                                            borderRadius:
                                            BorderRadius.circular(14)),
                                        child: const Icon(
                                          Icons.add_task,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Add New Goal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo[800],
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: cubit.addTextController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.edit,
                                        color: Colors.grey[400],
                                      ),
                                      hintText: 'What do you want to achieve ?',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.w500),
                                      filled: true,
                                      fillColor: Colors.grey[50],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context) ;
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey[50],
                                              padding:const  EdgeInsets.symmetric(vertical: 15) ,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10) ,
                                              )
                                          ),
                                          child:  Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17
                                            ),
                                          )),
                                    ) ,
                                    const SizedBox(width: 10,) ,
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if( cubit.addTextController.text.trim().isNotEmpty){
                                              cubit.insertData(cubit.addTextController.text.toString()) ;
                                              cubit.getData();
                                              Navigator.pop(context) ;
                                              cubit.addTextController.clear();

                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.indigo[500],
                                              padding:const  EdgeInsets.symmetric(vertical: 15) ,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10) ,
                                              )
                                          ),
                                          child:const   Text(
                                            '+  Add Goal',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17
                                            ),
                                          )),
                                    ) ,


                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ) ;
          },
          ),
    );
  }
}
