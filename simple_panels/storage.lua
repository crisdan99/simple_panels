simple_panels = {}

simple_panels.storage = minetest.get_mod_storage()

simple_panels.panels =
	minetest.deserialize(
		simple_panels.storage:get_string("panels")
	) or {}

function simple_panels.save()
	simple_panels.storage:set_string(
		"panels",
		minetest.serialize(simple_panels.panels)
	)
end
