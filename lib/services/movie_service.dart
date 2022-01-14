import 'package:cinematri_app/models/movie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieService {
  final CollectionReference _movieReference =
      FirebaseFirestore.instance.collection('movies');

  Future<List<MovieModel>> fetchMovies() async {
    try {
      QuerySnapshot result = await _movieReference.get();

      List<MovieModel> movies = result.docs.map((e) {
        return MovieModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
