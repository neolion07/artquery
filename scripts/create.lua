function createDefault(conn)
	local response = assert(conn:execute(
		[[
		CREATE TABLE IF NOT EXISTS paintings(
			name varchar(64),
			year INTEGER
		)
		]]
	));

	local list = {
		{ name = "Mona Lisa", year = 1403, },
		{ name = "Starry Night", year = 1629, },
		{ name = "The Scream", year = 1772 }
	};

	for _, obj in ipairs(list) do
		response = assert(conn:execute(
			string.format(
				[[
				INSERT INTO paintings
				VALUES ('%s', '%d')
				]], obj.name, obj.year
			)
		));
	end
end
