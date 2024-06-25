dofile "scripts/connection.lua";
dofile "scripts/create.lua";
---[[
function main()
	local instance, conn = connectToDB();
	
	createDefault(conn);

	conn:close();
	instance:close();
	os.exit(0);
end
--]]

main();
