

class EventAttendeeRegistrationController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ eventAttendeeRegistrationInstanceList: EventAttendeeRegistration.list( params ), eventAttendeeRegistrationInstanceTotal: EventAttendeeRegistration.count() ]
    }

    def show = {
        def eventAttendeeRegistrationInstance = EventAttendeeRegistration.get( params.id )

        if(!eventAttendeeRegistrationInstance) {
            flash.message = "EventAttendeeRegistration not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ eventAttendeeRegistrationInstance : eventAttendeeRegistrationInstance ] }
    }

    def delete = {
        def eventAttendeeRegistrationInstance = EventAttendeeRegistration.get( params.id )
        if(eventAttendeeRegistrationInstance) {
            try {
                eventAttendeeRegistrationInstance.delete(flush:true)
                flash.message = "EventAttendeeRegistration ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "EventAttendeeRegistration ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "EventAttendeeRegistration not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def eventAttendeeRegistrationInstance = EventAttendeeRegistration.get( params.id )

        if(!eventAttendeeRegistrationInstance) {
            flash.message = "EventAttendeeRegistration not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ eventAttendeeRegistrationInstance : eventAttendeeRegistrationInstance ]
        }
    }

    def update = {
        def eventAttendeeRegistrationInstance = EventAttendeeRegistration.get( params.id )
        if(eventAttendeeRegistrationInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(eventAttendeeRegistrationInstance.version > version) {
                    
                    eventAttendeeRegistrationInstance.errors.rejectValue("version", "eventAttendeeRegistration.optimistic.locking.failure", "Another user has updated this EventAttendeeRegistration while you were editing.")
                    render(view:'edit',model:[eventAttendeeRegistrationInstance:eventAttendeeRegistrationInstance])
                    return
                }
            }
            eventAttendeeRegistrationInstance.properties = params
            if(!eventAttendeeRegistrationInstance.hasErrors() && eventAttendeeRegistrationInstance.save()) {
                flash.message = "EventAttendeeRegistration ${params.id} updated"
                redirect(action:show,id:eventAttendeeRegistrationInstance.id)
            }
            else {
                render(view:'edit',model:[eventAttendeeRegistrationInstance:eventAttendeeRegistrationInstance])
            }
        }
        else {
            flash.message = "EventAttendeeRegistration not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def eventAttendeeRegistrationInstance = new EventAttendeeRegistration()
        eventAttendeeRegistrationInstance.properties = params
        return ['eventAttendeeRegistrationInstance':eventAttendeeRegistrationInstance]
    }

    def save = {
        def eventAttendeeRegistrationInstance = new EventAttendeeRegistration(params)
        if(eventAttendeeRegistrationInstance.save()) {
            flash.message = "EventAttendeeRegistration ${eventAttendeeRegistrationInstance.id} created"
            redirect(action:show,id:eventAttendeeRegistrationInstance.id)
        }
        else {
            render(view:'create',model:[eventAttendeeRegistrationInstance:eventAttendeeRegistrationInstance])
        }
    }
}
