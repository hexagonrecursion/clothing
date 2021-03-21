-- Spinning machine

local S = clothing.translator;

clothing.spinning_machine = appliances.appliance:new(
    {
      node_name_inactive = "clothing:spinning_machine",
      node_name_active = "clothing:spinning_machine_active",
      
      node_description = "Spinning machine",
      
      need_water = false,
      power_data = {
        ["punch"] = {
            run_speed = 1,
          },
      },
    }
  );

local spinning_machine = clothing.spinning_machine;

--------------
-- Formspec --
--------------


--function bacterium_changer:get_formspec(production_percent, consumption_percent)
function not_used()
  local progress = "image[3.6,0.5;5.5,1.5;laboratory_progress_bar.png^[transformR270]]";
  if production_percent then
    progress = "image[3.6,0.5;5.5,1.5;laboratory_progress_bar.png^[lowpart:" ..
            (production_percent) ..
            ":laboratory_progress_bar_full.png^[transformR270]]";
  end
  
  local formspec =  "formspec_version[3]" .. "size[12.75,8.5]" ..
                    "background[-1.25,-1.25;15,10;laboratory_machine_formspec.png]" ..
                    progress..
                    "list[current_player;main;1.5,3;8,4;]" ..
                    "list[context;input;2,0.25;1,1;]" ..
                    "list[context;use_in;2,1.5;1,1;]" ..
                    "list[context;output;9.75,0.25;2,2;]" ..
                    "listring[current_player;main]" ..
                    "listring[context;input]" ..
                    "listring[current_player;main]" ..
                    "listring[context;output]" ..
                    "listring[current_player;main]";
  return formspec;
end

--------------------
-- Node callbacks --
--------------------


----------
-- Node --
----------

