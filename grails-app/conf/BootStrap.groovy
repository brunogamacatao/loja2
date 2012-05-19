import loja2.Usuario
import loja2.UsuarioGrupo
import loja2.Grupo
import loja2.DadosUsuario

class BootStrap {
  def springSecurityService
  
  def init = { servletContext ->
    def grupoUsuario = Grupo.findByAuthority('ROLE_USUARIO') ?: new Grupo(authority: 'ROLE_USUARIO').save(failOnError: true)
    def grupoAdmin   = Grupo.findByAuthority('ROLE_ADMIN')   ?: new Grupo(authority: 'ROLE_ADMIN').save(failOnError: true)
    
    def administrador = Usuario.findByUsername('admin@email.com') ?: new Usuario(
                    username: 'admin@email.com',
                    password: springSecurityService.encodePassword('admin'),
                    enabled:  true,
                    dados: new DadosUsuario(
                      nome:     "Administrador do Sistema",
                      ddd:      "83",
                      telefone: "1234-4321",
                      email:    "admin@email.com",
                      endereco: "Endereço",
                      numero:   "S/N",
                      bairro:   "Bairro",
                      cep:      "00000-000",
                      cidade:   "Cidade",
                      estado:   "PB",
                      pais:     "BRA"
                    )).save(failOnError: true)

    if (!administrador.authorities.contains(grupoAdmin)) {
      UsuarioGrupo.create(administrador, grupoAdmin)
    }
  }
  
  def destroy = {
  }
}
