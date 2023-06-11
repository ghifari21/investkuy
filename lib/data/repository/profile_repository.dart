import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:investkuy/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  late final Dio _dio;

  // Constructor
  ProfileRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://18.140.79.85",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    // Log Interceptor
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<UserModel> getUser() async {
    try {
      final id = await getId();
      final response = await _dio.get('/user/profile/$id');
      final data = UserModel.fromJson(response.data['data']);
      return data;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.message.toString());
      rethrow;
    }
  }

  Future<UserModel> updateAccount(String name, String email, String telp, String alamat) async {
    try {
      final id = await getId();
      final response = await _dio.put('');
      final data = UserModel.fromJson(response.data['data']);
      return data;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.message.toString());
      rethrow;
    }
  }
  
  Future<bool> changePassword(String oldPass, String newPass, String confNewPass, String pin) async {
    try {
      final id = await getId();
      await _dio.put("/user/profile/ubah-password/$id", data: {
        "oldPass": oldPass,
        "newPass": newPass,
        "confirmNewPass": confNewPass,
        "pin": pin
      });
      
      return true;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      log(e.message.toString());
      rethrow;
    }
  }

  Future<String> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userToken = prefs.getString('token') ?? "";
      return userToken;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getRole() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userRole = prefs.getString('role') ?? "Visitor";
      return userRole;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getUsername() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString('username') ?? "";
      return username;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getInt('id') ?? 1;
      return id;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('role');
      await prefs.remove('username');
      await prefs.remove('id');
      return true;
    } catch (e) {
      rethrow;
    }
  }
}