local node_def = {
    _tt_help = "Connect to power (LV).".."\n".."Overwrite bacteriums DNA.".."\n".."Use bottle of bacteriums and upgraded DNA.",
    paramtype2 = "facedir",
    groups = {cracky = 2,},
    legacy_facedir_simple = true,
    is_ground_content = false,
    sounds = default.node_sound_wood_defaults(),
    drawtype = "mesh",
    -- selection box {x=0, y=0, z=0}
    selection_box = {
      type = "fixed",
      fixed = {
        {-0.1875,-0.5,-0.3125,0.1875,-0.4375,-0.25},
        {-0.0625,-0.5,-0.25,0.0625,-0.4375,0.3125},
        {-0.125,-0.375,-0.1875,0.125,-0.3125,0.25},
        {-0.0625,0.3125,-0.1875,0.0625,0.375,0.25},
        {-0.1875,-0.5,-0.125,-0.125,-0.3125,-0.0625},
        {0.125,-0.5,-0.125,0.1875,-0.3125,-0.0625},
        {-0.0625,-0.3125,-0.125,0.0625,0.3125,-0.0625},
        {-0.125,0.3125,-0.125,-0.0625,0.375,-0.0625},
        {0.0625,0.3125,-0.125,0.375,0.375,-0.0625},
        {-0.1875,-0.375,-0.0625,-0.125,-0.3125,0.1875},
        {0.125,-0.375,-0.0625,0.1875,-0.3125,0.1875},
        {0.1875,0.25,-0.0625,0.25,0.4375,0.0},
        {0.125,0.3125,-0.0625,0.1875,0.375,0.0},
        {0.25,0.3125,-0.0625,0.3125,0.375,0.0},
        {-0.0625,0.4375,-0.0625,0.0625,0.5,0.125},
        {-0.125,-0.3125,0.0,0.125,-0.25,0.0625},
        {-0.1875,-0.25,0.0,-0.125,-0.1875,0.0625},
        {0.125,-0.25,0.0,0.1875,-0.1875,0.0625},
        {-0.25,-0.1875,0.0,-0.1875,-0.125,0.0625},
        {0.1875,-0.1875,0.0,0.25,-0.125,0.0625},
        {-0.3125,-0.125,0.0,-0.25,0.125,0.0625},
        {0.25,-0.125,0.0,0.3125,0.125,0.0625},
        {-0.3125,0.125,0.0,-0.25,0.25,0.0625},
        {-0.25,0.125,0.0,-0.1875,0.1875,0.0625},
        {0.1875,0.125,0.0,0.25,0.1875,0.0625},
        {0.25,0.125,0.0,0.3125,0.25,0.0625},
        {-0.1875,0.1875,0.0,-0.125,0.25,0.0625},
        {0.125,0.1875,0.0,0.1875,0.25,0.0625},
        {-0.25,0.25,0.0,-0.1875,0.375,0.0625},
        {-0.125,0.25,0.0,0.125,0.3125,0.0625},
        {0.1875,0.25,0.0,0.25,0.3125,0.0625},
        {0.1875,0.3125,0.0,0.25,0.375,0.1875},
        {-0.1875,0.375,0.0,-0.125,0.4375,0.0625},
        {-0.0625,0.375,0.0,0.0625,0.4375,0.0625},
        {0.125,0.375,0.0,0.1875,0.4375,0.0625},
        {-0.125,0.4375,0.0,-0.0625,0.5,0.0625},
        {0.0625,0.4375,0.0,0.125,0.5,0.0625},
        {-0.1875,-0.5,0.125,-0.125,-0.375,0.1875},
        {0.125,-0.5,0.125,0.1875,-0.375,0.1875},
        {-0.0625,-0.3125,0.125,0.0625,0.3125,0.1875},
        {-0.125,0.3125,0.125,-0.0625,0.375,0.1875},
        {0.0625,0.3125,0.125,0.1875,0.375,0.1875},
        {0.25,0.3125,0.125,0.375,0.375,0.1875},
        -- wheel
        {-0.1875,-0.1875,0.0,-0.125,-0.125,0.0625},
        {0.125,-0.1875,0.0,0.1875,-0.125,0.0625},
        {-0.125,-0.125,0.0,-0.0625,-0.0625,0.0625},
        {0.0625,-0.125,0.0,0.125,-0.0625,0.0625},
        {-0.0625,-0.0625,0.0,0.0625,0.0625,0.0625},
        {-0.125,0.0625,0.0,-0.0625,0.125,0.0625},
        {0.0625,0.0625,0.0,0.125,0.125,0.0625},
        {-0.1875,0.125,0.0,-0.125,0.1875,0.0625},
        {0.125,0.125,0.0,0.1875,0.1875,0.0625},
      },
    },
    sunlight_propagates = true,
  }
local inactive_node = {
    tiles = {
      "default_wood.png",
      "default_junglewood.png",
      "wool_white.png",
      "default_junglewood.png"
    },
    mesh = "clothing_spinning_machine.obj",
  }
local active_node = {
    tiles = {
      "default_wood.png",
      "default_junglewood.png",
      "wool_white.png",
      {
        image = "clothing_spinning_machine_wheel_active.png",
        backface_culling = true,
        animation = {
          type = "vertical_frames",
          aspect_w = 16,
          aspect_h = 16,
          length = 0.3,
        }
      },
    },
    use_texture_alpha = "clip",
    mesh = "clothing_spinning_machine_active.obj",
  }

spinning_machine:register_nodes(node_def, inactive_node, active_node)

-------------------------
-- Recipe Registration --
-------------------------
  
spinning_machine:recipe_register_usage(
  "clothing:yarn_spool_empty",
  {
    outputs = {""},
    consumption_time = 30,
    production_step_size = 1,
  });

  spinning_machine:recipe_register_input(
    "farming:hemp_fibre",
    {
      inputs = 1,
      outputs = {"clothing:yarn_spool_white"},
      production_time = 30,
      consumption_step_size = 1,
    });
for color, hex in pairs(clothing.colors) do
  spinning_machine:recipe_register_input(
    "wool:"..color,
    {
      inputs = 1,
      outputs = {"clothing:yarn_spool_"..color},
      production_time = 30,
      consumption_step_size = 1,
    });
end

