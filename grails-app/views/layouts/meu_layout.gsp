<html>
  <head>
    <title>Minha Loja</title>
    <r:require module="bootstrap"/>
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>    
    <g:layoutHead/>
    <r:layoutResources/>
  </head>
  <body>
    <g:render template="/partials/barra_titulo"/>
    
    <div class="container-fluid">
      <div class="row-fluid">
        <g:render template="/partials/barra_lateral"/>
        <div class="span9">
          <g:layoutBody/>
        </div>
      </div>
      <g:render template="/partials/rodape"/>
    </div>
    
    <r:layoutResources/>
  </body>
</html>