import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String city;
  final int balance;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.city = '',
    this.balance = 0,
  });

  @override
  List<Object?> get props => [id, email, name, city, balance];
}
