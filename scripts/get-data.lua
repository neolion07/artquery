ltn12 = require "ltn12";
https = require "ssl.https";
json = require "json";

function paintingData()
	local res = {}
	https.request({
		url = "https://api.artic.edu/api/v1/paintings?fields=id,title&limit=2&offset=0",
		method = "GET",
		headers = {["Content-Type"] = "application/json"},
		sink = ltn12.sink.table(res)
	});
	res = json.decode(res[1]);
	return res.data;
end

function artistData()
	local res = {};
	https.request({
		url = "https://api.artic.edu/api/v1/artists?fields=id,title,birth_date&limit=2&offset=0",
		method = "GET",
		headers = {["Content-Type"] = "application/json"},
		sink = ltn12.sink.table(res)
	});
	res = json.decode(res[1]);
	return res.data;
end

function locationData()
	return {};
end

local tab = artistData();
for _, obj in pairs(tab) do
	for k, v in pairs(obj) do
		print(k, v);
	end
end
--[==[
	for _, obj in ipairs(list) do
		response = assert(conn:execute(
			string.format(
				[[
				INSERT INTO paintings
				VALUES ('%s', '%d')
				]], obj.name, obj.year
			)
		));
	end
--]==]
