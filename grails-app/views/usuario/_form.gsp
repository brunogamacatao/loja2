<%@ page import="loja2.Usuario" %>

<div class="control-group">
  <fieldset class="embedded"><legend>Identificação</legend>
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.email', 'error')} required">
      <label for="dados.email">
        Email
        <span class="required-indicator">*</span>
      </label>
      <g:field type="email" name="dados.email" required="" value="${usuarioInstance?.dados?.email}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
      <label for="password">
        Senha
        <span class="required-indicator">*</span>
      </label>
      <g:passwordField name="password" required="" value="${usuarioInstance?.password}"/>
    </div>
  </fieldset>

  <fieldset class="embedded"><legend>Informações Pessoais</legend>
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.nome', 'error')} required">
      <label for="dados.nome">
        Nome
        <span class="required-indicator">*</span>
      </label>
      <g:textField name="dados.nome" required="" value="${usuarioInstance?.dados?.nome}"/>
    </div>
    
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.ddd', 'error')} required">
      <label for="dados.ddd">
        DDD
        <span class="required-indicator">*</span>
      </label>
      <g:textField name="dados.ddd" maxlength="2" pattern="${usuarioInstance?.dados.constraints.ddd.matches}" required="" value="${usuarioInstance?.dados?.ddd}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.telefone', 'error')} required">
      <label for="dados.telefone">
        Telefone
        <span class="required-indicator">*</span>
      </label>
      <g:textField name="dados.telefone" maxlength="9" pattern="${usuarioInstance?.dados.constraints.telefone.matches}" required="" value="${usuarioInstance?.dados?.telefone}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.endereco', 'error')} required">
      <label for="dados.endereco">
        Endereço
        <span class="required-indicator">*</span>
      </label>
      <g:textField name="dados.endereco" required="" value="${usuarioInstance?.dados?.endereco}"/>
    </div>
    
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.numero', 'error')} required">
      <label for="dados.numero">
        Número
        <span class="required-indicator">*</span>
      </label>
      <g:textField name="dados.numero" required="" value="${usuarioInstance?.dados?.numero}"/>
    </div>
    
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.complemento', 'error')} ">
      <label for="dados.complemento">
        Complemento
      </label>
      <g:textField name="dados.complemento" value="${usuarioInstance?.dados?.complemento}"/>
    </div>
    
    
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.bairro', 'error')} required">
      <label for="dados.bairro">
        Bairro
        <span class="required-indicator">*</span>
      </label>
      <g:textField name="dados.bairro" required="" value="${usuarioInstance?.dados?.bairro}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.cep', 'error')} required">
      <label for="dados.cep">
        CEP
        <span class="required-indicator">*</span>
      </label>
      <g:textField name="dados.cep" maxlength="9" pattern="${usuarioInstance?.dados.constraints.cep.matches}" required="" value="${usuarioInstance?.dados?.cep}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.cidade', 'error')} required">
      <label for="dados.cidade">
        Cidade
        <span class="required-indicator">*</span>
      </label>
      <g:textField name="dados.cidade" required="" value="${usuarioInstance?.dados?.cidade}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'dados.estado', 'error')} required">
      <label for="dados.estado">
        Estado
        <span class="required-indicator">*</span>
      </label>
      <g:select name="dados.estado" from="${usuarioInstance?.dados.constraints.estado.inList}" required="" value="${usuarioInstance?.dados?.estado}" valueMessagePrefix="dadosUsuario.estado"/>
    </div>

  </fieldset>
</div>