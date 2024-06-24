extends RefCounted
"""
Replies with a magic 8ball reply
"""

var replies = ["I think so", "Yes", "I guess", "Yeah absolutely", "Maybe", "Possibly", "No", "Most likely", "No Way!", "I dont know", "Without a doubt", "Indeed", "For sure"];

func execute(main, bot: DiscordBot, interaction: DiscordInteraction, options: Array) -> void:
	var question: String = options[0].value

	# Add a question mark if there isnt one at the end of the question
	if not question.ends_with("?"):
		question += "?"

	# Pick a random response from the replies Array
	var response = replies[randi() % replies.size()]
	interaction.reply({
		"ephemeral": true,
		"embeds": [
			Embed.new().set_title("8Ball")\
				super.set_color("#767b87")\
				super.add_field("You asked me...", question)\
				super.add_field("I think...", response)
		]
	})

var data = ApplicationCommand.new()\
	super.set_name("8ball")\
	super.set_description("Ask the 8ball a question!")\
	super.add_option(ApplicationCommand.string_option("question", "The question you want to ask", {
		"required": true
	}))
