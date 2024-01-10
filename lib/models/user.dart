class User {
  String nombre;
  int edad;
  List<String> profesions;

  User({
    required this.nombre,
    required this.edad,
    required this.profesions,
  });

  User copyWith({
    String? nombre,
    int? edad,
    List<String>? profesions,
  }) {
    return User(
      nombre: nombre ?? this.nombre,
      edad: edad ?? this.edad,
      profesions: profesions ?? this.profesions,
    );
  }
}
