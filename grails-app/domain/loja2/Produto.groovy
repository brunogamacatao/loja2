package loja2

import bgc.thumbnail.Thumbnail

class Produto {
  String nome
  Thumbnail imagem
  String descricao
  BigDecimal valor
  boolean emDestaque
  
  static hasMany = [categorias: Categoria]
  
  static constraints = {
    nome(blank: false)
    valor(blank: false, min: 0.01, scale: 2)
    descricao(blank: false, widget: 'textarea')
    imagem(blank: false)
  }
  
  static mapping = {
    descricao sqlType: 'text'
  }
  
  String toString() {
    nome
  }
}
