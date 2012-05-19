package loja2

import org.springframework.dao.DataIntegrityViolationException

class UsuarioController {

    static allowedMethods = [save: "POST", update: "POST"]

    def create() {
        [usuarioInstance: new Usuario(params)]
    }

    def save() {
        def usuarioInstance = new Usuario(params)
        usuarioInstance.username = usuarioInstance?.dados?.email
        usuarioInstance.enabled  = true
        
        if (!usuarioInstance.save(flush: true)) {
            render(view: "create", model: [usuarioInstance: usuarioInstance])
            return
        }

        def grupoUsuario = Grupo.findByAuthority('ROLE_USUARIO')
        UsuarioGrupo.create(usuarioInstance, grupoUsuario)

        flash.message = "Usuário criado com sucesso !"
        redirect(controller: "site")
    }

    def edit() {
        def usuarioInstance = Usuario.findByUsername(params.username)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(controller: "site")
            return
        }

        [usuarioInstance: usuarioInstance]
    }

    def update() {
        def usuarioInstance = Usuario.get(params.id)
        usuarioInstance.username = usuarioInstance?.dados?.email
        usuarioInstance.enabled  = true
        
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(controller: "site")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (usuarioInstance.version > version) {
                usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'usuario.label', default: 'Usuario')] as Object[],
                          "Another user has updated this Usuario while you were editing")
                render(view: "edit", model: [usuarioInstance: usuarioInstance])
                return
            }
        }

        def thumbnailFields = []
        
        def toExclude = []
        
        thumbnailFields.each { if (!request.getFile(it) || request.getFile(it).size <= 0) toExclude << it }
        bindData(usuarioInstance, params, [exclude: toExclude])

        if (!usuarioInstance.save(flush: true)) {
            render(view: "edit", model: [usuarioInstance: usuarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
        redirect(controller: "site")
    }
}
