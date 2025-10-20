---@meta

-- Extra Natives
Susano = {}

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/extra-natives/createspoofedvehicle)
---
---Spawns a vehicle entity at coordinates with spoofed creation semantics.
---
---Example Usage:
---```lua
---local hash = GetHashKey("adder")
---RequestModel(hash)
---while not HasModelLoaded(hash) do 
---  Citizen.Wait(0) 
---end
---
---local veh = Susano.CreateSpoofedVehicle(hash, 215.0, -920.0, 30.0, 90.0, true, true, false)
---if veh ~= 0 then
---  print("Vehicle created:", veh)
---else
---  print("Create failed")
---end
---```
---@param modelHash integer
---@param x number
---@param y number
---@param z number
---@param heading number
---@param isNetwork boolean
---@param bScriptHostVeh boolean
---@param p7 boolean
---@return integer vehicle
function Susano.CreateSpoofedVehicle(modelHash, x, y, z, heading, isNetwork, bScriptHostVeh, p7) end


--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/extra-natives/createspoofedped)
---
---Creates a ped with spoofed creation semantics at the given position.
---
---Example Usage:
---```lua
---local mdl = GetHashKey("s_m_m_armoured_01")
---RequestModel(mdl)
---while not HasModelLoaded(mdl) do 
---  Citizen.Wait(0) 
---end
---
---local ped = Susano.CreateSpoofedPed(26, mdl, 215.0, -920.0, 30.0, 90.0, true, true)
---if ped ~= 0 then
---  print("Ped created:", ped)
---else
---  print("Create failed")
---end
---SetModelAsNoLongerNeeded(mdl)
---```
---
---@param pedType integer
---@param modelHash integer
---@param x number
---@param y number
---@param z number
---@param heading number
---@param isNetwork boolean
---@param bScriptHostVeh boolean
---@return integer ped
function Susano.CreateSpoofedPed(pedType, modelHash, x, y, z, heading, isNetwork, bScriptHostVeh) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/extra-natives/requestragdoll)
---
---Requests ragdoll on a target ped/entity.
---```lua
----- Ragdoll the player ped for demo
---local me = PlayerPedId()
---local guid = GetEntityGuid(me)
---Susano.RequestRagdoll(guid)
---```
---
---@param targetGuid integer
function Susano.RequestRagdoll(targetGuid) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/extra-natives/getallvehiclesmodel)
---
---```lua
---for i, v in ipairs(Susano.GetAllVehiclesModel()) do
---  print(string.format("0x%08X %s", v.hash, v.name))
---end
---```
---@return table models 
function Susano.GetAllVehiclesModel() end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/extra-natives/isplayerinvisible)
---
---```lua
---local me = PlayerId()
---if Susano.IsPlayerInvisible(me) then
---  print("You are invisible")
---else
---  print("You are visible")
---end
---```
---@param playerId integer
---@return boolean invisible  
function Susano.IsPlayerInvisible(playerId) end


--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/extra-natives/spoofped)
---
---```lua
----- Enable spoof as MP_M_Freemode
---local ok = Susano.SpoofPed(0x705E61F2, true)
---
----- Later: disable server spoof, keep current ped as-is
---local ok2 = Susano.SpoofPed(0, false)
---```
---
---@param pedHash number
---@param spoofServer boolean
---@return boolean success
function Susano.SpoofPed(pedHash, spoofServer) end


--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/beginframe)
---
---Start a new Lua render frame. Clears the build buffer for this tick.
---
function Susano.BeginFrame() end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/submitframe)
---
---Publish the current build buffer as the active frame to render on the Overlay.
---
function Susano.SubmitFrame() end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/resetframe)
---
---Clear all queued and displayed draw commands for the current Lua coroutine. Empties both build and render buffers and cancels any pending swap.
function Susano.ResetFrame() end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/resetallframes)
---
---Clear every coroutine’s build and render buffers. Removes all layers.
function Susano.ResetAllFrames() end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/drawline)
---
---Enqueue a line in the current build buffer.
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param r number
---@param g number
---@param b number
---@param a number|nil
---@param thickness number
function Susano.DrawLine(x1, y1, x2, y2, r, g, b, a, thickness) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/drawrect)
---
---Enqueue a rectangle in the current build buffer.
---
---@param x number
---@param y number
---@param w number
---@param h number
---@param r number
---@param g number
---@param b number
---@param a number|nil
---@param thickness number
function Susano.DrawRect(x, y, w, h, r, g, b, a, thickness) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/drawrectfilled)
---
---Enqueue a filled rectangle in the current build buffer.
---
---@param x number
---@param y number
---@param w number
---@param h number
---@param r number
---@param g number
---@param b number
---@param a number|nil
function Susano.DrawRectFilled(x, y, w, h, r, g, b, a) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/drawcircle)
---
---Enqueue a circle (filled or outline) in the current build buffer.
---
---@param x number
---@param y number
---@param radius number
---@param filled boolean
---@param r number
---@param g number
---@param b number
---@param a number|nil
---@param thickness number|nil
---@param segments integer|nil
function Susano.DrawCircle(x, y, radius, filled, r, g, b, a, thickness, segments) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/drawtext)
---
---Enqueue a text string in the current build buffer.
---
---@param x number
---@param y number
---@param text string
---@param size_px number
---@param r number
---@param g number
---@param b number
---@param a number|nil
function Susano.DrawText(x, y, text, size_px, r, g, b, a) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/gettextwidth)
---
---Measure the pixel width of a text string at a given font size.
---
---@param text string
---@param size_px number
---@return number width
function Susano.GetTextWidth(text, size_px) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/worldtoscreen)
---
---Project a 3D world position to 2D screen space.
---
---@param x number
---@param y number
---@param z number
---@return boolean ok
---@return number sx
---@return number sy
function Susano.WorldToScreen(x, y, z) end


