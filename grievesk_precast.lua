function precast(spell)

		if spell.action_type == 'Ability' and spell ~= 'Boost' then
            local abil_recasts = windower.ffxi.get_ability_recasts()
            if abil_recasts[spell.recast_id] ~= nil and abil_recasts[spell.recast_id] > 0 then
                add_to_chat(123,'> > > >Abort: Ability waiting on recast.')
                cancel_spell()
                return
            end
        elseif spell.action_type == 'Magic' then
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] > 0 then
                add_to_chat(123,'> > > >Abort: Spell waiting on recast.')
                cancel_spell()
                return
            end
        end
--    if spell.name ~= 'Ranged' and spell.type ~= 'WeaponSkill' then
--        if spell.action_type == 'Ability' then
--            if spell and (windower.ffxi.get_ability_recasts()[spell.recast_id] >= 1) then
--                cancel_spell()
--                return
--            end
--        elseif spell.action_type == 'Magic' then
--            if spell and (windower.ffxi.get_spell_recasts()[spell.recast_id] >= 1) then
--                cancel_spell()
--                return
--            end
--        end
--    end
		if spell.english == 'Spectral Jig' then
			send_command('cancel 71;')
			add_to_chat(100,'> > > > '..spell.name)
	end
	if spell.english == 'Utsusemi: Ichi' then
			equip(sets.precast.Utsusemi)
			add_to_chat(100,'> > > > '..spell.name)
	end
	if spell.english == 'Utsusemi: Ni' then
			equip(sets.precast.Utsusemi)
			add_to_chat(100,'> > > > '..spell.name)
	end
	if spell.english == 'spell.name' and spell.action_type == 'JobAbility' then
			equip(sets.precast.spell.name)
			add_to_chat(100,'> > > > '..spell.name)
	end

end