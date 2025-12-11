import 'package:hive/hive.dart';
import 'package:taskati/core/Model/task%20model.dart';

class Local_Helper {
  static late Box _userBox;
  static late Box<Task_Model> _taskBox;

 static Box<Task_Model>get taskBox=>_taskBox;
   static Box get userBox => _userBox;

  static String KeyUSer='user';
  static String KeyTask='task';
  static String KeyName='name';
  static String KeyImage='image';
  static String KeyisUpload='isUpload';
  static String KeyisDark='isDark';



  static inait() async {
    Hive.registerAdapter<Task_Model>(TaskModelAdapter());
    await Hive.openBox(KeyUSer);
    await Hive.openBox<Task_Model>(KeyTask);
    _userBox = Hive.box(KeyUSer);
    _taskBox = Hive.box<Task_Model>(KeyTask);
  }

  static cachUserData(String Key ,dynamic Value){
    _userBox.put(Key, Value);


  }
  static getUserData(String key){
    return _userBox.get(key);
  }
  static cachTaskData(String Key ,Task_Model Value){
    _taskBox.put(Key, Value);


  }
  static getTaskData(String key){
    return _taskBox.get(key);
  }

}
