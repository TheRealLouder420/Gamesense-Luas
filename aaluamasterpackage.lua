-- our menu elements :D
local preset_choice = ui.new_combobox("AA", "Anti-aimbot angles", "Preset choice", {"Gamesense AA", "Prediction Crack", "Acatel.us"})

-- all aa refs
local yawbody, yaw = ui.reference("AA", "Anti-aimbot angles", "Yaw")
local bodyyaw, bodyyaw2 = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
local freeyaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
local edge = ui.reference("AA", "Anti-aimbot angles", "Edge yaw")
local jyaw, jyawslide = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")
local pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch")
local yawbase = ui.reference("AA", "Anti-aimbot angles", "Yaw base")
local freestanding, freestanding2 = ui.reference("AA", "Anti-aimbot angles", "Freestanding")
local fyawlimit = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local freestand_byaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
local slow_walk, slow_walk2 = ui.reference("AA", "Other", "Slow motion")

-- this is here for debugging or indicators whatever you want idgaf
local state = "NONE"

-- acatel.us !!!
local function acatel_us_aa()
	local localplayer = entity.get_local_player()
	local flags = entity.get_prop(localplayer, "m_fFlags")
	local vx, vy = entity.get_prop(localplayer, "m_vecVelocity")
	local velocity = math.floor(math.min(10000, math.sqrt(vx*vx + vy*vy) + 0.5))
	if ui.get(slow_walk) and ui.get(slow_walk2) then
        --slowwalk
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, 5)
        ui.set(yawbody, "180")
        ui.set(jyaw, "Center")
        ui.set(jyawslide, 0)
        ui.set(bodyyaw, "Jitter")
        ui.set(bodyyaw2, -79)
        ui.set(freestand_byaw, false)
        ui.set(fyawlimit, math.random(30,45))
        state = "SLOWWALK"
    elseif flags == 263 and velocity < 250 then
        --crouch
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, math.random(5,-10))
        ui.set(yawbody, "180")
        ui.set(jyaw, "Center")
        ui.set(jyawslide, 0)
        ui.set(bodyyaw, "Jitter")
        ui.set(bodyyaw2, -79)
        ui.set(freestand_byaw, false)
        ui.set(fyawlimit, math.random(30,45))
        state = "CROUCH"
    elseif flags == 256 or flags == 262 or velocity > 250 then
        --air
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, 0)
        ui.set(yawbody, "180")
        ui.set(jyaw, "Center")
        ui.set(jyawslide, 25)
        ui.set(bodyyaw, "Jitter")
        ui.set(bodyyaw2, 0)
        ui.set(freestand_byaw, false)
        ui.set(fyawlimit, 60)
        state = "AIR"
    elseif flags == 257 and velocity > 10 and velocity < 250 then
        --moving
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, 0)
        ui.set(yawbody, "180")
        ui.set(jyaw, "Center")
        ui.set(jyawslide, 79)
        ui.set(bodyyaw, "Jitter")
        ui.set(bodyyaw2, 0)
        ui.set(freestand_byaw, false)
        ui.set(fyawlimit, 60)
        state = "MOVING"
    else
        --stand
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, 0)
        ui.set(yawbody, "180")
        ui.set(jyaw, "Center")
        ui.set(jyawslide, 25)
        ui.set(bodyyaw, "Jitter")
        ui.set(bodyyaw2, 0)
        ui.set(freestand_byaw, false)
        ui.set(fyawlimit, 60)
        state = "STAND"
    end
end

local function prediction_crack_aa()
	local localplayer = entity.get_local_player()
	local flags = entity.get_prop(localplayer, "m_fFlags")
	local vx, vy = entity.get_prop(localplayer, "m_vecVelocity")
	local velocity = math.floor(math.min(10000, math.sqrt(vx*vx + vy*vy) + 0.5))
	if ui.get(slow_walk) and ui.get(slow_walk2) then
        --slowwalk
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, 0)
        ui.set(yawbody, "180")
        ui.set(jyaw, "Offset")
        ui.set(jyawslide, math.random(0,60))
        ui.set(bodyyaw, "Jitter")
        ui.set(bodyyaw2, 0)
        ui.set(freestand_byaw, true)
        ui.set(fyawlimit, 60)
        state = "SLOWWALK"
    elseif flags == 263 and velocity < 250 then
        --crouch
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, 0)
        ui.set(yawbody, "180")
        ui.set(jyaw, "Random")
        ui.set(jyawslide, 7)
        ui.set(bodyyaw, "Static")
        ui.set(bodyyaw2, -95)
        ui.set(freestand_byaw, true)
        ui.set(fyawlimit, 60)
        state = "CROUCH"
    elseif flags == 256 or flags == 262 or velocity > 250 then
        --air
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, 0)
        ui.set(yawbody, "180")
        ui.set(jyaw, "Center")
        ui.set(jyawslide, 35)
        ui.set(bodyyaw, "Jitter")
        ui.set(bodyyaw2, 0)
        ui.set(freestand_byaw, true)
        ui.set(fyawlimit, 60)
        state = "AIR"
    elseif flags == 257 and velocity > 10 and velocity < 250 then
        --moving
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, 0)
        ui.set(yawbody, "180")
        ui.set(jyaw, "Center")
        ui.set(jyawslide, 60)
        ui.set(bodyyaw, "Jitter")
        ui.set(bodyyaw2, 0)
        ui.set(freestand_byaw, true)
        ui.set(fyawlimit, 60)
        state = "MOVING"
    else
        --stand
        ui.set(pitch, "Default")
        ui.set(yawbase, "At targets")
        ui.set(yaw, 0)
        ui.set(yawbody, "180")
        ui.set(jyaw, "Random")
        ui.set(jyawslide, 7)
        ui.set(bodyyaw, "Static")
        ui.set(bodyyaw2, -95)
        ui.set(freestand_byaw, true)
        ui.set(fyawlimit, 60)
        state = "STAND"
    end
end

--on_run_command
local function run_command()
	if ui.get(preset_choice) == "Gamesense AA" then
		ui.set_visible(yawbody, true)
	    ui.set_visible(yaw, true)
	    ui.set_visible(bodyyaw, true)
	    ui.set_visible(bodyyaw2, true)
	    ui.set_visible(edge, true)
	    ui.set_visible(jyaw, true)
	    ui.set_visible(jyawslide, true)
	    ui.set_visible(pitch, true)
	    ui.set_visible(yawbase, true)
	    ui.set_visible(freestanding, true)
	    ui.set_visible(freestanding2, true)
	    ui.set_visible(fyawlimit, true)
	    ui.set_visible(freestand_byaw, true)
    else
    	ui.set_visible(yawbody, false)
	    ui.set_visible(yaw, false)
	    ui.set_visible(bodyyaw, false)
	    ui.set_visible(bodyyaw2, false)
	    ui.set_visible(edge, true)
	    ui.set_visible(jyaw, false)
	    ui.set_visible(jyawslide, false)
	    ui.set_visible(pitch, false)
	    ui.set_visible(yawbase, false)
	    ui.set_visible(freestanding, true)
	    ui.set_visible(freestanding2, true)
	    ui.set_visible(fyawlimit, false)
	    ui.set_visible(freestand_byaw, false)
    end

    if ui.get(preset_choice) == "Acatel.us" then
    	acatel_us_aa()
    elseif ui.get(preset_choice) == "Prediction Crack" then
    	prediction_crack_aa()
    end
end

--callbacks
client.set_event_callback("run_command", run_command)