package loja2

class ItemCarrinho {
  Produto produto
  int quantidade
  BigDecimal valor
  
  static belongsTo = [carrinho: CarrinhoDeCompras]
  
  def beforeInsert = {
    valor = produto.valor
  }
  
  def getValorTotal() {
    return valor * quantidade
  }
}
