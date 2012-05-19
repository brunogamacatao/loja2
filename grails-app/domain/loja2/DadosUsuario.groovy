package loja2

class DadosUsuario {
  String nome
  String ddd
  String telefone
  String email
  String endereco
  String numero
  String complemento
  String bairro
  String cep
  String cidade
  String estado
  String pais = "BRA"

  static constraints = {
    nome(blank: false)
    ddd(blank: false, size: 2..2, matches: /\d{2}/)
    telefone(blank: false, size: 9..9, matches: /\d{4}-\d{4}/)
    email(blank: false, email: true, unique: true)
    endereco(blank: false)
    numero(blank: false)
    complemento(nullable: true)
    bairro(blank: false)
    cep(blank: false, size: 9..9, matches: /\d{5}-\d{3}/)
    cidade(blank: false)
    estado(blank: false, size: 2..2, inList: ['AC', 'AL', 'AP', 'AM', 'BA', 
    'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 
    'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'])
    pais(blank: false, size: 3..3)
  }
}
