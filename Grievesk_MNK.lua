-- MNK LUA BY GRIEVESK
-- Based on MNK Lua 2.0 BY: JSHIDAKA url: http://pastebin.com/6ZcDwYXH
-- Multiple TP Sets "Normal" ,MidAcc , ACC, P/MDT, Hybrid
-- Multiple WS Sets, VS(Acc, Impetus, Impetus + ACC) SS(Normal, Acc) FH(Normal, Acc) Others WS
-- Impetus active, auto VS WS Gear depending on TP Set
-- Impetus Wear off, Remove Impetus Gear and back to "Normal"
-- MACROS FOR GEARSWAPS /console gs c >Command<
-- normal, Set TP Gear to "normal"
-- PDT, Set TP Gear tp PDT
-- MDT, Toogle gear to MDT and if in MDT will set you back to NORMAL
-- impetus, Set gear to Impetus Set
-- acc, set gear to Acc set, while In acc set, WS like VS, SS will use their acc set.
-- MACRO FOR AUTO BOOST /console gs c autoboost , Toogle it ON/OFF, on by default
 
 
 
function get_sets()  
include('generate_gearcollectorfile.lua')  
BoostdWS = S{"Final Heaven","Victory Smite","Shijin Spiral","Asuran Fists"}
windower.register_event('hpp change', hpp_change)
autoboost = 0  
autoboostnext = 0

	if player.sub_job == 'DNC' then
		send_command('input /macro book 3;wait .1;input /macro set 1')
	elseif player.sub_job == 'NIN' then
		send_command('input /macro book 4;wait .1;input /macro set 1')
	elseif player.sub_job == 'WAR' then
		send_command('input /macro book 1;wait .1;input /macro set 1')
	elseif player.sub_job == 'THF' then
		send_command('input /macro book 3;wait .1;input /macro set 1')
	elseif player.sub_job == 'RUN' then
		send_command('input /macro book 13;wait .1;input /macro set 1')
	else
		send_command('input /macro book 1;wait .1;input /macro set 1')
	end

               
--JA's Precast Sets
        sets.precast = {}
        sets.precast['Hundred Fists'] = {legs="Hes. Hose +1"} 
        sets.precast['Formless Strikes'] = {body="Hes. Cyclas"}
        sets.precast.Counterstance = {feet="Mel. gaiters +2"}  --{feet="Hes. Gaiters +1"}
        sets.precast.Dodge = {feet="Temple gaiters"} --{feet="Anchorite's Gaiters +1"}
        sets.precast.Boost = {hands="Anch. Gloves +1"}
        sets.precast.Mantra = {feet="Mel. gaiters +2"} --{feet="Hes. Gaiters +1"}
        sets.precast.Focus = {head="Anchorite's Crown"} --{head="Anchor. Crown +1"}
		sets.precast['Perfect Counter'] = {head="Tantra Crown +2"}
       
        sets.precast.Chakra = {
		ammo="Tantra tathlum", --ammo="Brigantia Pebble",
        head="Felistris Mask",
        body="Anchorite's cyclas", --body="Anch. Cyclas +1",
        hands="Hes. Gloves +1", 
        legs="Hes. Hose +1", 
        feet="Thurandaut boots", --feet="Thur. Boots +1",
        neck="Fortitude torque", --neck="Tjukurrpa Medal",
        waist="Caudata Belt",
        left_ear="Kemas Earring",
        right_ear="Soil Pearl",
        left_ring="Spiral Ring",
        right_ring="Terrasoul Ring",
        back="Iximulew Cape",} 
		
		sets.precast['Chi Blast'] = {
        head="Uk'uxkaj Cap",
        body="Qaaxo Harness",hands="Hes. Gloves +1",
        back="Tuilha Cape",legs="Hesychast's Hose",feet="Anchorite's Gaiters +1"}

-- Subjob JA Sets
		sets.precast.FastCast = {ear1="Loquac. earring"}
		sets.precast.Utsusemi = {ear1="Loquac. earring",neck="Magoraga Beads",legs="Wukong's Haka. +1"}
		sets.precast.Waltz = set_combine(sets.precast.Chakra, {ammo="Sonia's plectrum",head="Anwig salade", })
 
        sets.weapon = {main="Verethragna"}
 
