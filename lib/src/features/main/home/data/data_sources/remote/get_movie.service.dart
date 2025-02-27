import 'package:http/http.dart' as http;

class GetMovieService {
  final http.Client _client;

  GetMovieService(this._client);

  Future<http.Response> getMovie() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1');
    var response = await _client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MWQzYzEyMjAzMmFlMmIzZWVhYTQ5YTIyZTE2NjU2YSIsIm5iZiI6MTY4OTU5NjAzNC42MDQsInN1YiI6IjY0YjUzMDgyNzg1NzBlMDEzYTkyODY3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.uFieFTHdk0zQ0LlSKWyS2tp-FM9Vao4xclg8-_z4k_0',
      },
    );
    return response;
  }
}
