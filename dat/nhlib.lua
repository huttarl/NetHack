
math.randomseed( os.time() )

function shuffle(list)
   for i = #list, 2, -1 do
      local j = math.random(i)
      list[i], list[j] = list[j], list[i]
   end
end

align = { "law", "neutral", "chaos" };
shuffle(align);

function place_siren(growth)
   if math.random(0, 1) >= 1 then return false end
   growth = growth or 0
   -- Make a lake
   des.terrain(selection.ellipse(37, 9, 12+growth, 4+growth, 1), "}")
   -- with an island in it.
   des.terrain(selection.ellipse(37, 9, 4+growth, math.max(2+growth, 1), 1), ".")
      -- When falling/teleporting to this level, don't end up in the lake.
   des.teleport_region({ region = {00,00,70,18}, exclude = {27,03,47,13} });
   -- Place siren.
   des.monster("siren", 37, 9)
   -- TODO: siren should have some kind of treasure, on its person or on island. Possibly a (magic) harp or flute.
   -- https://en.wikipedia.org/wiki/Siren_(mythology)
   return true
end