--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/loadfont)
---
---Loads a font from a TTF/OTF file at the specified pixel size.
---
---@param path string
---@param size_px number
---@return number|nil fontId
---@return string|nil err
function Susano.LoadFont(path, size_px) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/loadfontfrombuffer)
---
---Loads a font from raw TTF/OTF bytes at the specified pixel size.
---
---@param data string
---@param size_px number
---@return number|nil fontId
---@return string|nil err
function Susano.LoadFontFromBuffer(data, size_px) end


--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/pushfont)
---
---Make a previously loaded font the current font for this coroutine.
---
---@param fontId number
function Susano.PushFont(fontId) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/popfont)
---
---Restore the previous font for this coroutine.
---
---@return boolean popped
function Susano.PopFont() end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/loadtexture)
---
---Load an image file into a DX11 texture.
---
---@param path string
---@return number width
---@return number height
---@return number textureId
function Susano.LoadTexture(path) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/loadtexturefrombuffer)
---
---Load a texture from raw image bytes.
---
---@param data string
---@return number width
---@return number height
---@return number textureId
function Susano.LoadTextureFromBuffer(data) end


--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/releasetexture)
---
---Free a previously loaded texture.
---
---@param texId number
---@return boolean ok
function Susano.ReleaseTexture(texId) end


--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/drawing-functions/drawimage)
---
---Draw a texture on screen with optional tint, rounding, and UVs.
---
---@param texId number
---@param x number
---@param y number
---@param w number
---@param h number
---@param r number|nil
---@param g number|nil
---@param b number|nil
---@param a number|nil
---@param rounding number|nil
---@param u0 number|nil
---@param v0 number|nil
---@param u1 number|nil
---@param v1 number|nil
function Susano.DrawImage(texId, x, y, w, h, r, g, b, a, rounding, u0, v0, u1, v1) end


--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/input-functions/getasynckeystate)
---
---Gets the raw key state using the Windows GetAsyncKeyState function.
---
---@param vk integer
---@return boolean down
---@return boolean pressed
function Susano.GetAsyncKeyState(vk) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/events/getallevent)
---
---Returns all discovered events with their source resource.
---
---@return table events
function Susano.GetAllEvent() end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/events/findevent)
---
---Search events by name with exact or substring matching.
---
---@param needle string
---@param exact boolean|nil
---@return table results
function Susano.FindEvent(needle, exact) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/events/ontriggerserverevent)
---
---Register a Lua callback to inspect and modify outbound server events.
---
---@param cb fun(name: string, payload: string): string|false|nil, string|nil
function Susano.OnTriggerServerEvent(cb) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/events/clearontriggerserverevent)
---
---Unregisters the previously registered OnTriggerServerEvent callback.
function Susano.ClearOnTriggerServerEvent() end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/http-request/httpget)
---
---Performs an HTTP GET request to the specified URL.
---
---@param url string
---@return number|nil status
---@return string|nil bodyOrErr
function Susano.HttpGet(url) end

--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/http-request/httppost)
---
---Performs an HTTP POST request to the specified URL with a raw payload.
---
---@param url string
---@param data string
---@return number|nil status
---@return string|nil bodyOrErr
function Susano.HttpPost(url, data) end


--- *`Susano`*\
---[Documentation](https://docs.susano.re/api-reference/extra-natives/copytoclipboard)
---
---Copy a string to the Windows clipboard as CF_TEXT (ANSI).
---
---@param text string
---@return boolean|nil ok
---@return string|nil err
function Susano.CopyToClipboard(text) end

