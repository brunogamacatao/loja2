package loja2

import org.apache.commons.lang.builder.HashCodeBuilder

class UsuarioGrupo implements Serializable {

	Usuario usuario
	Grupo grupo

	boolean equals(other) {
		if (!(other instanceof UsuarioGrupo)) {
			return false
		}

		other.usuario?.id == usuario?.id &&
			other.grupo?.id == grupo?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (usuario) builder.append(usuario.id)
		if (grupo) builder.append(grupo.id)
		builder.toHashCode()
	}

	static UsuarioGrupo get(long usuarioId, long grupoId) {
		find 'from UsuarioGrupo where usuario.id=:usuarioId and grupo.id=:grupoId',
			[usuarioId: usuarioId, grupoId: grupoId]
	}

	static UsuarioGrupo create(Usuario usuario, Grupo grupo, boolean flush = false) {
		new UsuarioGrupo(usuario: usuario, grupo: grupo).save(flush: flush, insert: true)
	}

	static boolean remove(Usuario usuario, Grupo grupo, boolean flush = false) {
		UsuarioGrupo instance = UsuarioGrupo.findByUsuarioAndGrupo(usuario, grupo)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Usuario usuario) {
		executeUpdate 'DELETE FROM UsuarioGrupo WHERE usuario=:usuario', [usuario: usuario]
	}

	static void removeAll(Grupo grupo) {
		executeUpdate 'DELETE FROM UsuarioGrupo WHERE grupo=:grupo', [grupo: grupo]
	}

	static mapping = {
		id composite: ['grupo', 'usuario']
		version false
	}
}
