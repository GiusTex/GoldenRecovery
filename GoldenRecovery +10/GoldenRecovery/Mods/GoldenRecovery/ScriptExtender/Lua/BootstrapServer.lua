local function ReadConfig()
    local file = Ext.IO.LoadFile("GoldenRecovery.json");
    if file == nil then
        local default_config = {
            missing_gold = 0
        };
		Ext.IO.SaveFile("GoldenRecovery.json", Ext.Json.Stringify(default_config));
	    return ReadConfig();
    end

    local config = Ext.Json.Parse(file);
    if config["missing_gold"] == nil  then
		config["missing_gold"] = 0;
    end
    return config;

end


local function SaveConfig(config)
	Ext.IO.SaveFile("GoldenRecovery.json", Ext.Json.Stringify(config))
end


local config = ReadConfig();
local missing_gold = config["missing_gold"];

local gold_uuid = "1c3c9c74-34a1-4685-989e-410dc080be6f"
local tier_I_cost = 10
local tier_II_cost = 20
local tier_III_cost = 30
local tier_IV_cost = 40
local tier_V_cost = 50
local tier_VI_cost = 60
local tier_VII_cost = 70
local tier_VIII_cost = 80
local tier_IX_cost = 90

Ext.Osiris.RegisterListener("CastedSpell", 5, "after", function (caster, spell)
    
	-- Check available gold (gold_amount)
	local gold_amount = 0 --reset gold amount for each casting
	local players = Osi.DB_Players:Get(nil) -- Retrieve list of players and hirelings
	for _, player in pairs(players) do --check total gold in all character inventories
		local GUID = GetUUID(player[1])
		gold_amount = gold_amount + Osi.TemplateIsInInventory(gold_uuid, GUID)
	end

	-- Check and pay missing gold if possible
	if missing_gold > 0 and gold_amount >= missing_gold then
		Osi.AddGoldToMagicPockets(caster, -missing_gold)
		missing_gold = 0
		SaveConfig({ missing_gold = missing_gold })
	elseif missing_gold > 0 and gold_amount > 0 and gold_amount < missing_gold then
		missing_gold = missing_gold - gold_amount
		Osi.AddGoldToMagicPockets(caster, -gold_amount)
		SaveConfig({ missing_gold = missing_gold })
	end

    
	if spell == "A_Shout_Ring_Question" then
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

	if spell == "B_Shout_GoldenRecovery_1" and gold_amount >= tier_I_cost then
		Osi.AddGoldToMagicPockets(caster, -tier_I_cost)
	elseif spell == "B_Shout_GoldenRecovery_1" and gold_amount < tier_I_cost then
		missing_gold = missing_gold + tier_I_cost
		SaveConfig({ missing_gold = missing_gold })
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

	if spell == "C_Shout_GoldenRecovery_2" and gold_amount >= tier_II_cost then
		Osi.AddGoldToMagicPockets(caster, -tier_II_cost)
	elseif spell == "C_Shout_GoldenRecovery_2" and gold_amount < tier_II_cost then
		missing_gold = missing_gold + tier_II_cost
		SaveConfig({ missing_gold = missing_gold })
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

	if spell == "D_Shout_GoldenRecovery_3" and gold_amount >= tier_III_cost then
		Osi.AddGoldToMagicPockets(caster, -tier_III_cost)
	elseif spell == "D_Shout_GoldenRecovery_3" and gold_amount < tier_III_cost then
		missing_gold = missing_gold + tier_III_cost
		SaveConfig({ missing_gold = missing_gold })
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

	if spell == "E_Shout_GoldenRecovery_4" and gold_amount >= tier_IV_cost then
		Osi.AddGoldToMagicPockets(caster, -tier_IV_cost)
	elseif spell == "E_Shout_GoldenRecovery_4" and gold_amount < tier_IV_cost then
		missing_gold = missing_gold + tier_IV_cost
		SaveConfig({ missing_gold = missing_gold })
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

	if spell == "F_Shout_GoldenRecovery_5" and gold_amount >= tier_V_cost then
		Osi.AddGoldToMagicPockets(caster, -tier_V_cost)
	elseif spell == "F_Shout_GoldenRecovery_5" and gold_amount < tier_V_cost then
		missing_gold = missing_gold + tier_V_cost
		SaveConfig({ missing_gold = missing_gold })
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

	if spell == "G_Shout_GoldenRecovery_6" and gold_amount >= tier_VI_cost then
		Osi.AddGoldToMagicPockets(caster, -tier_VI_cost)
	elseif spell == "G_Shout_GoldenRecovery_6" and gold_amount < tier_VI_cost then
		missing_gold = missing_gold + tier_VI_cost
		SaveConfig({ missing_gold = missing_gold })
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

	if spell == "H_Shout_GoldenRecovery_7" and gold_amount >= tier_VII_cost then
		Osi.AddGoldToMagicPockets(caster, -tier_VII_cost)
	elseif spell == "H_Shout_GoldenRecovery_7" and gold_amount < tier_VII_cost then
		missing_gold = missing_gold + tier_VII_cost
		SaveConfig({ missing_gold = missing_gold })
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

	if spell == "I_Shout_GoldenRecovery_8" and gold_amount >= tier_VIII_cost then
		Osi.AddGoldToMagicPockets(caster, -tier_VIII_cost)
	elseif spell == "I_Shout_GoldenRecovery_8" and gold_amount < tier_VIII_cost then
		missing_gold = missing_gold + tier_VIII_cost
		SaveConfig({ missing_gold = missing_gold })
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

	if spell == "L_Shout_GoldenRecovery_9" and gold_amount >= tier_IX_cost then
		Osi.AddGoldToMagicPockets(caster, -tier_IX_cost)
	elseif spell == "L_Shout_GoldenRecovery_9" and gold_amount < tier_IX_cost then
		missing_gold = missing_gold + tier_IX_cost
		SaveConfig({ missing_gold = missing_gold })
		ShowNotification(caster, "You owe " .. missing_gold .. " coins to the ring.")
    end

end)