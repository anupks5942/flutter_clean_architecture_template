import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? token;

  const User({required this.id, required this.email, this.token});

  @override
  List<Object?> get props => [id, email, token];
}