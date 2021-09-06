--To toggle gearsets:
--Main command: //gs c toggle x set       where x = set name variable. Variables are as follows: --
--Idle sets: Idle, TP sets: TP--
--Resolution sets: Res, Requiescat sets: Req--
 
function get_sets()
 
                --Idle Sets--
                sets.Idle = {}
               
                sets.Idle.index = {'Standard'}
               
                Idle_ind = 1
                               
                sets.Idle.Standard = {ammo="Hagneia stone",
                                      head="Ocelomeh headpiece +1",neck="Twilight torque", ear1="Ethereal earring",
                                      body="Futhark coat",hands="Iuitl wristbands",ring1="Dark ring",ring2="Sheltered ring",
                                      back="Evasionist's cape",waist="Flume belt",legs="Blood cuisses",feet="Iuitl gaiters"}
                       
       
               
                               
                               
                               
                --TP Sets--
                sets.TP = {}
 
                sets.TP.index = {'Standard', 'Solo', 'AccuracyLite', 'AccuracyFull', 'DT', 'DTAccuracy'}
                --1=Standard, 2=Solo, 3=AccuracyLite, 4=AccuracyFull, 5=DT, 6=DTAccuracy--
                TP_ind = 1
       
                sets.TP.Standard = {ammo="Hagneia stone",
                                    head="Iuitl headgear",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",
                                    body="Thaumas coat",hands="Iuitl wristbands",ring1="Epona's ring",ring2="Rajas ring",
                                    back="Atheling mantle",waist="Windbuffet belt",legs="Iuitl tights",feet="Manibozho boots"}
                                                       
                sets.TP.Solo = {ammo="Hagneia stone",
                                head="Iuitl headgear",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",
                                body="Futhark coat",hands="Iuitl wristbands",ring1="Epona's ring",ring2="Rajas ring",
                                back="Atheling mantle",waist="Windbuffet belt",legs="Iuitl tights",feet="Manibozho boots"}
                                                       
                sets.TP.AccuracyLite = {ammo="Hagneia stone",
                                        head="Whirlpool mask",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",                            body="Thaumas coat",hands="Buremte gloves",ring1="Epona's ring",ring2="Rajas ring",
                                        back="Evasionist's cape",waist="Windbuffet belt",legs="Iuitl tights",feet="Manibozho boots"}
       
                sets.TP.AccuracyFull = {ammo="Honed tathlum",
                                        head="Whirlpool mask",neck="Ziel charm", ear1="Steelflash earring", ear2="Bladeborn earring",
                                        body="Thaumas coat",hands="Buremte gloves",ring1="Epona's ring",ring2="Mars's ring",
                                        back="Evasionist's cape",waist="Hurch'lan sash",legs="Iuitl tights",feet="Manibozho boots"}
                                                       
                sets.TP.DT = {ammo="Honed tathlum",
                              head="Futhark bandeau",neck="Twilight torque", ear1="Steelflash earring", ear2="Bladeborn earring",
                              body="Futhark coat",hands="Iuitl wristbands",ring1="Dark ring",ring2="Epona's ring",
                              back="Mollusca mantle",waist="Flume belt",legs="Iuitl tights",feet="Iuitl gaiters"}
                                 
                sets.TP.DTAccuracy = {ammo="Honed tathlum",
                                      head="Futhark bandeau",neck="Twilight torque", ear1="Steelflash earring", ear2="Bladeborn earring",                             body="Futhark coat",hands="Iuitl wristbands",ring1="Dark ring",ring2="Mars's ring",
                                      back="Evasionist's cape",waist="Flume belt",legs="Iuitl tights",feet="Iuitl gaiters"}
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                --Weaponskill Sets--
                sets.WS = {}
       
                sets.Resolution = {}
       
                sets.Resolution.index = {'Attack','Accuracy'}
                Resolution_ind = 1
       
                sets.Resolution.Attack = {ammo="Aqreqaq bomblet",
                                          head="Whirlpool mask",neck="Soil gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                          body="Manibozho jerkin",hands="Manibozho gloves",ring1="Epona's ring",ring2="Vulcan's ring",
                                          back="Buquwik cape",waist="Soil belt",legs="Quiahuiz leggings",feet="Manibozho boots"}
                                                                 
                sets.Resolution.Accuracy = {ammo="Honed tathlum",
                                            head="Whirlpool mask",neck="Soil gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                            body="Manibozho jerkin",hands="Buremte gloves",ring1="Epona's ring",ring2="Vulcan's ring",
                                            back="Buquwik cape",waist="Soil belt",legs="Manibozho brais",feet="Manibozho boots"}
                                                         
                sets.Requiescat = {}
       
                sets.Requiescat.index = {'Attack','Accuracy'}
                Requiescat_ind = 1
               
                sets.Requiescat.Attack = {ammo="Potestas bomblet",
                                          head="Whirlpool mask",neck="Soil gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                          body="Wayfarer robe",hands="Wayfarer cuffs",ring1="Epona's ring",ring2="Aquasoul ring",
                                          back="Atheling mantle",waist="Soil belt",legs="Quiahuiz leggings",feet="Wayfarer clogs"}
                                                                 
                sets.Requiescat.Accuracy = {ammo="Honed tathlum",
                                            head="Whirlpool mask",neck="Soil gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                            body="Wayfarer robe",hands="Buremte gloves",ring1="Epona's ring",ring2="Aquasoul ring",
                                            back="Letalis mantle",waist="Soil belt",legs="Quiahuiz leggings",feet="Wayfarer clogs"}
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                                                                         
                --Utility Sets--
                sets.Utility = {}
               
                sets.Utility.PDT = {head="Futhark bandeau",neck="Twilight torque",ear1="Ethereal earring",
                                    body="Futhark coat",hands="Iuitl wristbands",ring1="Dark ring",ring2="Dark ring",
                                    back="Mollusca mantle",waist="Flume belt",legs="Iuitl tights",feet="Iuitl gaiters"}
                                               
                sets.Utility.MDT = {head="Runeist bandeau",neck="Twilight torque",
                                    body="Futhark coat",hands="Runeist mitons",ring1="Dark ring",ring2="Dark ring",
                                    back="Mollusca mantle",legs="Runeist trousers",feet="Runeist bottes"}
                                                       
                sets.Utility.Stoneskin = {head="Whirlpool mask",neck="Stone Gorget",ear1="Loquac. earring",ear2="Earthcry earring",
                                          body="Futhark coat",hands="Stone Mufflers",ring1="Prolix ring",
                                          back="Swith cape",waist="Siegel sash",legs="Haven hose",feet="Iuitl gaiters"}
                                                         
                sets.Utility.Phalanx = {head="Futhark bandeau",neck="Colossus's torque",ear1="Loquac. earring",ear2="Augment. earring",
                                        body="Futhark coat",hands="Runeist mitons",ring1="Prolix ring",
                                        back="Swith cape",waist="Cascade belt",legs="Portent pants",feet="Iuitl gaiters"}
                                                         
                sets.Utility.Regen = {head="Runeist bandeau",neck="Colossus's torque",ear1="Loquac. earring",ear2="Augment. earring",
                                      body="Futhark coat",hands="Runeist mitons",ring1="Prolix ring",
                                      back="Swith cape",waist="Pythia sash +1",legs="Futhark trousers",feet="Runeist bottes"}
                                                         
                sets.Utility.Utsusemi = {head="Runeist bandeau",neck="Jeweled collar",ear1="Loquac. earring",
                                         body="Futhark coat",hands="Thaumas gloves",ring1="Prolix ring",
                                         back="Swith cape",waist="Hurch'lan sash",legs="Futhark trousers",feet="Iuitl gaiters"}
                                                                 
                                               
                               
                               
                               
                               
                               
                --Job Ability Sets--
                sets.JA = {}
               
                sets.JA.Lunge = {ammo="Erlene's notebook",
                                 head="A'as circlet",neck="Eddy necklace",lear="Hecate's earring",rear="Friomisi earring",
                                 body="Mirke wardecors",hands="Spolia cuffs",
                                 back="Evasionist's cape",legs="Shneddick tights",feet="Weatherspoon souliers"}
       
                sets.JA.Vallation = {body="Runeist coat",
                                    legs="Futhark trousers"}
                                                         
                sets.JA.Battuta = {head="Futhark bandeau"}
       
                sets.JA.Gambit = {hands="Runeist mitons"}
       
                sets.JA.Pflug = {head="Runeist bottes"}
               
               
               
               
               
               
                --Precast Sets--
                sets.precast = {}
       
                sets.precast.FC = {}
       
                sets.precast.FC.Standard = {head="Runeist bandeau",neck="Jeweled collar", ear1="Loquac. Earring",
                                            body="Mirke wardecors",hands="Thaumas Gloves",
                                            legs="Orvail pants +1",feet="Chelona Boots"}
                                                                       
                sets.precast.FC.Enhancing = {head="Runeist bandeau",neck="Jeweled collar", ear1="Loquac. Earring",
                                             body="Mirke wardecors",hands="Thaumas Gloves",
                                             legs="Futhark trousers",feet="Chelona Boots"}
