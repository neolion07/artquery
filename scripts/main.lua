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
				table_name = table_name:gsub(";", ""); -- to prevent cursed input
				
				io.write(
				"Enter a query (enter * to show all columns, "
				.."or separate multiple column names with commas): ");
				local query = io.read("l");
				query = query:gsub(";", "");
				
				io.write("Enter a field to filter results by (empty for none): ");
				local filter_field = io.read("l");
				filter_field = filter_field:gsub(";", "");
				filter_field = filter_field:gsub("=", "");
				filter_field = filter_field:gsub(">", "");
				filter_field = filter_field:gsub("<", "");

				local filter_value = "";
				if filter_field ~= "" then
					io.write("Enter a value for the filter: ");
					filter_value = io.read("l")
					filter_value = filter_value:gsub(";", "");
				end
				display(
					conn,
					table_name:gsub(" ", ""),
					query:gsub(" ", ""),
					filter_field:gsub(" ", ""),
					filter_value:gsub(" ", "")
				);

			-- Update rows:
			elseif command == ".update" then
				io.write("Enter the table's name: ");
				local table_name = io.read("l");
				table_name = table_name:gsub(";", "");
				table_name = table_name:gsub(" ", "");
				
				io.write("Enter the row's ID: ");
				local id = io.read("l");
				id = id:gsub(";", "");
				id = id:gsub(" ", "");
				
				io.write(
					"Enter column names and their new values "
					.."(separate with commas): "
				);
				local new_columns = io.read("l");
				new_columns = new_columns:gsub(";", "");
				new_columns = new_columns:gsub(" ", "");
				
				updateById(conn, table_name, id, new_columns);
				
			-- Delete rows:
			elseif command == ".delete" then
				io.write("Enter the table's name: ");
				local table_name = io.read("l");
				table_name = table_name:gsub(";", "");
				table_name = table_name:gsub(" ", "");
				
				io.write("Enter the row's ID: ");
				local id = io.read("l");
				id = id:gsub(";", "");
				id = id:gsub(" ", "");
				
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
