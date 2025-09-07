import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals_app/cubit/states.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GoalCubit extends Cubit<GoalStates> {
  GoalCubit() : super(InitialState());

  static GoalCubit get(context) => BlocProvider.of<GoalCubit>(context);

  var addTextController = TextEditingController() ;

  initialSql() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'goals.db');

    Database database =
        await openDatabase(
            path,
            version: 1,
            onCreate: (database, version) async {
            await database.execute(
                 'CREATE TABLE Goals (id INTEGER PRIMARY KEY, name TEXT)');
    } ) ;

  }


  List<Map> goalsList = [] ;

  getData() async{
       var databasePath = await getDatabasesPath();
       String path = join(databasePath, 'goals.db');
       Database database = await openDatabase(path) ;

      await database.rawQuery('SELECT * FROM Goals').then((value) {
          goalsList =value ;
          emit(GetDataSuccessState()) ;
       }).catchError((error) {
         emit(GetDataFailureState()) ;
         print(error.toString()) ;
       }) ;

       database.close() ;
  }


  insertData(String name) async{
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'goals.db');
    Database database = await openDatabase(path) ;
    
   await database.rawInsert('INSERT INTO Goals(name) VALUES(?)' , [name]).then((value) {
       emit(InsertDataSuccessState()) ;
    }).catchError((error) {
      emit(InsertDataFailureState()) ;
      print(error.toString()) ;
    }) ;
    
  }
  
  deleteData(int id ) async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'goals.db');
    Database database = await openDatabase(path) ;
    
    await database.rawDelete('DELETE FROM Goals WHERE id = ?', [id]).then((value) async{
       await getData() ;
       emit(RemoveDataSuccessState()) ;
    }).catchError((error) {
      emit(RemoveDataFailureState()) ;
    }) ;
  }


}


