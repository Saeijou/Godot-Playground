extends RefCounted
"""
Example command showcasing how to send files stored as PackedByteArray
"""

func on_message(main, bot: DiscordBot, message: Message, channel: Dictionary, args: Array) -> void:
	# Sends the guild icon
	var guild_id = message.guild_id
	var bytes: PackedByteArray = await bot.get_guild_icon(guild_id).completed


	if (bytes.is_empty()):
		bot.reply(message, "Server doesn't have an image.")
		return

	bot.send(message, {
		"files": [
			{
				"name": "guild.png",
				"media_type": "image/png",
				"data": bytes
			}
		]
	})

func get_usage(p: String) -> String:
	return "`%simage`" % p

var help = {
	"name": "image",
	"category": "General",
	"aliases": ["guild"],
	"enabled": true,
	"description": "Shows the guild icon",
}
