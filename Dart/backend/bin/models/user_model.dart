class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  bool? isActive;
  DateTime? dtCreated;
  DateTime? dtUpdate;

  UserModel.create(
    this.id,
    this.name,
    this.email,
    this.isActive,
    this.dtCreated,
    this.dtUpdate,
  );

  UserModel();

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, isActive: $isActive, dtCreated: $dtCreated, dtUpdate: $dtUpdate)';
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel.create(
      map['id'] ?? 0,
      map['nome'] ?? "",
      map['email'] ?? "",
      map['is_ativo'] == 1,
      map['dt_criacao'],
      map['dt_autalizacao'],
    );
  }

  factory UserModel.fromRequest(Map map) {
    return UserModel()
      ..name = map['nome']
      ..email = map['email']
      ..password = map['password'];
  }
}
