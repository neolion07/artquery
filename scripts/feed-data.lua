require "get-data";

function feed(conn)
	local artworks, artist_id_list = artworkData();
	local artists = artistData(artist_id_list);
	local locations = locationData();

-- @artists
---[==[
	for _, obj in pairs(artists) do
		---[===[
		assert(
			conn:execute(
				string.format(
				[[
				INSERT INTO artists(id, fullname, birth_date)
				VALUES(%d, '%s', %d)
				]], obj.id, string.gsub(obj.title, "'", "´"), obj.birth_date or 0
				)
			)
		);
		--]===]
	end
--]==]
-- @artists end

-- @locations
---[==[
	for _, obj in pairs(locations) do
		assert(
			conn:execute(
				string.format(
				[[
				INSERT INTO locations(id, name)
				VALUES(%d, '%s')
				]], obj.id, obj.name
				)
			)
		);
	end
--]==]
-- @locations end

-- @artworks
---[==[
	for _, obj in pairs(artworks) do
		assert(
			conn:execute(
				string.format(
				[[
				INSERT INTO artworks(id, title, year, artist_id)
				VALUES(%d, '%s', %d, %d)
				]], obj.id, string.gsub(obj.title, "'", "´"),
				obj.date_end, obj.artist_id
				)
			)
		);
		
		for i=2, #locations do
			if obj.place_of_origin == locations[i].name then
				assert(
					conn:execute(
						string.format(
						[[
						UPDATE artworks
						SET origin_place_id = %d
						WHERE id = %d
						]], locations[i].id, obj.id
						)
					)
				);
				break;
			end
			
			if not obj.place_of_origin or i == #locations then
				assert(
					conn:execute(
						string.format(
						[[
						UPDATE artworks
						SET origin_place_id = %d
						WHERE id = %d
						]], locations[1].id, -- index 1 is 'Undefined'
						obj.id
						)
					)
				);
				break;
			end
		end
	end
--]==]
-- @artworks end
	
end -- peak performance 💀️
