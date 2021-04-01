
minetest.register_craft({
	output = 'hades_clothing:yarn_spool_empty',
	recipe = {
		{'group:stick'},
		{'group:wood'},
	},
})

minetest.register_craft({
  output = 'hades_clothing:bone_needle',
  recipe = {
    {'group:bone'},
    {'group:bone'},
  },
})

minetest.register_craft({
	output = 'hades_clothing:spinning_machine',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'hades_farming:string', 'group:wood'},
		{'group:wood', "group:wood", 'group:wood'},
	},
})

if minetest.get_modpath("hades_larch") then
  minetest.register_craft({
    output = 'hades_clothing:loom',
    recipe = {
      {'group:stick', 'larch:wood', 'group:stick'},
      {'group:stick', 'larch:wood', 'group:stick'},
      {'larch:wood', "larch:wood", 'larch:wood'},
    },
  })
else
  minetest.register_craft({
    output = 'hades_clothing:loom',
    recipe = {
      {'group:stick', 'hades_trees:colwood_violet', 'group:stick'},
      {'group:stick', 'hades_trees:colwood_violet', 'group:stick'},
      {'hades_trees:colwood_violet', "hades_trees:colwood_violet", 'hades_trees:colwood_violet'},
    },
  })
end

minetest.register_craft({
	output = 'hades_clothing:dye_machine_empty',
	recipe = {
		{'group:wood', 'group:stick', 'group:wood'},
		{'group:wood', 'group:stick', 'group:wood'},
		{'group:wood', "group:wood", 'group:wood'},
	},
})

minetest.register_craft({
	output = 'hades_clothing:sewing_table',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:stick', 'hades_clothing:bone_needle', 'group:stick'},
		{'group:stick', 'hades_clothing:bone_needle', 'group:stick'},
	},
})

if clothing.have_farming then
  minetest.clear_craft({
    --output = "hades_extrafarming:string 2"
    recipe = {
      {"hades_extrafarming:cotton"},
      {"hades_extrafarming:cotton"},
    },
  })
  minetest.register_craft({
    output = "hades_extrafarming:string",
    recipe = {
      {"hades_clothing:yarn_spool_white"},
      {"hades_clothing:yarn_spool_white"},
    },
    replacements = {
      {"hades_clothing:yarn_spool_white", "hades_clothing:yarn_spool_empty"},
      {"hades_clothing:yarn_spool_white", "hades_clothing:yarn_spool_empty"},
    },
  })
end

if minetest.registered_items["hades_extrafarming:hemp_fibre"] then
  minetest.clear_craft({
    --output = "hades_extrafarming:cotton 3"
    recipe = {
      {"hades_extrafarming:hemp_fibre"},
      {"hades_extrafarming:hemp_fibre"},
      {"hades_extrafarming:hemp_fibre"},
    },
  })
  
end

