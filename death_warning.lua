local enabled = ui.new_checkbox("LUA", "B", "Death warning")

print("DEATH WARNING LUA CODED BY GERAL")

local function paint()
	local lp = entity.get_local_player()
	local lp_health = entity.get_prop(lp,"m_iHealth")

	if lp_health < 50 and lp_health > 25 then
		r,g,b = 255,165,0
	elseif lp_health < 25 and lp_health > 10 then
		r,g,b = 163, 106, 0
	elseif lp_health < 10 then
		r,g,b = 255, 0, 0
	end

	if ui.get(enabled) and lp_health < 50 and lp_health > 0 then
		renderer.indicator(r,g,b,255,"DEATH")
	end
end

client.set_event_callback("paint", paint)