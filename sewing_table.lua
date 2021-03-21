-- Sewing table

local S = clothing.translator;

clothing.sewing_table = appliances.appliance:new(
    {
      node_name_inactive = "clothing:sewing_table",
      node_name_active = "clothing:sewing_table_active",
      
      node_description = "Sewing table",
      
      input_stack = "input",
      input_stack_size = 9,
      use_stack = "input",
      use_stack_size = 0,
      have_usage = false,
      
      
      need_water = false,
      power_data = {
        ["punch"] = {
            run_speed = 1,
          },
      },
    }
  );

local sewing_table = clothing.sewing_table;

--------------
-- Formspec --
--------------

function sewing_table:get_formspec(meta, production_percent, consumption_percent)
  local progress = "image[5.1,1;4,1.5;appliances_production_progress_bar.png^[transformR270]]";
  if production_percent then
    progress = "image[5.1,1;4,1.5;appliances_production_progress_bar.png^[lowpart:" ..
            (production_percent) ..
            ":appliances_production_progress_bar_full.png^[transformR270]]";
  end
  
  local formspec =  "formspec_version[3]" .. "size[12.75,9.5]" ..
                    "background[-1.25,-1.25;15,11;appliances_appliance_formspec.png]" ..
                    progress..
                    "list[current_player;main;1.5,4;8,4;]" ..
                    "list[context;input;1,0;3,3;]" ..
                    "list[context;output;9.75,0.75;2,2;]" ..
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
        {-0.5,0.25,-0.5,0.5,0.4375,0.5},
        {-0.375,-0.5,-0.375,-0.25,0.25,-0.25},
        {0.25,-0.5,-0.375,0.375,0.25,-0.25},
        {-0.375,0.4375,-0.375,0.0625,0.5,0.375},
        {0.25,0.4375,-0.375,0.3125,0.5,0.0},
        {0.1875,0.4375,-0.0625,0.25,0.5,0.125},
        {0.3125,0.4375,-0.0625,0.375,0.5,0.125},
        {0.25,0.4375,0.125,0.3125,0.5,0.1875},
        {-0.375,-0.5,0.25,-0.25,0.25,0.375},
        {0.25,-0.5,0.25,0.375,0.25,0.375},
      },
    },
    sunlight_propagates = true,
  }
local inactive_node = {
    tiles = {
      "default_wood.png",
      "default_junglewood.png",
      "wool_white.png",
      "clothing_sewing_table_needle.png"
    },
    mesh = "clothing_sewing_table.obj",
  }
local active_node = {
    tiles = {
      "default_wood.png",
      "default_junglewood.png",
      "wool_white.png",
      "clothing_sewing_table_needle.png"
    },
    use_texture_alpha = "clip",
    mesh = "clothing_sewing_table.obj",
  }

sewing_table:register_nodes(node_def, inactive_node, active_node)

-------------------------
-- Recipe Registration --
-------------------------
  
for color, data in pairs(clothing.colors) do
  local fabric = "clothing:fabric_"..color;
  sewing_table:recipe_register_input(
    "",
    {
      inputs = {fabric, fabric, fabric,
                fabric, "", fabric,
                "", "", "",
               },
      outputs = {"clothing:hat_"..color},
      production_time = 30,
      consumption_step_size = 1,
    });
  sewing_table:recipe_register_input(
    "",
    {
      inputs = {fabric, "", fabric,
                fabric, fabric, fabric,
                fabric, fabric, fabric,
               },
      outputs = {"clothing:shirt_"..color},
      production_time = 60,
      consumption_step_size = 1,
    });
  sewing_table:recipe_register_input(
    "",
    {
      inputs = {fabric, fabric, fabric,
                fabric, "", fabric,
                fabric, "", fabric,
               },
      outputs = {"clothing:pants_"..color},
      production_time = 60,
      consumption_step_size = 1,
    });
  sewing_table:recipe_register_input(
    "",
    {
      inputs = {fabric, fabric, "",
                fabric, fabric, "",
                fabric, fabric, "",
               },
      outputs = {"clothing:cape_"..color},
      production_time = 30,
      consumption_step_size = 1,
    });

  for picture, pic_data in pairs(clothing.pictures) do
    local inputs = {};
    local cloth_index = 2;
    
    for r_i, r_v in pairs(pic_data.recipe) do
      if (r_v=="CLOTH") then
        cloth_index = r_i;
      elseif (r_v~="") then
        if (clothing.basic_colors[r_v]==nil) then
          minetest.log("error", "Use of undefined yarn color "..r_v..".");
        end
        inputs[r_i] = "clothing:yarn_spool_"..r_v;
      else
        inputs[r_i] = "";
      end
    end
    
    inputs[cloth_index] = "clothing:shirt_"..color;
    sewing_table:recipe_register_input(
      "",
      {
        inputs = table.copy(inputs),
        outputs = {{"clothing:shirt_"..color.."_picture_"..picture}, },
        production_time = pic_data.production_time,
        consumption_step_size = 1,
      });
    
    inputs[2] = "clothing:cape_"..color;
    sewing_table:recipe_register_input(
      "",
      {
        inputs = table.copy(inputs),
        outputs = {"clothing:cape_"..color.."_picture_"..picture},
        production_time = pic_data.production_time,
        consumption_step_size = 1,
      });
  end
end