--VS Base Set
        sets.precast.VSDD={
		ammo="Tantra Tathlum",
        head="Uk'uxkaj Cap",
        body="Mekosu. Harness", -- -> Dread
        hands="Anch. Gloves +1",
        legs="Hes. Hose +1",
		feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
        neck="Light gorget", --Justiciar's Torque
        waist="Caudata Belt",
        left_ear="Brutal Earring",
        right_ear="Moonshade Earring",
        left_ring="Epona's Ring",
        right_ring="Rajas Ring",
        back="Rancorous Mantle", }
       
--VS Impetus Set
sets.precast.VSImpetus = set_combine(sets.precast.VSDD, {
    body="Tantra Cyclas +2",
    back="Rancorous Mantle",
})
--VS Mid-Accuracy Base Set
        sets.precast.VSMACC={
		ammo="Honed Tathlum",
        head="Uk'uxkaj Cap",
        body="Mekosu. Harness",
        hands="Anch. Gloves +1",
        legs="Hes. Hose +1",
		feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
        neck="Light Gorget",
        waist="Caudata belt",
        left_ear="Brutal Earring",
        right_ear="Moonshade Earring",
        left_ring="Epona's Ring",
        right_ring="Rajas Ring",
        back="Letalis Mantle",}
       
--VS Mid-Accuracy + Impetus Set
        sets.precast.VSImpmacc = set_combine(sets.precast.VSMACC, {
    body="Tantra Cyclas +2",
})
--VS Accuracy Base Set
        sets.precast.VSACC={
		ammo="Honed Tathlum",
        head="Whirlpool Mask",
        body="Mekosu. Harness",
        hands="Hes. Gloves +1",
        legs="Wukong's Haka. +1",
		feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
        neck="Light Gorget",
        waist="Caudata belt",
        left_ear="Moonshade Earring",
		right_ear="Steelflash Earring",
        left_ring="Candent Ring",
        right_ring="Rajas Ring",
        back="Anchoret's Mantle",}
       
--VS Accuracy + Impetus Set
        sets.precast.VSImpacc = set_combine(sets.precast.VSACC, {
    body="Tantra Cyclas +2",
})
--Default Set for VS    
        sets.precast['Victory Smite'] = sets.precast.VSDD
--SS Base set
        sets.precast.SSDD={
		ammo="Thew bomblet",
        head="Whirlpool Mask",
        body="Mekosu. Harness",
        hands="Hes. Gloves +1", 
        legs="Hes. Hose +1",
		feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
        neck="Light gorget", --Asperity Necklace
        waist="Wanion Belt", --Windbuffet Belt
        left_ear="Bladeborn Earring",
        right_ear="Steelflash Earring",
        left_ring="Epona's Ring",
        right_ring="Rajas Ring",
        back="Atheling Mantle",}
       
--SS Accuracy Set
        sets.precast.SSACC= set_combine(sets.precast.SSDD, {
		ammo="Honed Tathlum",
        body="Mekosu. Harness",
        hands="Hes. Gloves +1",
        neck="Light Gorget",
        --waist="Light Belt",
        back="Anchoret's Mantle",})
       
--Default Set for SS
        sets.precast['Shijin Spiral']= sets.precast.SSDD
       
-- FH Base Set
        sets.precast.FHDD ={
        ammo="Tantra Tathlum",
        head="Whirlpool Mask",
        body="Mekosu. Harness",
        hands="Anch. Gloves +1",
        legs="Nahtirah Trousers",
        feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
        neck="Iqabi Necklace",
        waist="Windbuffet Belt",
        left_ear="Brutal Earring",
        right_ear="Kemas Earring",    
        left_ring="Epona's Ring",
        right_ring="Terrasoul Ring",
        back="Anchoret's Mantle",}
       
