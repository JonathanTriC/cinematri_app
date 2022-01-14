import 'package:cinematri_app/models/movie_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final MovieModel movie;
  final int amountOfPerson;
  final String selectedSeat;
  final double tax;
  final int price;
  final int grandTotal;

  const TransactionModel({
    required this.movie,
    this.id = '',
    this.amountOfPerson = 0,
    this.selectedSeat = '',
    this.tax = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        movie: MovieModel.fromJson(json['movie']['id'], json['movie']),
        id: id,
        amountOfPerson: json['amountOfPerson'],
        selectedSeat: json['selectedSeat'],
        tax: json['tax'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );

  @override
  List<Object?> get props => [
        movie,
        amountOfPerson,
        selectedSeat,
        tax,
        price,
        grandTotal,
      ];
}
