import 'package:flutter/material.dart';

class Constants {
  /// 슈파베이스
  static String SUPABASE_URL = 'https://bsqtkmycdqpdfdrdevmu.supabase.co';
  static String SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJzcXRrbXljZHFwZGZkcmRldm11Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY3NDA2NjksImV4cCI6MjA0MjMxNjY2OX0.3hU3cPv3e66m70ViZxWVxHwlcHB_9dXB9rRO0JJfuDI';

  static var size;
  static var tabContext;
  static currentSize(context){
    size = MediaQuery.of(context).size;
    tabContext = context;
  }
}