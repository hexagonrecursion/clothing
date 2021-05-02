
local S = clothing.translator;

for color, data in pairs(clothing.colors) do
	local desc = data.color;
  desc = desc:gsub("%a", string.upper, 1);
  desc = desc.." ";
  
  -- clothing
  local inv_img = "(clothing_inv_hat.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_hat.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(clothing_inv_hat_2.png^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(clothing_uv_hat_2.png^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("hades_clothing:hat_"..color, {
		description = desc..S("cotton hat"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {clothing=1},
	})
  local inv_img = "(clothing_inv_shirt.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_shirt.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(clothing_inv_shirt_2.png^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(clothing_uv_shirt_2.png^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("hades_clothing:shirt_"..color, {
		description = desc..S("cotton shirt"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {clothing=1},
	})
  local inv_img = "(clothing_inv_pants.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_pants.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(clothing_inv_pants_2.png^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(clothing_uv_pants_2.png^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("hades_clothing:pants_"..color, {
		description = desc..S("cotton pants"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {clothing=1},
	})
  local inv_img = "(clothing_inv_cape.png^[multiply:#"..data.hex..")";
  local uv_img = "(clothing_uv_cape.png^[multiply:#"..data.hex..")";
  if data.hex2 then
    inv_img = inv_img.."^(clothing_inv_cape_2.png^[multiply:#"..data.hex2..")";
    uv_img = uv_img.."^(clothing_uv_cape_2.png^[multiply:#"..data.hex2..")";
  end
	minetest.register_craftitem("hades_clothing:cape_"..color, {
		description = desc..S("cotton cape"),
		inventory_image = inv_img,
		uv_image = uv_img,
		groups = {cape=1},
	})
  
  for picture, pic_data in pairs(clothing.pictures) do
    local inv_img = "(clothing_inv_shirt.png^[multiply:#"..data.hex..")";
    local uv_img = "(clothing_uv_shirt.png^[multiply:#"..data.hex..")";
    if data.hex2 then
      inv_img = "("..inv_img.."^(clothing_inv_shirt_2.png^[multiply:#"..data.hex2.."))";
      uv_img = "("..uv_img.."^(clothing_uv_shirt_2.png^[multiply:#"..data.hex2.."))";
    end
    minetest.register_craftitem("hades_clothing:shirt_"..color.."_picture_"..picture, {
      description = desc..S("cotton shirt with picture"),
      inventory_image = inv_img.."^[combine:16x16:4,4="..pic_data.texture,
      uv_image = uv_img.."^[combine:64x64:20,39="..pic_data.texture,
      groups = {clothing=1},
    })
    local inv_img = "(clothing_inv_cape.png^[multiply:#"..data.hex..")";
    local uv_img = "(clothing_uv_cape.png^[multiply:#"..data.hex..")";
    if data.hex2 then
      inv_img = "("..inv_img.."^(clothing_inv_cape_2.png^[multiply:#"..data.hex2.."))";
      uv_img = "("..uv_img.."^(clothing_uv_cape_2.png^[multiply:#"..data.hex2.."))";
    end
    minetest.register_craftitem("hades_clothing:cape_"..color.."_picture_"..picture, {
      description = desc..S("cotton cape with picture"),
      inventory_image = inv_img.."^[combine:16x16:4,4="..pic_data.texture,
      uv_image = uv_img.."^[combine:64x32:56,22="..pic_data.texture,
      groups = {cape=1},
    })
  end
end

