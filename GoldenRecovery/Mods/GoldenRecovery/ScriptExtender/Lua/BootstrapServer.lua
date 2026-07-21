local GOLD_UUID = "1c3c9c74-34a1-4685-989e-410dc080be6f"
local USE_PARTY_MONEY = MCM.Get("useWholePartyMoney")

local function GetOwnedGold(caster)
    -- Reset gold amount at each casting
	local gold_amount = 0 
	
    if USE_PARTY_MONEY then
        local players = Osi.DB_Players:Get(nil) -- Retrieve list of players and hirelings
    	for _, player in pairs(players) do --check total gold in all character inventories
	    	--local GUID = GetUUID(player[1])
            local GUID = player[1]
	    	gold_amount = gold_amount + Osi.TemplateIsInInventory(GOLD_UUID, GUID)
    	end
    else
        --local GUID = GetUUID(caster)
        local GUID = caster
        gold_amount = Osi.TemplateIsInInventory(GOLD_UUID, GUID)
    end
    return gold_amount
end

local G_R_Statuses = {
    RICH1 = true,
    RICH2 = true,
    RICH3 = true,
    RICH4 = true,
    RICH5 = true,
    RICH6 = true,
    RICH7 = true,
    RICH8 = true,
    RICH9 = true,
}
local SpellNamesAndCosts = {
    B_Shout_GoldenRecovery_1 = "GoldenRecovery1",
    C_Shout_GoldenRecovery_2 = "GoldenRecovery2",
    D_Shout_GoldenRecovery_3 = "GoldenRecovery3",
    E_Shout_GoldenRecovery_4 = "GoldenRecovery4",
    F_Shout_GoldenRecovery_5 = "GoldenRecovery5",
    G_Shout_GoldenRecovery_6 = "GoldenRecovery6",
    H_Shout_GoldenRecovery_7 = "GoldenRecovery7",
    I_Shout_GoldenRecovery_8 = "GoldenRecovery8",
    L_Shout_GoldenRecovery_9 = "GoldenRecovery9",
}

-- Scan caster and add/remove status(es) to cast or not GoldenRecovery(es)
local function UpdateRichStatus(caster)
    local current_gold = GetOwnedGold(caster)

    local highestLevel = 0

    -- Get highest available level
    for level = 1, 9 do
        local key = "GoldenRecovery" .. level
        local cost = MCM.Get(key) or 0

        if current_gold >= cost then
            highestLevel = level
        end
    end

    -- If no level is available, remove all statuses
    if highestLevel == 0 then
        for level = 1, 9 do
            local status = "RICH" .. level
            if Osi.HasActiveStatus(caster, status) == 1 then
                Osi.RemoveStatus(caster, status, "NULL_00000000-0000-0000-0000-000000000000")
            end
        end
        return
    end

    -- Apply highest status
    local targetStatus = "RICH" .. highestLevel
    if Osi.HasActiveStatus(caster, targetStatus) ~= 1 then
        Osi.ApplyStatus(caster, targetStatus, -1.0, 1)
    end

    -- Remove other statuses
    for level = 1, 9 do
        local status = "RICH" .. level
        if level ~= highestLevel and Osi.HasActiveStatus(caster, status) == 1 then
            Osi.RemoveStatus(caster, status, "NULL_00000000-0000-0000-0000-000000000000")
        end
    end
end

-- Change [1] with correct spells cost in localization files
Ext.Events.SessionLoaded:Subscribe(function()
    for spellName, McmKey in pairs(SpellNamesAndCosts) do
        local spellStats = Ext.Stats.Get(spellName)
        if spellStats then
            local cost = MCM.Get(McmKey)            
            spellStats.DescriptionParams = tostring(cost)
            Ext.Stats.Sync(spellName)
        end
    end
end)

Ext.Osiris.RegisterListener("CastedSpell", 5, "after", function(caster, spell)
    -- If not right spell
    if not SpellNamesAndCosts[spell] then
        return
    end
    
    local current_gold = GetOwnedGold(caster)
    local cost = MCM.Get(SpellNamesAndCosts[spell])
    -- If not enough gold
    if current_gold < cost then
        return
    end

    -- Remove gold
    if USE_PARTY_MONEY then
        Osi.AddGoldToMagicPockets(caster, -cost)
    else
        Osi.AddGold(caster, -cost)
    end

    -- Check if remained enough gold for next spell
    UpdateRichStatus(caster)
end)


-- Run UpdateRichStatus when an object enters a party member inventory
Ext.Osiris.RegisterListener("AddedTo", 3, "after", function(object, inventoryHolder, addType)
    if Osi.IsPartyMember(inventoryHolder, 0) == 1 then
        UpdateRichStatus(inventoryHolder)
    end
end)
-- Run UpdateRichStatus when an object exits a party member inventory
Ext.Osiris.RegisterListener("RemovedFrom", 2, "after", function(object, inventoryHolder)
    if Osi.IsPartyMember(inventoryHolder, 0) == 1 then
        UpdateRichStatus(inventoryHolder)
    end
end)