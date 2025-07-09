// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoticiaModel {
  final int? id;
  final String titulo;
  final String descricao;
  final String img;
  final DateTime dataPublicacao;
  final DateTime? dataEdicao;

  NoticiaModel(
    this.id,
    this.titulo,
    this.descricao,
    this.img,
    this.dataPublicacao,
    this.dataEdicao,
  );

  @override
  String toString() {
    return 'NoticiaModel(id: $id, titulo: $titulo, descricao: $descricao, img: $img, dataPublicacao: $dataPublicacao, dataEdicao: $dataEdicao)';
  }

  Map toJson() {
    return {"id": id, "titulo": titulo, "descricao": descricao, "img": img};
  }

  factory NoticiaModel.fromJson(Map map) {
    return NoticiaModel(
      map["id"] ?? "",
      map["titulo"],
      map["descricao"],
      map["img"],
      DateTime.fromMicrosecondsSinceEpoch(map["dataPublicacao"]),
      map["dataEdicao"] != null
          ? DateTime.fromMicrosecondsSinceEpoch(map["dataEdicao"])
          : null,
    );
  }
}
