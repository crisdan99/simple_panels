-- Menú principal
function simple_panels.main_menu(player)
	local fs =
	"formspec_version[4]"..
	"size[8,6]"..
	"box[0,0;8,6;#777777AA]"..
	"label[2.5,0.5;Panel Manager]"..
	"button[2,1.5;4,0.8;create;Crear panel]"..
	"button[2,2.5;4,0.8;list;Lista de paneles]"..
	"button_exit[2,4.5;4,0.8;exit;Salir]"

	minetest.show_formspec(
		player:get_player_name(),
		"simple_panels:menu",
		fs
	)
end

-- Mostrar un panel
function simple_panels.show_panel(player, name)
	local panel = simple_panels.panels[name]
	if not panel then return end

	local fs =
	"formspec_version[4]"..
	"size[10,6]"..
	"box[0,0;10,6;#888888AA]"..
	"label[0.5,0.5;"..panel.text.."]"..
	"button_exit[3.5,5;3,0.8;exit;Exit]"

	minetest.show_formspec(
		player:get_player_name(),
		"simple_panels:view",
		fs
	)
end

-- Editor de panel
function simple_panels.editor(player, name)
	local panel = simple_panels.panels[name] or { text = "" }

	local fs =
	"formspec_version[4]"..
	"size[10,7]"..
	"box[0,0;10,7;#666666AA]"..
	"field[0.5,1;9,1;text;Texto del panel;"..
		minetest.formspec_escape(panel.text).."]"..
	"button[2,5.5;3,0.8;save;Guardar]"..
	"button_exit[5,5.5;3,0.8;exit;Salir]"

	minetest.show_formspec(
		player:get_player_name(),
		"simple_panels:edit:"..name,
		fs
	)
end

-- Lista de paneles
function simple_panels.list(player)
	local y = 1.2
	local fs =
	"formspec_version[4]"..
	"size[8,7]"..
	"box[0,0;8,7;#555555AA]"..
	"label[2.5,0.5;Paneles creados]"

	for name,_ in pairs(simple_panels.panels) do
		fs = fs ..
		"button[1,"..y..";6,0.7;open_"..name..";"..name.."]"
		y = y + 0.8
	end

	fs = fs ..
	"button_exit[2,6.1;4,0.8;exit;Salir]"

	minetest.show_formspec(
		player:get_player_name(),
		"simple_panels:list",
		fs
	)
end
