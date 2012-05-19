<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      
      <g:link controller="site" class="brand">Minha Loja</g:link>
      
      <sec:ifLoggedIn>
        <div class="btn-group pull-right">
          <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="icon-user"></i>Usuário
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><g:link controller="usuario" action="edit" params="${[username:springSecurityService?.principal?.username]}">Perfil</g:link></li>
            <li class="divider"></li>
            <li><g:link controller="logout">Sair</g:link></li>
          </ul>
        </div>
      </sec:ifLoggedIn>
      <sec:ifNotLoggedIn>
        <ul class="nav pull-right">
          <li><g:link controller="login">Entre</g:link></li>
          <li class="divider-vertical"></li>
          <li><g:link controller="usuario" action="create">Registre-se</g:link></li>
        </ul>      
      </sec:ifNotLoggedIn>
      
      <div class="nav-collapse">
        <ul class="nav">
          <li class="active"><g:link controller="site">Início</g:link></li>
          <li><a href="#about">Sobre</a></li>
          <li><a href="#contact">Contato</a></li>
          <g:if test="${session['carrinho']}">
            <li><g:link controller="site" action="carrinho">Carrinho</g:link></li>
          </g:if>
        </ul>
      </div>
    </div>
  </div>
</div>