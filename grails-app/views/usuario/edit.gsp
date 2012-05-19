<%@ page import="loja2.Usuario" %>

<!doctype html>
<html>
  <head>
    <meta name="layout" content="meu_layout">
    <title>Alterar Seu Perfil</title>
  </head>
  <body>
    <h1>Alterar Seu Perfil</h1>
    <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${usuarioInstance}">
    <ul class="errors" role="alert">
      <g:eachError bean="${usuarioInstance}" var="error">
      <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
      </g:eachError>
    </ul>
    </g:hasErrors>
    <g:form class="form-horizontal">
      <g:hiddenField name="id" value="${usuarioInstance?.id}" />
      <g:hiddenField name="version" value="${usuarioInstance?.version}" />
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <fieldset class="buttons">
        <g:actionSubmit class="save" action="update" value="Salvar Alterações" />
      </fieldset>
    </g:form>
  </body>
</html>