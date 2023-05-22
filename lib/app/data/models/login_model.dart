// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class LoginModel {
  final int id;
  final String name;
  final String email;
  final String token;

  LoginModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  LoginModel copyWith({
    int? id,
    String? name,
    String? email,
    String? token,
  }) {
    return LoginModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'token': token});

    return result;
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      id: map['user']['id']?.toInt() ?? 0,
      name: map['user']['name'] ?? '',
      email: map['user']['email'] ?? '',
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginModel(id: $id, name: $name, email: $email, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ token.hashCode;
  }
}
