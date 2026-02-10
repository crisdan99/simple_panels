local modpath = minetest.get_modpath(minetest.get_current_modname())

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
			return false, "Usá: /edit <nombre>"
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
				"Panel '" .. panel_name .. "' guardado"
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
