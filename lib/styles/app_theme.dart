import 'package:flutter/material.dart';
import 'package:workspace/styles/colormanager.dart';

class AppTheme{
  static ThemeData lightTheme= ThemeData(
    scaffoldBackgroundColor: Colors.white,
    dividerColor: ColorManager.outlinrcolor,
    bottomSheetTheme: BottomSheetThemeData(
     backgroundColor: Colors.transparent,
    ),
    datePickerTheme: DatePickerThemeData(
     dayBackgroundColor: WidgetStateProperty.resolveWith((states){
       if(states.contains(WidgetState.selected)){
         return ColorManager.primarycolor;
       }
       return Colors.white;
     })
    ),
  );
}