-- Tables of Data
toau_zones = S{"Leujaoam Sanctum","Mamool Ja Training Grounds","Lebros Cavern","Periqia","Ilrusi Atoll",
        "Nyzul Isle","Bhaflau Remnants","Arrapago Remnants","Silver Sea Remnants","Zhayolm Remnants"}

abyssea_zones = S{"Abyssea - Konschtat","Abyssea - La Theine","Abyssea - Tahrongi","Abyssea - Attohwa",
		"Abyssea - Misareaux","Abyssea - Vunkerl","Abyssea - Altepa","Abyssea - Grauberg",
		"Abyssea - Uleguerand","Abyssea - Empyreal Paradox"}

strength_ws = S{}
AccSetStatus = 0
MeikyoStatus = 0


-- Functions
-- Gear Sets go here
function get_sets()	
include('generate_gearcollectorfile.lua')	
windower.register_event('hpp change', hpp_change)		
	sets.precast = {}
-- JA Sets
	sets.precast['Seigan'] = {head="Unkai Kabuto +1"}
	sets.precast['Meditate'] = {head="Myochin Kabuto +1",hands="Sakonji Kote",back="Takaha Mantle"}
	sets.precast['Hasso'] = {legs="Unkai Haidate +2"}
	sets.precast['Sekkanoki'] = {hands="Unkai Kote +2"}
	sets.precast['Shikikoyo'] = {legs="Sao. Haidate"}
	sets.precast['Third eye'] = {legs="Sao. Haidate"}
	sets.precast['Sengikori'] = {feet="Unkai Sune-Ate +2"} 
	sets.precast['Meikyo Shisui'] = {feet="Sakonji Sune-Ate"}
	sets.precast['Hamanoha'] = {}
	sets.precast['Hagakure'] = {}
	sets.precast['Konzen-ittai'] = {}
	

-- Subjob JA Sets
	sets.precast.FastCast = {ear1="Loquac. earring"}
	sets.precast.Waltz = {head="Yaoyotl helm",neck="Apathy gorget",body="Cizin mail",hands="Cizin mufflers",
                ring2="Dark Ring",back="Shadow Mantle",legs="Cizin Breeches"}
-- WS Sets
	sets.WS = {}
	sets.precast.WS = {}
	sets.precast.Str_Ws = {head="Otomi helm",body="Phorcys Korazin",hands="Cizin mufflers",back="Buquwik Cape",
		legs="Scuff. Cosciales",feet="Mikinaak Greaves"}
	sets.precast.WS.normal = {range="Cibitshavore",head="Otomi Helm",neck="Light Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Phorcys Korazin",hands="Miki. Gauntlets",ring1="Candent Ring",ring2="Rajas Ring",
		back="Buquwik Cape",waist="Metalsinger Belt",legs="Scuff. Cosciales",feet="Ejekamal boots"}
	sets.precast.WS.acc = {range="Cibitshavore",head="Yaoyotl Helm",neck="Light Gorget",ear1="Zennaroi Earring",ear2="Moonshade Earring",
		body="Phorcys Korazin",hands="Miki. Gauntlets",ring1="Candent Ring",ring2="Rajas Ring",
		back="Takaha Mantle",waist="Metalsinger Belt",legs="Wukong's Haka. +1",feet="Ejekamal boots"}
	

