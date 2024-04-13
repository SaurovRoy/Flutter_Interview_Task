
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart'as http;
class ApiController extends GetxController {
  Future fetchApi()async{
    try{
      final response = await  http.get(Uri.parse('https://getlearn-admin.getbuildfirst.com/api/course/details/1'));
      var data = jsonDecode(response.body);
      if(response.statusCode ==200){
        return data;
      }else {
        return CircularProgressIndicator();
      }
    }
    catch(e){
      print(e.toString());
    }
  }
}