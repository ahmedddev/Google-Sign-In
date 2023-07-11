import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'auth_controller.dart';

class GeneralController extends GetxController {
  GetStorage boxStorage = GetStorage();
  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();

}
