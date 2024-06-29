-- Only updating single rows by their ID will be supported for now.

function updateById(conn, table_name, id, new_columns)
	if table_name == "" then
		io.write("ERROR: must specify a table name\n");
		return nil;
	end
	if id == "" then
		io.write("ERROR: must specify a row ID\n");
		return nil;
	end
	if new_columns == "" then
		io.write("ERROR: must specify at least one column to update\n");
		return nil;
	end
	
	local response, errMsg = conn:execute(
		string.format(
		[[
		SELECT * FROM %s WHERE id=%s
		]], table_name, id
		)
	);
	local row = response:fetch({}, "a");
	if not row then
		io.write(
			string.format("ERROR: row with ID %s does not exist\n", id)
		);
		response:close();
		return nil;
	end
	row = nil;
	response:close();
	
	response, errMsg = conn:execute(
		string.format(
			[[
			UPDATE %s
			SET %s
			WHERE id=%s
			]], table_name, new_columns, id
		)
	);
	
	if errMsg then
		io.write(string.format("%s", errMsg));
		return nil;
	else
		io.write(string.format("Updated row ID %s\n", id));
	end
	return 0;
end