-- TP Sets
	sets.TP = {}
	sets.TP.Tsurumaru = {}
	sets.TP.Tsurumaru.Normal = {main="Tsurumaru",sub="Pole Grip",range="Cibitshavore",
				head="Otomi Helm",neck="Ganesha's Mala",ear1="Steelflash Earring",ear2="Bladeborn Earring",
                body="Sakonji domaru",hands="Otronif Gloves +1",ring1="K'ayres ring",ring2="Rajas Ring",
                back="Takaha Mantle",waist="Cetl Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}
	sets.TP.Tsurumaru.High = {main="Tsurumaru",sub="Pole Grip",range="Cibitshavore",
				head="Yaoyotl Helm",neck="Iqabi Necklace",ear1="Steelflash Earring",ear2="Zennaroi Earring",
				body="Sakonji domaru",hands="Otronif Gloves +1",ring1="K'ayres ring",ring2="Rajas Ring",
				back="Takaha mantle",waist="Anguinus Belt",legs="Wukong's Haka. +1",feet="Whirlpool Greaves"}
	sets.TP.Tsurumaru.Ionis = {main="Tsurumaru",sub="Pole Grip",range="Cibitshavore",
				head="Otomi Helm",neck="Ganesha's Mala",ear1="Steelflash Earring",ear2="Bladeborn Earring",
                body="Sakonji domaru",hands="Otronif Gloves +1",ring1="K'ayres ring",ring2="Rajas Ring",
                back="Takaha Mantle",waist="Cetl Belt",legs="Unkai Haidate +2",feet="Ejekamal boots"}
	sets.TP.DD = {}
	sets.TP.Hybrid = {}
	sets.TP.Ranged = {}
	sets.TP.Engaged = {}
-- Special Sets
	sets.DT = {neck="Twilight Torque",hands="",ring1="Dark Ring",ring2="Dark Ring",waist="Flume Belt",
		 back="Shadow Mantle"}
	sets.Twilight = {head="Twilight helm",body="Twilight mail"}
-- Aftercast/Idle Sets
	sets.aftercast = {}
	sets.aftercast.TP = sets.TP.Engaged
	sets.aftercast.Idle = {main="Tsurumaru",sub="Pole Grip",range="Cibitshavore",
		head="Twilight helm",neck="Twilight Torque", ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Twilight mail",hands="Wakido Kote +1",ring1="Dark Ring",ring2="Rajas Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Scuff. Cosciales",feet="Danzo Sune-Ate"}
end

--Cancel Action/Swap for JA that cannot be executed
 function pretarget(spell)
     if spell.name ~= 'Ranged' and spell.type ~= 'WeaponSkill' then
        if spell.action_type == 'Ability' then
            if spell and (windower.ffxi.get_ability_recasts()[spell.recast_id] >= 1) then
                cancel_spell()
                return
            end
        elseif spell.action_type == 'Magic' then
            if spell and (windower.ffxi.get_spell_recasts()[spell.recast_id] >= 1) then
                cancel_spell()
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

-- Precast/Midcast/Aftercast Functions
function precast(spell,action)
	if spell.english == 'Spectral Jig' then
		send_command('cancel 71;')
	end
	if spell.type=="WeaponSkill" then
		if AccSetStatus == 1 then
				if MeikyoStatus == 1 then
					equip(set_combine(sets.precast.WS.acc,sets.precast['Meikyo Shisui']))
				else
					equip(sets.precast.WS.acc)
				end
		elseif MeikyoStatus == 1 then
					equip(set_combine(sets.precast.WS.normal,sets.precast['Meikyo Shisui']))
		else
			equip(sets.precast.WS.normal)
		end	
	elseif string.find(spell.english,'Waltz') then
		equip(sets.precast.Waltz)
	elseif spell.type == "Ninjutsu" then
		equip(sets.precast.FastCast)
	elseif sets.precast[spell.english] then
		equip(sets.precast[spell.english])
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
	if player.status =='Engaged' then
		equip(sets.aftercast.TP)
	else
		equip(sets.aftercast.Idle)
	end
end

-- Status change (spells, songs, etc.)
function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.aftercast.Idle)
	elseif new == 'Engaged' then
			if AccSetStatus == 1 then
				sets.TP.DD = sets.TP.Tsurumaru.High
			elseif buffactive['Ionis'] then
				sets.TP.DD = sets.TP.Tsurumaru.Ionis
			else
				sets.TP.DD = sets.TP.Tsurumaru.Normal
			end	

		sets.TP.Engaged = sets.TP.DD
		
		if buffactive['Weakness'] or buffactive['Doom'] then
			sets.aftercast.TP = set_combine(sets.TP.Engaged,sets.Twilight)
		else
			sets.aftercast.TP = sets.TP.Engaged
		end
 		equip(sets.aftercast.TP)
	end
end

function buff_change(status,gain_or_loss)
	if status == "Hasso" and player.status == "Engaged" then
                if gain_or_loss then
						add_to_chat(100,'>>>> Hasso On')
				else
					send_command([[input /ja "Hasso" <me>;]])
                end
    end
	if status == "Doom" then 
        sets.aftercast.TP = set_combine(sets.TP.Engaged,sets.Twilight)
		equip(sets.Twilight)
		add_to_chat(100,'>>>> Doomed! Equipping Twilight and disabling slots')
        disable('head','body')
    else
		sets.aftercast.TP = sets.TP.Engaged
		enable('head','body')
    end
	if status == "Meikyo Shisui" and player.status == "Engaged" then
                if gain_or_loss then
					add_to_chat(100,'>>>> Meikyo Shisui Active')
					MeikyoStatus = 1
				else
					MeikyoStatus = 0
					add_to_chat(100,'>>>> Meikyo Shisui End')
                end
    end
	
end

function hpp_change(new_hpp, old_hpp)
	if new_hpp < 35 then
		equip(sets.DT)
		sets.TP.Engaged = set_combine(sets.TP.Engaged,sets.DT)
		add_to_chat(100,'>>>> Low HP DT Set On')
	elseif new_hpp > 45 and old_hpp < 44 and player.status == 'Engaged' then
		sets.TP.Engaged = sets.TP.DD
		equip(sets.aftercast.TP)
		add_to_chat(100,'>>>> HP Normal Set On')
	end
end

-- Self commands 
function self_command(command)
	if command == 'DT' and (buffactive['Weakness'] or buffactive['Doom']) then
		equip(sets.DT,sets.Twilight)
	elseif command == 'DT' then
		equip(sets.DT)
	end
	if command == 'Twilight' then
		if sets.aftercast.TP == sets.TP.Engaged then
		  sets.aftercast.TP = set_combine(sets.TP.Engaged,sets.Twilight)
		  equp(sets.Twilight)
		else 
		  sets.aftercast.TP = sets.TP.Engaged
		end
	end
	if command == 'TP' and sets.TP.Engaged == sets.TP.DD then
		sets.TP.Engaged = sets.TP.Hybrid
		AccSetStatus = 0
		send_command('input /echo ------- Hybrid TP Set Activated -------')
	elseif command == 'ACC' and AccSetStatus == 1 then
		AccSetStatus = 0
		send_command('input /echo ------- Normal TP Set Activated -------')
	elseif command == 'ACC' and AccSetStatus == 0 then
		AccSetStatus = 1
		send_command('input /echo ------- Acc TP Set Activated ------')
	elseif command == 'TP' and sets.TP.Engaged == sets.TP.Hybrid then
		sets.TP.Engaged = sets.TP.DD
		AccSetStatus = 0
		send_command('input /echo ------- Normal TP Set Activated -------')
	elseif command == 'gearcollector' then
		set_gearcollector(sets)
	end
end