-- FH Accuracy set
        sets.precast.FHACC = set_combine(sets.precast.FHDD, {
        ammo="Tantra Tathlum",
        hands="Hes. Gloves +1",
        legs="Kaabnax Trousers",
        feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
        neck="Light Gorget",
        waist="Light Belt",})
       
-- Default set for FH
        sets.precast['Final Heaven'] = sets.precast.FHDD
       
-- Others WS Set       
        sets.precast.WS = {    
        ammo="Tantra Tathlum",
        head="Whirlpool Mask",
        body="Mekosu. Harness",
        hands="Hes. Gloves +1",
        legs="Hes. Hose +1",
		feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
        neck="Faith Torque",
        waist="Caudata Belt",
        left_ear="Brutal Earring",
		right_ear="Moonshade Earring",
        left_ring="Epona's Ring",
        right_ring="Rajas Ring",
        back="Letalis Mantle",}
       
--TP sets
        sets.TP = {}
       
--TP DD sets   
        sets.TP.DD = {
        ammo="Hagneia Stone",
        head="Felistris Mask",
        body="Thaumas Coat",
        hands="Hes. Gloves +1 ",
        legs="Hes. Hose +1", 
		feet={ name="Qaaxo Leggings", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2',}},
        neck="Asperity Necklace",
        waist="Windbuffet Belt",
        left_ear="Bladeborn Earring",
        right_ear="Steelflash Earring",
		left_ring="Epona's Ring",
        right_ring="Rajas Ring",
        back="Atheling Mantle",}
		
--TP MidAcc sets  
        sets.TP.MidAcc = set_combine(sets.TP.DD, {
		ammo="Hagneia Stone",
		head="Whirlpool Mask",
		body="Qaaxo Harness",
        hands="Hes. Gloves +1",
        legs="Hes. Hose +1",
		feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
		left_ring="Epona's Ring",
        right_ring="Rajas Ring",
        back="Letalis Mantle",})
       
--TP Acc sets  
        sets.TP.Acc = set_combine(sets.TP.DD, {
		ammo="Honed Tathlum",
		head="Whirlpool Mask",
        body="Mekosu. Harness",
        hands="Hes. Gloves +1",
        legs="Wukong's Haka. +1",
		feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
		neck="Iqabi Necklace",
		waist="Anguinus Belt", 
        left_ring="Candent Ring",
		right_ring="Rajas Ring",
        back="Anchoret's Mantle",})
--TP Counterstance
        sets.TP.cc = set_combine(sets.TP.DD, {
    feet="Hes. Gaiters"})
--TP Hybrid Acc/PDT sets       
        sets.TP.Hybrid= set_combine(sets.TP.Acc, {
        head="Uk'uxkaj Cap",
        body="Qaaxo Harness",
        hands="Otronif Gloves +1",
        legs="Quiahuiz Trousers",
        feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
		neck="Twilight Torque",
        left_ear="Bladeborn Earring",
        right_ear="Steelflash Earring",
        right_ring="Defending Ring",
        back="Mollusca Mantle",})
       
--TP Impetus sets      
        sets.TP.Impetus=set_combine(sets.TP.DD, {
		--ammo="Honed Tathlum",
		head="Whirlpool Mask",
        body="Tantra Cyclas +2",
		hands="Hes. Gloves +1",
        waist="Cetl belt",
        back="Letalis Mantle",})
       
--PDT/MDT Sets
        sets.PDT ={
		ammo="Brigantia Pebble",
        head="Uk'uxkaj Cap",
        body="Qaaxo Harness",
        hands="Otronif Gloves +1",
        legs="Quiahuiz Trousers",
		feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
        neck="Twilight Torque",
        waist="Black Belt",
        left_ear="Bladeborn Earring",
        right_ear="Steelflash Earring",
		left_ring="Dark Ring",
        right_ring="Defending Ring",
        back="Mollusca Mantle",}
       
--PDT/MDT Sets
        sets.MDT = set_combine(sets.PDT, {body="Avalon Breastplate",})
 
--Aftercast Rule/Idle Set      
        sets.aftercast = {}
        sets.aftercast.TP = sets.TP.DD
 
        sets.aftercast.Idle = {    
        ammo="Tantra Tathlum",
        head="Whirlpool Mask",
        body="Hes. Cyclas",
        hands="Hes. Gloves +1",
		legs="Quiahuiz Trousers",
        feet="Hermes' Sandals",
        neck="Twilight Torque",
        waist="Black Belt",
		left_ear="Bladeborn Earring",
        right_ear="Steelflash Earring",
        left_ring="Rajas Ring",
        right_ring="Sheltered Ring",    
        back="Iximulew Cape",}
		
--Resting Set
		sets.resting = set_combine(sets.aftercast.Idle, {
		head="Ocelomeh headpiece",
		body="Hes. cyclas",
		hands="Hes. Gloves +1",
		legs="Hes. Hose +1",
		feet={ name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}},
		back="Mollusca mantle",
		right_ring="Sheltered ring",})
       
