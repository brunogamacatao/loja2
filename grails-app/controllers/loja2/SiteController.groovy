package loja2

class SiteController {
  def springSecurityService
  
  def index() { }
  
  def comprarProduto() {
    carrinho.adicionarProduto(Produto.get(params.id))
    redirect(action: "carrinho")
  }
  
  def carrinho() {
    [carrinho: carrinho]
  }
  
  def removerProduto() {
    carrinho.removerProduto(Produto.get(params.id))
    redirect(action: "carrinho")
  }
  
  private def getCarrinho() {
    if (!session['carrinho'])
      session['carrinho'] = new CarrinhoDeCompras().save(flush: true)
    CarrinhoDeCompras.get(session['carrinho'].id)
  }
  
  private def getUsuarioLogado() {
    Usuario.get(springSecurityService.principal.id)
  }
}
