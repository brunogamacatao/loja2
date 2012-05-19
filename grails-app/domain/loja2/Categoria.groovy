package loja2

import bgc.thumbnail.Thumbnail

class Categoria {
  String nome
  Thumbnail imagem
  
  static hasMany   = [produtos: Produto]
  static belongsTo = [Produto]

  static constraints = {
    nome(blank: false)
    imagem(blank: false)
  }
  
  String toString() {
    nome
  }
}