end
 
function sub_job_change(new,old)
	if player.sub_job == 'DNC' then
		send_command('input /macro book 3;wait .1;input /macro set 1')
	elseif player.sub_job == 'NIN' then
		send_command('input /macro book 4;wait .1;input /macro set 1')
	elseif player.sub_job == 'WAR' then
		send_command('input /macro book 1;wait .1;input /macro set 1')
	elseif player.sub_job == 'THF' then
		send_command('input /macro book 3;wait .1;input /macro set 1')
	elseif player.sub_job == 'RUN' then
		send_command('input /macro book 13;wait .1;input /macro set 1')
	else
		send_command('input /macro book 1;wait .1;input /macro set 1')
	end
end
 
--Cancel Action/Swap for JA that cannot be executed
 function pretarget(spell)
     if spell.name ~= 'Ranged' and spell.type ~= 'WeaponSkill' then
        if spell.action_type == 'Ability' then
            if spell and (windower.ffxi.get_ability_recasts()[spell.recast_id] >= 1) then
                cancel_spell()
				add_to_chat(123,'>>>> Abort: Ability waiting on recast.')
                return
            end
        elseif spell.action_type == 'Magic' then
            if spell and (windower.ffxi.get_spell_recasts()[spell.recast_id] >= 1) then
                cancel_spell()
				add_to_chat(123,'>>>> Abort: Spell waiting on recast.')
                return
            end
        end
    end
	if spell.type == 'WeaponSkill' then
		if player.status ~= 'Engaged' or buffactive.amnesia or spell.target.distance > 5.5 or player.tp < 100 then
			cancel_spell()
			return
		end
	end
	if buffactive.sleep == 1 or buffactive.terror == 1 or buffactive.petrification == 1 or buffactive.stun == 1 then
		if spell.action_type == 'Ability' then
			add_to_chat(123,'>>>> Abort: You Are Sleep-Terror-Petrified-Stun.')
			cancel_spell()
			return
		end
	end
end


function precast(spell,action)
		if spell.english == 'Spectral Jig' then
			send_command('cancel 71;')
		elseif string.find(spell.english,'Waltz') then
			equip(sets.precast.Waltz)
		elseif string.find(spell.english,'Utsusemi') then
			equip(sets.precast.Utsusemi)
		elseif spell.english == 'spell.name' then
			equip(sets.precast.spell.name)
			add_to_chat(100,'>>>> '..spell.name)
		end

--Auto Boost on Certain WS
        if BoostdWS:contains(spell.name) and windower.ffxi.get_ability_recasts()[16] < 1 and not buffactive['Hundred Fists'] and not buffactive.amnesia and spell.target.distance < 5.5 and player.tp > 99 and autoboost == 1 and autoboostnext == 0 then
                cancel_spell()
                autoboostnext = 1
        abws = spell.name
                send_command('input /ja "Boost" <me>;')
                add_to_chat(100,'>>>> '..spell.name)
                return
        end
 
        if sets.precast[spell.english] then
				if buffactive['Impetus'] then
                        if sets.aftercast.TP == sets.TP.Acc then
                                sets.precast['Victory Smite'] = sets.precast.VSImpacc
                        else           
                                if sets.aftercast.TP == sets.TP.DD then
                                        sets.precast['Victory Smite'] = sets.precast.VSImpetus
                                end
                        end
                end
                        equip(sets.precast[spell.english])
        elseif spell.type=="WeaponSkill" then
                equip(sets.precast.WS)
        end
