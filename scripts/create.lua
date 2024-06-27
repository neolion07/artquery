function createTables(conn)
	-- Check if the table exists:
	local response, errMsg = conn:execute(
		[[
		SELECT * FROM paintings
		]]
	);
	if errMsg then
		-- Create table for painting data:
		response, errMsg = conn:execute(
			[[
			CREATE TABLE paintings(
				id INT NOT NULL,
				title VARCHAR(255),
				year INT,
				artist_id INT
			)
			]]
		); --! fix artist_id and update ERD
	end
	
	response, errMsg = conn:execute(
		[[
		SELECT * FROM locations
		]]
	);
	if errMsg then
		-- Create table for location data:
		response, errMsg = conn:execute(
			[[
			CREATE TABLE locations(
				id INT NOT NULL,
				name VARCHAR(64)
			)
			]]
		); --! update ERD to show this entity instead of categories
	end
	
	response, errMsg = conn:execute(
		[[
		SELECT * FROM artists
		]]
	);
	if errMsg then
		-- create table for artist data:
		response, errMsg = conn:execute(
			[[
			CREATE TABLE artists(
				id INT NOT NULL,
				fullname VARCHAR(127),
				birth_date DATE,
				birthplace_id INT
			)
			]]
		); --! fix birthplace_id and update ERD
	end
end
