import "dart:convert";

void main() {
  //aula01();
  //aula02();
  //aula03();
  //aula04();
  //aula05();
  //aula06();
  //aula07();
  //aula08();
  //aula09();
  //aula10();
  //aula11();
  //aula12();
  //aula13();
  //aula14();
  aula15();
}

// ------------- Introdução a variaveis -------------
void aula01() {
  String nome = "Igor Barroso";
  int idade = 19;
  bool ehMaiorDeIdade = true;
  List<String> familia = [
    "Ana Lucia",
    "Frederico",
    "Vitoria gabriela",
    "Mateus filipe",
  ];

  print(nome);
  print(idade);
  print(ehMaiorDeIdade ? "É maior de idade" : "Não é maior de idade");

  for (int i = 0; i < familia.length; i++) {
    print(familia[i]);
  }
}

// ------------- Introdução a null safety -------------
void aula02() {
  String? nomeNulo; // criação de uma variavel que pode ser nula
  nomeNulo = "igoba";
  print(nomeNulo /*!*/); // a exclamação força, garantindo que não é nulo
  nomeNulo = null; // Pode ser atribuido um valor nulo depois de ter um valor

  late String sobrenome; // Não pode ser atribuido null depois de ter um valor
  sobrenome = "Barroso";
  // sobrenome = null --> não é possivel
  print(sobrenome);
}

// ------------- IF e SWITCH -------------
void aula03() {
  bool seguirEmFrente = true;

  if (seguirEmFrente) {
    print("Andar");
  } else {
    print("Parar");
  }

  int valor = 2;

  switch (valor) {
    case 0:
      print("ZERO");
      break;
    case 1:
      print("UM");
      break;
    case 2:
      print("DOIS");
      break;
    default:
      print("PADRÃO");
      break;
  }
}

// ------------- Estruturas de repetição -------------
void aula04() {
  for (int i = 1; i <= 10; i++) {
    print(i * 2);
  }

  int cont = 10;
  while (cont != 1) {
    print(cont);
    cont--;
  }
}

// ------------- Metodos e classes -------------
void aula05() {
  Celular cellIgor = Celular("Verde", 0.8, 13);
  print(cellIgor.ToString());
}

class Celular {
  // Atributos
  final String cor;
  final double tamanho;
  final double peso;

  // Construtor
  Celular(this.cor, this.peso, this.tamanho);

  String ToString() {
    return "Cor: $cor, peso: $peso, tamanho: $tamanho";
  }
}

// ------------- POO -------------
void aula06() {
  Carro ferrari = Carro("Ferrari");

  ferrari._valor = 10;
  print(ferrari.valorDoCarro);
}

class Carro {
  // Atributos
  final String modelo;
  int _valor = 1000;
  int get valorDoCarro => _valor;
  void setValue(int valor) => _valor = valor;

  // Construtor
  Carro(this.modelo);
}

// ------------- Herança, polimorfismo e abstração-------------
void aula07() {
  Pagamento pagamento = PagamentoComPix();
  pagamento.pagar();

  pagamento = PagamentoComBoleto();
  pagamento.pagar();
}

// Abstração
abstract class Pessoa {
  String comunicar();
}

class PessoaET implements Pessoa {
  String comunicar() {
    return "Olá mundo!";
  }
}

class PessoaNaoET implements Pessoa {
  String comunicar() {
    return "Bom dia!";
  }
}

// Herança
class Pai {
  String falar() {
    return "Girias";
  }
}

class Filho extends Pai {} // Já tem o metodo falar

// Polimorfismo
abstract class Pagamento {
  void pagar();
}

class PagamentoComPix implements Pagamento {
  void pagar() {
    print("Pagando com pix");
  }
}

class PagamentoComBoleto implements Pagamento {
  void pagar() {
    print("P  agando com Boleto");
  }
}

// ------------- Future, async e await -------------
void aula08() async {
  Future<String> cepFuture = getCepByName("Rua JK");
  // cepFuture.then((result) => print(result));
  String cep = await cepFuture; // espera o cepFuture ter um valor

  print(cep);
}

// External service
Future<String> getCepByName(String name) {
  return Future.value("311234");
}

// ------------- Mapas -------------
void aula09() {
  Map<String, String> mapa = {"chave": "valor"};

  print(mapa["chave"]);

  // Adicionar
  mapa.putIfAbsent("novaChave", () => "novoValor");
  print(mapa);

  mapa["terceiraChave"] = "terceiroValor";
  print(mapa);

  // Remover
  mapa.remove("chave");
  print(mapa);

  // Atualizar
  mapa["terceiraChave"] = "atualizado";
  print(mapa);

  mapa.update("terceiraChave", (value) => "novaAtualização");

  // Iteração
  mapa.forEach((chave, valor) => print("$chave : $valor"));
}

// ------------- JSON -------------

void aula10() {
  String json = ''' 
    {
      "Usuario": "igor",
      "Senha": 123456,
      "Permissoes": [
        "owner", "admin"
      ]
    }
  ''';

  var resultJSON = jsonDecode(json); // transforma a string em i
  print(resultJSON);

  // Criando um JSON a partir de um objeto mapa
  Map mapa2 = {
    "User": "Igor",
    "Password": 123456,
    "Pemissions": ["admin", "owner"],
  };

  String jsonValido = jsonEncode(mapa2);
  print(jsonValido);
}

// ------------- Callable Interface (CALL) -------------
void aula11() {
  BuscarAlunos buscarAlunos = BuscarAlunos();
  buscarAlunos();
}

class BuscarAlunos {
  void call() => print("Aluno1, Aluno2, Aluno3");
}

// ------------- Tratamento de exceções -------------
void aula12() {
  try {
    print((2 / 0).toInt());
  } on CustomError catch (e, stackStrace) {
    // um erro especifico
    print(e); // Printa qual foi a exceção
    print(stackStrace); // Printa a pilha de erro
    rethrow; // Propaga o erro --> quem chamou a função que vai tratar
  } catch (e) {
    // Um erro geral
    print(e);
  } finally {
    // sempre vai executar
  }
}

class CustomError implements Exception {
  // Atributos
  final String error;

  // Construtor
  CustomError(this.error);
}

// ------------- Extensions -------------
void aula13() {
  String nome3 = "igor";
  print(nome3.firstCharToUpperCase());
}

extension ExtensionString on String {
  String firstCharToUpperCase() {
    return this[0].toUpperCase() + this.substring(1);
  }
}

// ------------- Enum -------------
void aula14() {
  TipoPagamento tipo = TipoPagamento.CARTAO;
  print(tipo.toValue());
}

enum TipoPagamento { PIX, BOLETO, CARTAO }

extension ExtensionTipoPagamento on TipoPagamento {
  String toValue() {
    // Mapeando os valores para string
    Map map = {
      TipoPagamento.BOLETO: "boleto",
      TipoPagamento.PIX: "pix",
      TipoPagamento.CARTAO: "cartão",
    };

    return map[this]; // retorna de acordo com o tipo passado
  }
}

// ------------- Enhanced enum -------------
void aula15() {
  EnhancedTipoPagamento tipo2 = EnhancedTipoPagamento.BOLETO;
  print(tipo2.value);
  print(tipo2.id);
}

enum EnhancedTipoPagamento {
  PIX('Pix', 1),
  BOLETO('Boleto', 2),
  CARTAO('Cartao', 3);

  final String value;
  final int id;
  const EnhancedTipoPagamento(this.value, this.id);
}
