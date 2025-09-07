import 'package:flutter/material.dart';
import 'package:goals_app/cubit/cubit.dart';


class GoalWidget extends StatelessWidget {
  const  GoalWidget({super.key , required  this.goalName , required  this.id ,required BuildContext context});

  final String goalName;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cubit = GoalCubit.get(context);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.indigo[50],
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red[50],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red[600],
                                ),
                                child: const Icon(
                                  Icons.mode_edit_outline_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Manage Goal',
                                    style: TextStyle(
                                      color: Colors.red[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    'What would you like to do ?',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[50],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.indigo,
                                ),
                                child:  Text(
                                  '# $id',
                                  style:const  TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                               Text(
                                goalName,
                                style:const  TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              )
                            ],
                          ),
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
                                    padding:const  EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ) ,
                            const SizedBox(width: 10,),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  cubit.deleteData(id) ;
                                  Navigator.pop(context) ;
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red[600],
                                    padding:const  EdgeInsets.symmetric(vertical: 15 , horizontal: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child:const Center(
                                  child:   Row(
                                    children: [
                                       Icon(Icons.delete_outline_sharp ,color: Colors.white,) ,
                                      SizedBox(width: 5,),
                                      Text(
                                        'Remove',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ) ,
                          ],
                        )
                      ],
                    ),
                  ),
                ));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Colors.indigo[400]!, Colors.indigo[700]!])),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.indigo[300]),
                child: const Icon(
                  Icons.flag,
                  size: 27,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                   goalName,
                  style:const  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Goal $id',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[400]!,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo[400]),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
