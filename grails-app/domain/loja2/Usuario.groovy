package loja2

class Usuario {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	DadosUsuario dados = new DadosUsuario()
	
	static hasMany  = [carrinhos: CarrinhoDeCompras]
	static embedded = ['dados']

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Grupo> getAuthorities() {
		UsuarioGrupo.findAllByUsuario(this).collect { it.grupo } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