end
 
function midcast(spell,action)
	if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
		send_command('@wait 3.3; cancel 66; cancel 444; cancel 445')
	elseif spell.english == 'Monomi: Ichi' and buffactive['Sneak'] then
		send_command('@wait 1.0; cancel 71')
	end
end
 
function aftercast(spell,action)
        if spell.name == null then
                        return -- Cancel Aftercast for outofrange/unable to see.
        end    
 
        if player.status == 'Engaged' then
                if spell.name == 'Boost' and autoboost == 1 then
                        return -- Cancel aftercast for boost, coz it was overlapping with the precast of the ws when used all in a macro.
                else
                        equip(sets.aftercast.TP)
                end
        else
                if sets.aftercast.TP == sets.PDT or sets.aftercast.TP == sets.MDT then
                        equip(sets.aftercast.TP)
                else
                        equip(sets.aftercast.Idle)
                end
        end
end
 
function status_change(new,old)
        if new == 'Engaged' then
                equip(sets.aftercast.TP)
                autoboostnext = 0
        elseif new == 'Resting' then
				equip(sets.resting)
		else
                if sets.aftercast.TP == sets.PDT then
                        equip(sets.aftercast.TP)
                        autoboostnext = 0
                elseif sets.aftercast.TP == sets.MDT then
                        equip(sets.aftercast.TP)
                        autoboostnext = 0
                else
                        equip(sets.aftercast.Idle)
                        autoboostnext = 0
                end
        end
end
 