end
 
 
 
               
               
               
function precast(spell)
        if spell.action_type == 'Magic' then
                equip(sets.precast.FC.Standard)
        end
       
        if spell.action_type == 'Enhancing' then
                equip(sets.precast.FC.Enhancing)
        end
       
        if spell.action_type == 'Ninjutsu' then
                equip(sets.precast.FC.Standard)
        end
       
        if spell.english == 'Lunge' or spell.english == 'Swipe' then
                equip(sets.JA.Lunge)
        end
       
        if spell.english == 'Vallation' or spell.english == 'Valiance' then
                equip(sets.JA.Vallation)
        end
       
        if spell.english == 'Battuta' then
                equip(sets.JA.Battuta)
        end
       
        if spell.english == 'Pflug' then
                equip(sets.JA.Pflug)
        end
       
        if spell.english == 'Gambit' then
                equip(sets.JA.Gambit)
        end
               
        if spell.english == 'Resolution' or spell.english == 'Shockwave' then
                equip(sets.Resolution[sets.Resolution.index[Resolution_ind]])
        end
       
        if spell.english == 'Requiescat' then
                equip(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
        end
end            
 
function midcast(spell,act)
        if spell.english == 'Stoneskin' then
                equip(sets.Utility.Stoneskin)
                            if buffactive['Stoneskin'] then
                                send_command('@wait 0.7; input //cancel Stoneskin; input /echo Refreshing Stoneskin.')
                            end
        end
       
        if spell.english == 'Phalanx' or spell.english == 'Bar*' then
                equip(sets.Utility.Phalanx)
        end
       
        if spell.english == 'Regen' then
                equip(sets.Utility.Regen)
        end
       
        if spell.english == 'Utsusemi: Ichi' then
                equip(sets.Utility.Utsusemi)
                        if buffactive['Copy Image (3)'] then
                                send_command('@wait 0.3; input //cancel Copy Image*')
                        end
                        if buffactive['Copy Image (2)'] then
                                send_command('@wait 0.3; input //cancel Copy Image*')
                        end
                        if buffactive['Copy Image (1)'] then
                                send_command('@wait 0.3; input //cancel Copy Image*')
                        end
                        if buffactive['Copy Image'] then
                                send_command('@wait 0.3; input //cancel Copy Image*')
                        end
        end
 
        if spell.english == 'Utsusemi: Ni' then
                equip(sets.Utility.Utsusemi)
        end
end
 
function aftercast(spell)
        if player.status == 'Engaged' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        else
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
end
 
function status_change(new,old)
        if new == 'Engaged' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        else
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
end
 
function self_command(command)
        if command == 'toggle TP set' then
                TP_ind = TP_ind +1
                if TP_ind > #sets.TP.index then TP_ind = 1 end
                send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
                equip(sets.TP[sets.TP.index[TP_ind]])
        elseif command == 'toggle Idle set' then
                Idle_ind = Idle_ind +1
                if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
                send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        elseif command == 'toggle Res set' then
                Resolution_ind = Resolution_ind +1
                if Resolution_ind > #sets.Resolution.index then Resolution_ind = 1 end
                send_command('@input /echo <----- Resolution set changed to '..sets.Resolution.index[Resolution_ind]..' ----->')
        elseif command == 'toggle Req set' then
                Requiescat_ind = Requiescat_ind +1
                if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
                send_command('@input /echo <----- Requiescat Set changed to '..sets.Requiescat.index[Requiescat_ind]..' ----->')
        elseif command == 'equip TP set' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        elseif command == 'equip Idle set' then
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
end