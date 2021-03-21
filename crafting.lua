
minetest.register_craft({
	output = 'clothing:yarn_spool_empthy',
	recipe = {
		{'group:stick'},
		{'group:wood'},
	},
})

minetest.register_craft({
	output = 'clothing:bone_needle',
	recipe = {
		{'group:bone'},
		{'group:bone'},
	},
})

minetest.register_craft({
	output = 'clothing:spinning_machine',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'farming:string', 'group:wood'},
		{'group:wood', "group:wood", 'group:wood'},
	},
})

minetest.register_craft({
	output = 'clothing:loom',
	recipe = {
		{'group:stick', 'default:pinewood', 'group:stick'},
		{'group:stick', 'default:pinewood', 'group:stick'},
		{'default:pinewood', "default:pinewood", 'default:pinewood'},
	},
})

minetest.register_craft({
	output = 'clothing:dye_machine',
	recipe = {
		{'group:wood', 'group:stick', 'group:wood'},
		{'group:wood', 'group:stick', 'group:wood'},
		{'group:wood', "group:wood", 'group:wood'},
	},
})

minetest.register_craft({
	output = 'clothing:sewing_table',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'clothing:bone_needle', 'group:wood'},
		{'group:wood', 'clothing:bone_needle', 'group:wood'},
	},
})