function buff_change(status,gain_or_loss)
	if status == "Physical Shield" and player.status == "Engaged" then
                if gain_or_loss then
						add_to_chat(100,'>>>> Fanatic On')
				else
					send_command([[input /item "Fanatic's Drink" <me>;]])
						add_to_chat(12,'>>>> Fanatic Off')
                end
    end
	if status == "Negate Amnesia" and player.status == "Engaged" then
                if gain_or_loss then
						add_to_chat(100,'>>>> Amnesia Screen On')
				else
					send_command([[input /item "Phial of amnesia screen" <me>;]])
						add_to_chat(12,'>>>> Amnesia Screen Off')
                end
    end
	if status == "Potency" and player.status == "Engaged" then
                if gain_or_loss then
						add_to_chat(100,'>>>> Champion Tonic On')
				else
					send_command([[input /item "Champion's Tonic" <me>;]])
						add_to_chat(12,'>>>> Champion Tonic Off')
                end
    end
	if status == "Regain" and player.status == "Engaged" then
                if gain_or_loss then
						add_to_chat(100,'>>>> Monarch Drink On')
				else
					send_command([[input /item "Monarch's Drink" <me>;]])
						add_to_chat(12,'>>>> Monarch Drink Off')
                end
    end
	if status == "Accuracy Bonus" and player.status == "Engaged" then
                if gain_or_loss then
						add_to_chat(100,'>>>> Stalwart Tonic On')
				else
					send_command([[input /item "Stalwart's Tonic" <me>;]])
						add_to_chat(12,'>>>> Stalwart Tonic Off')
                end
    end
	if status == "Max HP Down" and player.max_hp < tonumber(1150) then
        if gain_or_loss then
			equip(sets.PDT)
			add_to_chat(123,'>>>> Equip PDT Set.')
		else
			equip(sets.aftercast.TP)
			add_to_chat(123,'>>>> Equip DD Set.')
		end
	end
	if status == "stun" then
        if gain_or_loss then
			equip(sets.PDT)
			add_to_chat(123,'>>>> Equip PDT Set.')
		else
			equip(sets.aftercast.TP)
			add_to_chat(123,'>>>> Equip DD Set.')
		end
    end
	if status == "sleep" then
        if gain_or_loss then
			equip(sets.PDT)
			add_to_chat(123,'>>>> Equip PDT Set.')
		else
			equip(sets.aftercast.TP)
			add_to_chat(123,'>>>> Equip DD Set.')
		end
	end
    if status == "terror" then
        if gain_or_loss then
			equip(sets.PDT)
			add_to_chat(123,'>>>> Equip PDT Set.')
		else
			equip(sets.aftercast.TP)
			add_to_chat(123,'>>>> Equip DD Set.')
		end
	end
    if status == "petrification" then
        if gain_or_loss then
			equip(sets.PDT)
			add_to_chat(123,'>>>> Equip PDT Set.')
		else
			equip(sets.aftercast.TP)
			add_to_chat(123,'>>>> Equip DD Set.')
		end
    end
 
	if status == "Boost" and autoboostnext == 1 then
                if gain_or_loss then
                        send_command('input /ws "'..abws..'" <t>;')
                else
                        autoboostnext = 0
                end
    end
	
	if status == "Warcry" and autoboost == 1 then
		if gain_or_loss then
			autoboost = 0
			add_to_chat(123,'>>>> WarCry: AutoBoost Off.')
		else
			autoboost = 1
			add_to_chat(123,'>>>> WarCry: AutoBoost On.')
		end
	end
 
    if status == "Impetus" then
        if gain_or_loss then
            if sets.aftercast.TP == sets.TP.Acc then
                                sets.precast['Victory Smite'] = sets.precast.VSImpacc
                                send_command('@input /echo Victory Smite WS Set = ImpAcc ')
                        else
                                if sets.aftercast.TP == sets.MDT or sets.aftercast.TP == sets.PDT then
                                        sets.precast['Victory Smite'] = sets.precast.VSImpetus
                                        send_command('@input /echo Victory Smite WS Set = P/MDT - VSImpetus ')
								elseif sets.aftercast.TP == sets.TP.MidAcc then
										sets.precast['Victory Smite'] = sets.precast.VSImpmacc
										send_command('@input /echo Victory Smite WS Set = ImpMidAcc ')
                                else
                                        equip(sets.TP.Impetus)
                                        sets.aftercast.TP = sets.TP.Impetus                    
                                        sets.precast['Victory Smite'] = sets.precast.VSImpetus
                                        send_command('@input /echo Victory Smite WS Set = VSImpetus ') 
                                end
                        end
        else
            if sets.aftercast.TP == sets.TP.Acc then
                                sets.precast['Victory Smite'] = sets.precast.VSACC
                                send_command('@input /echo Victory Smite WS Set = Acc ')
                        else
                                if sets.aftercast.TP == sets.MDT then
                                        equip(sets.MDT)
                                        sets.precast['Victory Smite'] = sets.precast.VSDD
                                        send_command('@input /echo Victory Smite WS Set = Normal -- MDT SET ON')       
                                elseif sets.aftercast.TP == sets.PDT then
                                        equip(sets.PDT)
                                        sets.precast['Victory Smite'] = sets.precast.VSDD
                                        send_command('@input /echo Victory Smite WS Set = Normal -- PDT SET ON')  
								elseif sets.aftercast.TP == sets.TP.MidAcc then
                                        equip(sets.TP.MidAcc)
                                        sets.precast['Victory Smite'] = sets.precast.VSMACC
                                        send_command('@input /echo Victory Smite WS Set = Accuracy -- MidAcc SET ON')
                                elseif player.status == 'Engaged' then
                                        equip(sets.TP.DD)
                                        sets.aftercast.TP = sets.TP.DD
                                        sets.precast['Victory Smite'] = sets.precast.VSDD
                                        send_command('@input /echo Victory Smite WS Set = Normal ')
								else
                                        sets.aftercast.TP = sets.TP.DD
                                        sets.precast['Victory Smite'] = sets.precast.VSDD
                                        send_command('@input /echo Victory Smite WS Set = Normal ')                    
                                end
                        end
                end
    end
end

