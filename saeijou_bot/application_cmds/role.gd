extends RefCounted
"""
Example command to showcase ApplicationCommand.role_option()
"""

func execute(main, bot: DiscordBot, interaction: DiscordInteraction, options: Array) -> void:
	#print(interaction.data)
	var role_id = options[0].value
	var role = interaction.data.resolved.roles[role_id]
	var role_perms = Permissions.new(role.permissions).to_array()
	interaction.reply({
		"content": "You selected role: %s <@&%s>\nPermissions are: %s" % [role.name, role_id, ", ".join(PackedStringArray(role_perms))]
	})

var data = ApplicationCommand.new()\
	super.set_name("role")\
	super.set_description("Example role option. Choose a role.")\
	super.add_option(ApplicationCommand.role_option("role", "The role you want to select.", {
		"required": true,
	}))
