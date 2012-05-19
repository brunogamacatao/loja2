<html>
  <head>
    <meta name="layout" content="meu_layout"/>
  </head>
  <body>
    <h1>Seu Carrinho</h1>
    <table border="0" cellspacing="5" cellpadding="5">
      <thead>
        <tr>
            <th></th>
            <th>Produto</th>
            <th>Valor Unitário</th>
            <th>Quantidade</th>
            <th>Valor Total</th>
            <th></th>
        </tr>
      </thead>
      <tbody>
          <g:each var="item" in="${carrinho.itens}">
            <tr>
                <td><g:thumbnail id="${item.produto.imagem.id}" width="100" height="100"/></td>
                <td>${item.produto}</td>
                <td><g:formatNumber number="${item.valor}" type="currency" locale="pt_BR"/></td>
                <td>${item.quantidade}</td>
                <td><g:formatNumber number="${item.valorTotal}" type="currency" locale="pt_BR"/></td>
                <td><g:link action="removerProduto" id="${item.produto.id}" class="btn btn-danger">Excluir</g:link></td>
            </tr>
          </g:each>
      </tbody>
      <tfoot>
        <tr>
            <th colspan="4">TOTAL</th>
            <th><g:formatNumber number="${carrinho.valorTotal}" type="currency" locale="pt_BR"/></th>
        </tr>
      </tfoot>
    </table>
    <sec:ifLoggedIn>
      <form action="https://pagseguro.uol.com.br/v2/checkout/payment.html" method="POST">
          <input type="hidden" name="reference" value="${carrinho.id}"/>
          <input type="hidden" name="receiverEmail" value="brunogamacatao@gmail.com"/>
          <input type="hidden" name="currency" value="BRL"/>
          <input type="hidden" name="senderEmail" value="${carrinho.usuario.dados.email}"/>
          <input type="hidden" name="senderName" value="${carrinho.usuario.dados.nome}"/>
          <input type="hidden" name="shippingAddressCountry" value="${carrinho.usuario.dados.pais}"/>
          <input type="hidden" name="shippingAddressState" value="${carrinho.usuario.dados.estado}"/>
          <input type="hidden" name="shippingAddressCity" value="${carrinho.usuario.dados.cidade}"/>
          <input type="hidden" name="shippingAddressPostalCode" value="${carrinho.usuario.dados.cep.replaceAll('-', '')}"/>
          <input type="hidden" name="senderAreaCode" value="${carrinho.usuario.dados.ddd}"/>
          <input type="hidden" name="senderPhone" value="${carrinho.usuario.dados.telefone.replaceAll('-', '')}"/>
          <input type="hidden" name="shippingAddressDistrict" value="${carrinho.usuario.dados.bairro}"/>
          <input type="hidden" name="shippingAddressStreet" value="${carrinho.usuario.dados.endereco}"/>
          <input type="hidden" name="shippingAddressNumber" value="${carrinho.usuario.dados.numero}"/>
          <input type="hidden" name="shippingAddressComplement" value="${carrinho.usuario.dados.complemento}"/>
        
          <g:each var="item" in="${carrinho.itens}" status="contador">
              <g:set var="i" value="${contador + 1}"/>
              <input type="hidden" name="itemId${i}" value="${item.produto.id}"/>
              <input type="hidden" name="itemDescription${i}" value="${item.produto.nome}"/>
              <input type="hidden" name="itemAmount${i}" value="${item.produto.valor}"/>
              <input type="hidden" name="itemQuantity${i}" value="${item.quantidade}"/>
          </g:each>
          <br/>
          <input type="submit" class="btn btn-success" value="Concluir Compra"/>
      </form>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
      <h3>Para concluir a compra é preciso estar registrado</h3>
      <p><g:link controller="login" class="btn">Entre</g:link>
      <g:link controller="usuario" action="create" class="btn">Registre-se</g:link></p>
    </sec:ifNotLoggedIn>
  </body>
</html>