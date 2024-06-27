-- Import the driver:
local driver = require "luasql.postgres";

-- Get the environment variables:
require "envs";
local envs = getEnvs();


function connectToDB()
	-- Create the instance:
	local instance = assert( driver.postgres() );

	-- Create connection:
	local conn = assert(
		instance:connect(
			envs.DB_NAME,		-- name of the database to connect to
			envs.USERNAME,		-- username
			envs.PASSWORD,		-- password
			envs.HOSTNAME,		-- hostname
			envs.PORT			-- port
		)
	);
	return instance, conn;
end