function hpp_change(new_hpp, old_hpp)
	if new_hpp < 35 then
		equip(sets.PDT)
		add_to_chat(100, 'HP Low - Equip PDT Sets')
	elseif new_hpp > 45 and old_hpp < 44 and player.status == 'Engaged' then
		equip(sets.aftercast.TP)
		add_to_chat(100, 'HP Normal - Equip TP Sets')
	end
end

-- SE Macros /console gs c "command" [case sensitive]

function self_command(command)
                if command == 'normal' then
                        if player.status == 'Engaged' then     
                                equip(sets.TP.DD)
                                sets.aftercast.TP = sets.TP.DD
                                sets.precast['Victory Smite'] = sets.precast.VSDD
                                sets.precast['Shijin Spiral'] = sets.precast.SSDD
                                add_to_chat(100, 'Normal TP Set')
                        else
                                equip(sets.aftercast.Idle)
                                sets.aftercast.TP = sets.TP.DD
                                sets.precast['Victory Smite'] = sets.precast.VSDD
                                sets.precast['Shijin Spiral'] = sets.precast.SSDD
                                add_to_chat(100, 'Normal TP - Idle Set')
                        end
                elseif command == 'acc' then
                                equip(sets.TP.Acc)
                                sets.aftercast.TP = sets.TP.Acc
                                sets.precast['Victory Smite'] = sets.precast.VSACC
                                sets.precast['Shijin Spiral'] = sets.precast.SSACC
                                add_to_chat(100, 'Accuracy Set')
				elseif command == 'midacc' then
                                equip(sets.TP.MidAcc)
                                sets.aftercast.TP = sets.TP.MidAcc
                                sets.precast['Victory Smite'] = sets.precast.VSMACC
                                sets.precast['Shijin Spiral'] = sets.precast.SSACC
                                add_to_chat(100, 'Mid-Accuracy Set')
                elseif command == 'hybrid' then
                                equip(sets.TP.Hybrid)
                                sets.aftercast.TP = sets.TP.Hybrid
                                sets.precast['Victory Smite'] = sets.precast.VSACC
                                sets.precast['Shijin Spiral'] = sets.precast.SSACC
                                add_to_chat(100, 'Acc-DT Set')
                elseif command == 'impetus' then
                                equip(sets.TP.Impetus)
                                sets.aftercast.TP = sets.TP.Impetus
                                sets.precast['Victory Smite'] = sets.precast.VSImpetus
                                sets.precast['Shijin Spiral'] = sets.precast.SSDD
                                add_to_chat(100, 'Impetus TP Set')
                elseif command == 'cc' then
                        equip(sets.TP.cc)
                        sets.aftercast.TP = sets.TP.cc
                                add_to_chat(100, 'Counterstance Set')
                elseif command == 'PDT' then
                        equip(sets.PDT)
                        sets.aftercast.TP = sets.PDT
                                add_to_chat(100, 'PDT Set')
                elseif command == 'MDT' then
                        if sets.aftercast.TP == sets.MDT then
                                if player.status == 'Engaged' then     
                                        equip(sets.TP.DD)
                                        sets.aftercast.TP = sets.TP.DD
                                        sets.precast['Victory Smite'] = sets.precast.VSDD
                                        sets.precast['Shijin Spiral'] = sets.precast.SSDD
                                        add_to_chat(100, 'Normal TP Set')
                                else
                                        equip(sets.aftercast.Idle)
                                        sets.aftercast.TP = sets.TP.DD
                                        sets.precast['Victory Smite'] = sets.precast.VSDD
                                        sets.precast['Shijin Spiral'] = sets.precast.SSDD
                                        add_to_chat(100, 'Normal TP Set + idle')
                                end
                        else
                                equip(sets.MDT)
                                sets.aftercast.TP = sets.MDT
                                add_to_chat(100, 'MDT Set')
                        end
                elseif command == 'AutoBoost' then
                        if autoboost == 1 then
                                autoboost = 0
                                add_to_chat(100, 'Auto Boost Before WS = OFF')
                        else
                                autoboost = 1
                                add_to_chat(100, 'Auto Boost Before WS = ON')
                        end
				elseif command == 'gearcollector' then 
						set_gearcollector(sets) 

        end
	end

