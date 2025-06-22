import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeNotifier extends AsyncNotifier<bool>{
 
 static const _key = 'isDarkMode';

  @override
  Future<bool> build() async {
    
    final prefs= await SharedPreferences.getInstance();
     return prefs.getBool(_key) ?? false;
  }

  Future<void> toggle() async{
    final prefs= await SharedPreferences.getInstance();
    final current= state.value ?? false;
    final next= !current;
    state= AsyncValue.data(next);
    await prefs.setBool(_key, next);
  }

}