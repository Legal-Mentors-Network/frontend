import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

bool isEmpty(String? string) => ['', null].contains(string);

bool isEmptyWithArray(List<String?> strings) {
  bool empty = true;

  for (final string in strings) {
    if (empty) empty = ['', null].contains(string);
  }

  return empty;
}

// for pocketbase queries
Future<String?> guard(Function() callback, {String? message}) async {
  try {
    await callback();
    return null;
  } on ClientException catch (err) {
    debugPrint("err $err");
    if (err.statusCode == 400) {
      return "Invalid login credentials";
    } else {
      return "Service error. Please try again later";
    }
  }
}

// for pocketbase queries
typedef T = Map<String, dynamic>?;

Future<String?> signUpGuard(Function() callback, {String? message}) async {
  try {
    await callback();
    return null;
  } on ClientException catch (err) {
    final emailError = ((err.response['data'] as T)?['email'] as T)?['message'] as String?;
    final passwordError = ((err.response['data'] as T)?['password'] as T)?['message'] as String?;
    return emailError ?? passwordError ?? message;
  }
}
