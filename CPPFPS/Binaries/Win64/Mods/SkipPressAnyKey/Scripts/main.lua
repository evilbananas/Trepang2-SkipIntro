local done = false
local hooked = false

local function skip(widget)
    if done or not widget or not widget:IsValid() or widget.HasExited then return end

    local menuMap = FindFirstOf("FrontEndMenuMap_C")
    local gi = FindFirstOf("GameInstanceBP_C")
    if not menuMap or not menuMap:IsValid() or not gi or not gi:IsValid() then return end

    done = true
    widget.HasExited = true
    widget:SetRenderOpacity(1.0) -- restore for later mission loading screens
    widget:RemoveFromParent()
    gi:ExitLoadScreen()
end

-- Keep the startup loading screen invisible so its "Press any key" prompt is never drawn
NotifyOnNewObject("/Script/UMG.UserWidget", function(obj)
    if not done and obj:GetClass():GetFName():ToString() == "UI_LoadingWidget_C" then
        obj.RenderOpacity = 0.0
    end
end)

-- The loading widget class is guaranteed to be loaded once a map's game state exists
RegisterInitGameStatePostHook(function()
    if done then return end

    if not hooked then
        hooked = pcall(RegisterHook, "/Game/UI/UI_LoadingWidget.UI_LoadingWidget_C:SetMapLoadFinished", function(ctx)
            skip(ctx:get())
        end)
    end

    -- Covers the case where the map finished loading before the game state was created
    local widget = FindFirstOf("UI_LoadingWidget_C")
    if widget and widget:IsValid() and widget.MapLoadFinished then skip(widget) end
end)
