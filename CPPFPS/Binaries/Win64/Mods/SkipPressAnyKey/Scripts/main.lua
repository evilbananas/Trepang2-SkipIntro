LoopAsync(100, function()
    ExecuteInGameThread(function()
        local menuMap = FindFirstOf("FrontEndMenuMap_C")
        if not menuMap or not menuMap:IsValid() then return end

        local widget = FindFirstOf("UI_LoadingWidget_C")
        if not widget or not widget:IsValid() or widget.HasExited or not widget.MapLoadFinished then return end

        local gi = FindFirstOf("GameInstanceBP_C")
        if not gi or not gi:IsValid() then return end

        widget.HasExited = true
        widget:RemoveFromParent()
        gi:ExitLoadScreen()
    end)
    return false
end)
