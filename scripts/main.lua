local sleep = require("socket").sleep;
require "connection";
require "create";
require "feed-data";
require "display";
require "delete";
require "update"
require "help";
---[[
function main()
	local instance, conn = connectToDB();
	
	createTables(conn);
	feed(conn);
	---[[
	local command = "";
	repeat
		io.write("ArtQuery v0.1.0\n");
		io.write("Type .help for a list of commands\n");
		io.write("> ");
		command = io.read("l");
		if command ~= ".quit" then
			-- Show tables:
			if command == ".show" then
				io.write("Enter the table's name: ");
				local table_name = io.read("l");
				table_name = table_name:gsub("[^%w,_]", ""); -- fix cursed input
				
				io.write(
				"Enter a query (column names separated by commas, or * to show all columns): ");
				local query = io.read("l");
				query = query:gsub("[^%w,_%*]", "");
				
				io.write("Enter a field to filter results by (empty for none): ");
				local filter_field = io.read("l");
				filter_field = filter_field:gsub("[^%w_]", "");
				
				local filter_value = "";
				if filter_field ~= "" then
					io.write("Enter a value for the filter: ");
					filter_value = io.read("l")
					filter_value = filter_value:gsub("[^%w]", "");
				end
				display(
					conn,
					table_name,
					query,
					filter_field,
					filter_value
				);

			-- Update rows:
			elseif command == ".update" then
				io.write("Enter the table's name: ");
				local table_name = io.read("l");
				table_name = table_name:gsub("[^%w_]", "");
				
				io.write("Enter the row's ID: ");
				local id = io.read("l");
				id = id:gsub("[^%d]", "");
				
				io.write("Enter column names and their new values (separate with commas): ");
				local new_columns = io.read("l");
				new_columns = new_columns:gsub("[^%w,_=]", "");
				
				updateById(conn, table_name, id, new_columns);
				
			-- Delete rows:
			elseif command == ".delete" then
				io.write("Enter the table's name: ");
				local table_name = io.read("l");
				table_name = table_name:gsub("[^%w_]", "");
				
				io.write("Enter the row's ID: ");
				local id = io.read("l");
				id = id:gsub("[^%d]", "");
				
				deleteById(conn, table_name, id);
				
			-- Reset the database:
			elseif command == ".reset" then
				io.write("Resetting database...\n");
				createTables(conn);
				feed(conn);
				
			-- Print help:
			elseif command == ".help" then
				help();
				
			-- For non-existent options:
			else
				io.write("ERROR: invalid command\n");
			end
			
			io.write("Press ENTER to continue...\n");
			io.read();
			os.execute("clear");
		end
	until command == ".quit";
	--]]
	io.write("Stopping...\n");
	conn:close();
	instance:close();
	sleep(2.5);
end
--]]

main();
