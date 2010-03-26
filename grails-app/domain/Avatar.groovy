
enum Avatar {
	
	LOCAL('Local'),
	GRAVATAR('Gravatar')
	
	String name
	
	Avatar(String name) {
		this.name = name
	}
	
	static list() {
		[LOCAL, GRAVATAR]
	}
}