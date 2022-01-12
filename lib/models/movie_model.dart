import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final String id;
  final String name;
  final String genre;
  final String imageUrl;
  final String cast1;
  final String cast2;
  final String cast3;
  final double rating;
  final int price;

  const MovieModel({
    required this.id,
    this.name = '',
    this.genre = '',
    this.imageUrl = '',
    this.cast1 = '',
    this.cast2 = '',
    this.cast3 = '',
    this.rating = 0.0,
    this.price = 0,
  });

  factory MovieModel.fromJson(String id, Map<String, dynamic> json) =>
      MovieModel(
        id: id,
        name: json['name'],
        genre: json['genre'],
        imageUrl: json['imageUrl'],
        cast1: json['cast1'],
        cast2: json['cast2'],
        cast3: json['cast3'],
        rating: json['rating'].toDouble(),
        price: json['price'],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        genre,
        imageUrl,
        cast1,
        cast2,
        cast3,
        rating,
        price,
      ];
}
