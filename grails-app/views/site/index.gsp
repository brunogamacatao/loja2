<html>
  <head>
    <meta name="layout" content="meu_layout"/>
  </head>
  <body>
    <h1>Produtos em Destaque</h1>
    <ul class="thumbnails">
        <g:each var="produto" in="${loja2.Produto.findAllByEmDestaque(true)}">
            <li class="span3">
                <div class="thumbnail">
                    <g:thumbnail id="${produto.imagem.id}" width="260" height="180"/>
                    <div class="caption">
                        <h5>${produto}</h5>
                        <p><span class="label label-success">
                            <g:formatNumber number="${produto.valor}" type="currency" currencyCode="BRL"/>
                        </span></p>
                        <p>
                            <g:link controller="site" action="comprarProduto" id="${produto.id}" class="btn btn-primary">Comprar</g:link>
                        </p>
                    </div>
                </div>
            </li>
        </g:each>
    </ul>
  </body>
</html>