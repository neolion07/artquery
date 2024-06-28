require "get-data";

function feed(conn)
	local artworks, artist_id_list = artworkData();
	local artists = artistData(artist_id_list);
--	local locations = locationData();

-- can't think of a better way to send object attributes so here goes:

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
				]], obj.id, obj.title, obj.birth_date or 0
				)
			)
		);
		--]===]
	end
--]==]
-- @artists end

-- @artworks
---[==[
	for _, obj in pairs(artworks) do
		assert(
			conn:execute(
				string.format(
				[[
				INSERT INTO artworks(id, title, year, artist_id)
				VALUES(%d, '%s', %d, %d)
				]], obj.id, obj.title, obj.date_end, obj.artist_id
				)
			)
		);
	end
--]==]
-- @artworks end
	
end
