package loja2

class CarrinhoDeCompras {
  boolean ativo
  
  static belongsTo = [usuario: Usuario]
  static hasMany = [itens: ItemCarrinho]
  
  static constraints = {
    usuario(nullable: true)
  }
  
  def getValorTotal() {
    return itens ? itens.collect { it.valorTotal }.sum() : 0.0
  }
  
  def adicionarProduto(produto, quantidade = 1) {
    def item = ItemCarrinho.findByCarrinhoAndProduto(this, produto)
    
    if (item) {
      item.quantidade += quantidade
      item.save(flush: true)
    } else {
      this.addToItens(new ItemCarrinho(produto: produto, quantidade: quantidade, valor: produto.valor))
    }
  }
  
  def removerProduto(produto) {
    ItemCarrinho.findByCarrinhoAndProduto(this, produto).delete(flush: true)
  }
}
