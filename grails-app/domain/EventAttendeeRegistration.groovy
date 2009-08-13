class EventAttendeeRegistration {

    Event event
    User user
    boolean attended = false
    boolean raffleWinner = false

    static belongsTo = [event:Event,user:User]

    static constraints = {
      event()
      user()
      attended()
      raffleWinner()
    }

    String toString() {
      "(${event.startTime}) ${event.title} - ${user.firstName} ${user.lastName}"
    }
}
