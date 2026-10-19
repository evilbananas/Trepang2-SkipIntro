local hooked = false

-- The loading widget class is guaranteed to be loaded once a map's game state exists
RegisterInitGameStatePostHook(function()
    if hooked then return end
    hooked = pcall(RegisterHook, "/Game/UI/UI_LoadingWidget.UI_LoadingWidget_C:SetMapLoadFinished", function(ctx)
        local widget = ctx:get()
        local gi = FindFirstOf("GameInstanceBP_C")
        -- FindFirstOf returns an invalid object (not nil) when nothing is found
        if widget.HasExited or not FindFirstOf("FrontEndMenuMap_C"):IsValid() or not gi:IsValid() then return end

        widget.HasExited = true
        widget:RemoveFromParent()
        gi:ExitLoadScreen()
    end)
end)
