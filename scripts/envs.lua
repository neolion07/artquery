function getEnvs()
	-- open the file with the environment variables:
	local file = assert( io.open("../.env", "r") );

	-- table with default values:
	local envs = {
		PORT = 3000,
		HOSTNAME = "localhost",
		USERNAME = "",
		PASSWORD = "",
		DB_NAME = "";
	};
	
---[[
	while true do
		local str = file:read("l");
		if not str then
			break;
		end

		local i, j = 0, 0;
		if str:find("PORT=") then
			i, j = str:find("PORT=");
			envs.PORT = tonumber(
				str:sub(j+1, #str)
			);
		end

		if str:find("HOSTNAME=") then
			i, j = str:find("HOSTNAME=");
			envs.HOSTNAME = str:sub(j+1, #str);
		end

		if str:find("USERNAME=") then
			i, j = str:find("USERNAME=");
			envs.USERNAME = str:sub(j+1, #str);
		end

		if str:find("PASSWORD=") then
			i, j = str:find("PASSWORD=");
			envs.PASSWORD = str:sub(j+1, #str);
		end

		if str:find("DB_NAME=") then
			i, j = str:find("DB_NAME=");
			envs.DB_NAME = str:sub(j+1, #str);
		end
	end
	file:close();
--]]

	return envs;
end
