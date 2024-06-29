function display(conn, table_name, query, ...)
	local filter_field, filter_value = ...;
	---[==[
	local cursor, errMsg = 0, nil;
	if query == "" then
		io.write("ERROR: Must enter a query\n");
		return nil;
	elseif filter_field == "" then
		cursor, errMsg = conn:execute(
			string.format(
			[[
			SELECT %s FROM %s;
			]], query, table_name
			)
		);
	else
		if filter_value == "" then
			io.write("ERROR: Must enter a filter value\n");
			return nil;
		end
		cursor, errMsg = conn:execute(
			string.format(
			[[
			SELECT %s FROM %s WHERE %s=%s;
			]], query, table_name, filter_field, tostring(filter_value)
			)
		);
	end

	-- Check for errors with statement execution:
	if errMsg then
		io.write(string.format("%s\n", errMsg));
		return nil;
	end

	-- Print column names and their respective values for each row:
	local row = cursor:fetch({}, "a");

	if not row then
		io.write("No results.\n");
		cursor:close();
		return;
	end

	local counter = 1;
	while row do
		io.write(
			string.format("----- [RESULT #%d] -----\n", counter)
		);

		for key, value in pairs(row) do
			io.write(
				string.format(
				key..": %s\n", tostring(value) 
				)
			);
		end
		counter = counter + 1;
		row = cursor:fetch(row, "a");
	end
	cursor:close();
	--]==]
end
