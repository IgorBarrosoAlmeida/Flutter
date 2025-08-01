class NoticiaModel {
  int? id;
  String? title;
  String? description;
  DateTime? dtCreated;
  DateTime? dtUpdated;
  int? userId;

  NoticiaModel();

  @override
  String toString() {
    return 'NoticiaModel(id: $id, title: $title, description: $description, dtCreated: $dtCreated, dtUpdated: $dtUpdated, userId: $userId)';
  }

  factory NoticiaModel.fromMap(Map<String, dynamic> map) {
    return NoticiaModel()
      ..id = map['id']?.toInt()
      ..title = map['titulo']
      ..description = map['descricao'].toString()
      ..dtCreated = map['dt_criacao']
      ..dtUpdated = map['dt_autalizacao']
      ..userId = map['id_usuario']?.toInt();
  }

  Map toJson() {
    return {'id': id, 'title': title, 'description': description};
  }

  factory NoticiaModel.fromRequest(Map map) {
    return NoticiaModel()
      ..id = map['id']
      ..title = map['title']
      ..description = map['description']
      ..userId = map['userId']?.toInt();
  }
}
