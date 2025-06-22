
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/models/color_model.dart';

class YellowButtonWidget extends ConsumerWidget{

   final String buttonText;
   final VoidCallback callback;
   final AppColors colors;
 
  const YellowButtonWidget({super.key, required this.buttonText, required this.callback, required this.colors }); 

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ElevatedButton(onPressed: callback, style: ElevatedButton.styleFrom(backgroundColor: colors.button, foregroundColor: colors.text), child: Text(buttonText),);

  }



  
}