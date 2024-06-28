require "connection";
require "create";
require "feed-data";
---[[
function main()
	local instance, conn = connectToDB();
	
	createTables(conn);
	feed(conn);
	---[[
	local mode_str = "";
	repeat
		io.write("Menu test. Type .quit to exit.\n");
		mode_str = io.read("l");
		if mode_str ~= ".quit" then
			if mode_str == ".show" then
				print("SHOW MODE");
			elseif mode_str == ".update" then
				print("UPDATE MODE");
			elseif mode_str == ".delete" then
				print("DELETE MODE");
			else
				print("INVALID OPTION");
			end
			io.write("Press ENTER to continue...\n");
			io.read();
			os.execute("clear");
		end
	until mode_str == ".quit";
	--]]
	io.write("Stopping...\n");
	conn:close();
	instance:close();
	os.exit(0);
end
--]]

main();
