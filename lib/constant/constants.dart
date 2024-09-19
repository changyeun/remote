import 'package:flutter/material.dart';

class Constants {
  /// 슈파베이스
  static String SUPABASE_URL = 'https://nbrlysjfienumxdstgsg.supabase.co';
  static String SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5icmx5c2pmaWVudW14ZHN0Z3NnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTkyMDk4MDQsImV4cCI6MjAzNDc4NTgwNH0.WGl3tG8ngls3CVEQVVoi1slnUvvyJNg5CUKyP1te-a4';

  static const defaultBackground = Color.fromRGBO(5, 31, 95, 1.0);
  static const defaultColor = Color.fromRGBO(241, 104, 33, 1.0);
  static const emptyColor = Color.fromRGBO(196, 196, 196, 1.0);

  static var size;
  static var tabContext;
  static currentSize(context){
    size = MediaQuery.of(context).size;
    tabContext = context;
  }
}