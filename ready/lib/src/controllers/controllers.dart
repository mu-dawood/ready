library controllers;

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import '../enums.dart';

part 'ready_list_controller.dart';
part 'ready_list_state.dart';

class ReadylistResponse<T> {
  factory ReadylistResponse.success({
    required Iterable<T> items,
    required int total,
  }) = _Success<T>;

  factory ReadylistResponse.cancel() = _Cancel;
  factory ReadylistResponse.error(String message) = _Error;
}

class _Success<T> implements ReadylistResponse<T> {
  final Iterable<T> items;
  final int total;

  _Success({
    required this.items,
    required this.total,
  });
}

class _Cancel<T> implements ReadylistResponse<T> {}

class _Error<T> implements ReadylistResponse<T> {
  final String error;

  _Error(this.error);
}
