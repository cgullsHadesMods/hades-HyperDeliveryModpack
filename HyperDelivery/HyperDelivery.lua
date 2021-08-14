ModUtil.RegisterMod("HyperDelivery")

HyperDelivery.BannerDisplayed = false

-- Scripts/RoomManager.lua : 1874
ModUtil.WrapBaseFunction("StartRoom", function ( baseFunc, ... )
    local text_config_table = DeepCopyTable(UIData.CurrentRunDepth.TextFormat)

    PrintUtil.createOverlayLine(
        "HD5 Text",
        "HYPER DELIVERY 5",
        MergeTables(
            text_config_table,
            {
                x_pos = 1905,
                y_pos = 115,
            }
        )
    )

    baseFunc(...)
end, HyperDelivery)

-- Scripts/UIScripts.lua : 145
ModUtil.WrapBaseFunction("ShowCombatUI", function ( baseFunc, ... )
    local text_config_table = DeepCopyTable(UIData.CurrentRunDepth.TextFormat)

    PrintUtil.createOverlayLine(
        "HD5 Text",
        "HYPER DELIVERY 5",
        MergeTables(
            text_config_table,
            {
                x_pos = 1905,
                y_pos = 115,
            }
        )
    )

    baseFunc(...)
end, HyperDelivery)

ModUtil.WrapBaseFunction("StartNewRun", function( baseFunc, ... )
    HyperDelivery.BannerDisplayed = false
    return baseFunc( ... )
end, HyperDelivery)

ModUtil.WrapBaseFunction("DisplayLocationText", function( baseFunc, eventSource, args)
    if (args.Text == "Location_Tartarus") and (not HyperDelivery.BannerDisplayed) then
        local funnytext = RandomChance(0.15)
        args.Text = "dragonsquad esports presents"
        if funnytext then
            args.Text = "soft pine flooring presents"
        end
        args.FontScale = 0.72
        baseFunc(eventSource, args)
        args.Text = "HYPER DELIVERY FIVE"
        if funnytext then
            args.Text = "TIMBO'S SECURITY DEPOSIT"
        end
        args.Delay = 0.6
        args.FontScale = 1.0
        baseFunc(eventSource, args)
        HyperDelivery.BannerDisplayed = true
        args.Text = "Location_Tartarus"
    else
        baseFunc(eventSource,args)
    end

end, HyperDelivery)