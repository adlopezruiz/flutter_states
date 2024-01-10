class User {
  String? nombre;
  int? edad;
  List<String>? profesions;

  User({
    this.nombre,
    this.edad,
    this.profesions = const [],
  });
}
