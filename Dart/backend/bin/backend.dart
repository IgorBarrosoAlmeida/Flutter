import "package:shelf/shelf.dart";
import "package:shelf/shelf_io.dart" as shelf_io;
import 'serve_handler.dart';

void main() async {
  ServeHandler _serverHandler = ServeHandler();

  final server = await shelf_io.serve(
    _serverHandler.handler,
    "localhost",
    8080,
  );

  print("Servidor iniciado: http://localhost:8080");
}
