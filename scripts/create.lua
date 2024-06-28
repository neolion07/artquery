function createTables(conn)
	-- Check if the table exists:
	local response, errMsg = conn:execute(
		[[
		SELECT * FROM locations
		]]
	);
	if not errMsg then
		response, errMsg = conn:execute(
			[[
			DROP TABLE locations CASCADE
			]]
		);
	end
	-- Create table for location data:
	response, errMsg = conn:execute(
		[[
		CREATE TABLE locations(
			id INT NOT NULL,
			name VARCHAR(64),
			PRIMARY KEY (id)
		)
		]]
	); --! update ERD to show this entity instead of categories
	

	response, errMsg = conn:execute(
		[[
		SELECT * FROM artists
		]]
	);
	if not errMsg then
		response, errMsg = conn:execute(
			[[
			DROP TABLE artists CASCADE
			]]
		);
	end
	-- Create table for artist data:
	response, errMsg = conn:execute(
		[[
		CREATE TABLE artists(
			id INT NOT NULL,
			fullname VARCHAR(127),
			birth_date INT,
			PRIMARY KEY (id)
		)
		]]
	); --! update ERD
	
	response, errMsg = conn:execute(
		[[
		SELECT * FROM artworks
		]]
	);
	if not errMsg then
		response, errMsg = conn:execute(
			[[
			DROP TABLE artworks
			]]
		);
	end
	-- Create table for artwork data:
	response, errMsg = conn:execute(
		[[
		CREATE TABLE artworks(
			id INT NOT NULL,
			title VARCHAR(255),
			year INT,
			artist_id INT NOT NULL,
			origin_place_id INT,
			PRIMARY KEY (id),
			FOREIGN KEY (artist_id) REFERENCES artists(id),
			FOREIGN KEY (origin_place_id) REFERENCES locations(id)
		)
		]]
	); --! fix artist_id, origin_place_id and update ERD
end
