
local S = clothing.translator;

minetest.register_node("clothing:dirty_water_source", {
	description = S("Dirty water source"),
	drawtype = "liquid",
	waving = 3,
	tiles = {
		{
			name = "clothing_dirty_water_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "clothing_dirty_water_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 2,
	liquidtype = "source",
	liquid_alternative_flowing = "clothing:dirty_water_flowing",
	liquid_alternative_source = "clothing:dirty_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 225, r = 80, g = 65, b = 51},
	groups = {liquid = 3, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("clothing:dirty_water_flowing", {
	description = S("Flowing dirty water"),
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"clothing_dirty_water.png"},
	special_tiles = {
		{
			name = "clothing_dirty_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "clothing_dirty_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 2,
	liquidtype = "flowing",
	liquid_alternative_flowing = "clothing:dirty_water_flowing",
	liquid_alternative_source = "clothing:dirty_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 225, r = 80, g = 65, b = 51},
	groups = {liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

bucket.register_liquid(
	"clothing:dirty_water_source",
	"clothing:dirty_water_flowing",
	"clothing:bucket_dirty_water",
	"clothing_bucket_dirty_water.png",
	S("Dirty water bucket").."\n"..
  S("Put dirty water on gravel and wait for cleaning it."),
	{tool = 1}
)

minetest.register_abm({
  label = "Cleaning dirty water by gravel",
  nodenames = {"clothing:dirty_water_source"},
  neighbors = {"default:gravel"},
  interval = 30,
  chance = 60, -- etc 1800 sconds to clean 60 dirty water near gravel
  action = function(pos, node) 
      node.name = "default:river_water_source";
      local near = minetest.find_node_near(pos, 2, "group:water");
      if near then
        near = minetest.get_node(near);
        node.name = minetest.registered_nodes[near.name].liquid_alternative_source;
      end
      minetest.set_node(pos, node);
    end,
});

minetest.register_abm({
  label = "Mixing water and dirty water",
  nodenames = {"default:water_source", "default:water_river_source"},
  neighbors = {"clothing:dirty_water_source"},
  interval = 5,
  chance = 5, 
  action = function(pos, node) 
      node.name = "clothing:dirty_water_source";
      minetest.set_node(pos, node);
    end,
});

minetest.register_abm({
  label = "Mixing water and flowing dirty water",
  nodenames = {"default:water_source", "default:water_river_source"},
  neighbors = {"clothing:dirty_water_flowing"},
  interval = 10,
  chance = 200, 
  action = function(pos, node) 
      node.name = "clothing:dirty_water_source";
      minetest.set_node(pos, node);
    end,
});

minetest.register_abm({
  label = "Mixing dirty water and water",
  nodenames = {"clothing:dirty_water_source"},
  neighbors = {"default:water_source"},
  interval = 5,
  chance = 5, 
  action = function(pos, node) 
      node.name = "default:water_source";
      minetest.set_node(pos, node);
    end,
});

minetest.register_abm({
  label = "Mixing dirty water and river water",
  nodenames = {"clothing:dirty_water_source"},
  neighbors = {"default:river_water_source"},
  interval = 5,
  chance = 5, 
  action = function(pos, node) 
      node.name = "default:river_water_source";
      minetest.set_node(pos, node);
    end,
});

