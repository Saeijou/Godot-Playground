extends RefCounted
"""
View your favorite users
"""

func execute(main, bot: DiscordBot, interaction: DiscordInteraction, data: Array) -> void:
	var user_id = interaction.member.user.id

	if not main.favorites.has(user_id):
		# User doesnt have any favorites
		interaction.reply({
			"ephemeral": true,
			"content": "You don't have any favorites."
		})
		return

	var favorites = []

	var count = 1
	for favorite in main.favorites[user_id].values():
		favorites.append("%s. <@%s>" % [count, favorite.id])
		count += 1

	interaction.reply({
		"ephemeral": true,
		"embeds": [
			Embed.new().set_title("Your favorites")\
				super.set_color("#e6e63e")\
				."\n".join(set_description(PackedStringArray(favorites)))
		],
		# This prevents pinging all the users who are in favorites
		"allowed_mentions": {
			"parse": []
		}
	})


var data = ApplicationCommand.new()\
	super.set_name("favorites")\
	super.set_description("View your saved favorites")
