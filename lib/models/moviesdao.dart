class MoviesDAO {
  int? idMovie;
  String? nameMovie;
  String? overview;
  String? idGenre;
  String? imgMovie;
  String? releaseDate;

  MoviesDAO(
      {this.idMovie,
      this.nameMovie,
      this.overview,
      this.idGenre,
      this.imgMovie,
      this.releaseDate});

  factory MoviesDAO.fromMap(Map<String, dynamic> movie) {
    return MoviesDAO(
        idGenre: movie['idGenre'],
        idMovie: movie['idMovie'],
        nameMovie: movie['nameMovie'],
        overview: movie['overview'],
        imgMovie: movie['imgMovie'],
        releaseDate: movie['releaseDate']);
  }
}
