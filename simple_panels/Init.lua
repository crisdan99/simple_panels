local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

-- Translator
local S = minetest.get_translator(modname)

dofile(modpath .. "/privs.lua")
dofile(modpath .. "/storage.lua")
dofile(modpath .. "/ui.lua")

-- /panel  y  /panel <nombre>
minetest.register_chatcommand("panel", {
	privs = { panel_admin = true },
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then return end

		if param ~= "" then
			simple_panels.show_panel(player, param)
		else
			simple_panels.main_menu(player)
		end
	end
})

-- /edit <nombre>
minetest.register_chatcommand("edit", {
	params = "<nombre>",
	privs = { panel_admin = true },
	func = function(name, param)
		if param == "" then
			return false, S("Use: /edit <name>")
		end

		local player = minetest.get_player_by_name(name)
		if not player then return end

		simple_panels.editor(player, param)
	end
})

-- /panels
minetest.register_chatcommand("panels", {
	privs = { panel_admin = true },
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then return end

		simple_panels.list(player)
	end
})

-- Eventos de formspec
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if not player then return end
	local name = player:get_player_name()

	-- Menú principal
	if formname == "simple_panels:menu" then
		if fields.create then
			simple_panels.editor(player, "nuevo_panel")
		elseif fields.list then
			simple_panels.list(player)
		end
	end

	-- Guardar panel
	if formname:find("^simple_panels:edit:") then
		local panel_name = formname:gsub("simple_panels:edit:", "")

		if fields.save then
			simple_panels.panels[panel_name] = {
				text = fields.text or ""
			}
			simple_panels.save()

			minetest.chat_send_player(
				name,
				S("Panel saved")
			)
		end
	end

	-- Lista → abrir panel
	if formname == "simple_panels:list" then
		for field,_ in pairs(fields) do
			if field:sub(1,5) == "open_" then
				local panel_name = field:sub(6)
				simple_panels.show_panel(player, panel_name)
			end
		end
	end
end)
