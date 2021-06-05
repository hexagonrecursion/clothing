
local S = clothing.translator;

for color, data in pairs(clothing.colors) do
	local desc = data.color;
  desc = desc:gsub("%a", string.upper, 1);
  desc = desc.." ";
  
  -- clothes
  -- hat
  local inv_img = "(clothing_inv_hat.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_hat.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(((clothing_inv_hat.png^clothing_inv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(((clothing_uv_hat.png^clothing_uv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("clothing:hat_"..color, {
		description = desc..S("cotton hat"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {clothing=1},
	})
  -- t-shirt
  local inv_img = "(clothing_inv_shirt.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_shirt.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(((clothing_inv_shirt.png^clothing_inv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(((clothing_uv_shirt.png^clothing_uv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("clothing:shirt_"..color, {
		description = desc..S("cotton shirt"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {clothing=1},
	})
  -- pants
  local inv_img = "(clothing_inv_pants.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_pants.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(((clothing_inv_pants.png^clothing_inv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(((clothing_uv_pants.png^clothing_uv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("clothing:pants_"..color, {
		description = desc..S("cotton pants"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {clothing=1},
	})
  -- cape
  local inv_img = "(clothing_inv_cape.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_cape.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(((clothing_inv_cape.png^clothing_inv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(((clothing_uv_cape.png^clothing_uv_cape_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("clothing:cape_"..color, {
		description = desc..S("cotton cape"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {cape=1},
	})
  
  -- hood mask
  local inv_img = "(clothing_inv_hood_mask.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_hood_mask.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(((clothing_inv_hood_mask.png^clothing_inv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(((clothing_uv_hood_mask.png^clothing_uv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("clothing:hood_mask_"..color, {
		description = desc..S("cotton hood mask"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {clothing=1},
	})
  
  -- glove
  local inv_img = "(clothing_inv_glove.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_glove.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(((clothing_inv_glove.png^clothing_inv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(((clothing_uv_glove.png^clothing_uv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("clothing:glove_"..color, {
		description = desc..S("cotton glove"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {clothing=1},
	})
  
  -- shorts
  local inv_img = "(clothing_inv_shorts.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_shorts.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(((clothing_inv_shorts.png^clothing_inv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(((clothing_uv_shorts.png^clothing_uv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("clothing:shorts_"..color, {
		description = desc..S("cotton shorts"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {clothing=1},
	})
  
  
  for picture, pic_data in pairs(clothing.pictures) do
    -- t-shirt
    local inv_img = "(clothing_inv_shirt.png^[multiply:#"..data.hex..")";
    local uv_img = "(clothing_uv_shirt.png^[multiply:#"..data.hex..")";
    if data.hex2 then
      inv_img = "("..inv_img.."^(((clothing_inv_shirt.png^clothing_inv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2.."))";
      uv_img = "("..uv_img.."^(((clothing_uv_shirt.png^clothing_uv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2.."))";
    end
    minetest.register_craftitem("clothing:shirt_"..color.."_picture_"..picture, {
      description = desc..S("cotton shirt with picture"),
      inventory_image = inv_img.."^[combine:16x16:4,4="..pic_data.texture,
      uv_image = uv_img.."^[combine:64x64:20,39="..pic_data.texture,
      groups = {clothing=1},
    })
    -- cape
    local inv_img = "(clothing_inv_cape.png^[multiply:#"..data.hex..")";
    local uv_img = "(clothing_uv_cape.png^[multiply:#"..data.hex..")";
    if data.hex2 then
      inv_img = "("..inv_img.."^(((clothing_inv_cape.png^clothing_inv_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2.."))";
      uv_img = "("..uv_img.."^(((clothing_uv_cape.png^clothing_uv_cape_second_color.png)^[makealpha:0,0,0)^[multiply:#"..data.hex2.."))";
    end
    minetest.register_craftitem("clothing:cape_"..color.."_picture_"..picture, {
      description = desc..S("cotton cape with picture"),
      inventory_image = inv_img.."^[combine:16x16:4,4="..pic_data.texture,
      uv_image = uv_img.."^[combine:64x32:56,22="..pic_data.texture,
      groups = {cape=1},
    })
  end
end

