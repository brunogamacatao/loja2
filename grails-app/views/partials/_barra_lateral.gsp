<div class="span3">
  <div class="well sidebar-nav">
    <ul class="nav nav-list">
      <li class="nav-header">Categorias</li>
      <g:each var="categoria" in="${loja2.Categoria.list(sort: 'nome')}">
          <li>
              <g:link action="produtos" controller="site" id="${categoria.id}">
                <g:thumbnail id="${categoria.imagem.id}" width="50" height="50"/>&nbsp;
                ${categoria}
            </g:link>
        </li>
      </g:each>
    </ul>
  </div>
</div>