require "connection";
require "create";
require "feed-data";
---[[
function main()
	local instance, conn = connectToDB();
	
	createTables(conn);
	feed(conn);

	conn:close();
	instance:close();
	os.exit(0);
end
--]]

main();
