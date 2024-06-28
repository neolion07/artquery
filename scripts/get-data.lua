ltn12 = require "ltn12";
https = require "ssl.https";
json = require "json";

function artworkData()
	local res = {};
	local artist_id_list = {};
	https.request({
		url = "https://api.artic.edu/api/v1/artworks?fields=id,title,date_end,artist_id&limit=3",
		method = "GET",
		headers = {["Content-Type"] = "application/json"},
		sink = ltn12.sink.table(res)
	});
	res = json.decode(res[1]);
	for _, obj in pairs(res.data) do
		table.push(artist_id_list, obj.artist_id);
	end
	return res.data, artist_id_list;
end

function artistData(artist_id_list)
	local res = {};
	local ;
	https.request({
		url = string.format"https://api.artic.edu/api/v1/artists/%d?fields=id,title,birth_date&limit=3",
		method = "GET",
		headers = {["Content-Type"] = "application/json"},
		sink = ltn12.sink.table(res)
	});
	res = json.decode(res[1]);
	return res.data;
end

function locationData()
	-- ...The API does not provide location data for artworks or artists,
	-- so I had to set this up myself.
	return
	{
		{ id = 1, name = "" },
		{ id = 2, name = "" },
		{ id = 3, name = "" },
		{ id = 4, name = "" },
		{ id = 5, name = "" },
		{ id = 6, name = "" },
		{ id = 7, name = "" },
		{ id = 8, name = "" },
		{ id = 9, name = "" },
		{ id = 10, name = "" },
		{ id = 11, name = "" },
		{ id = 12, name = "" },
	};
end

--[[
local tab = artworkData();
for _, obj in pairs(tab) do
	for k, v in pairs(obj) do
		if type(v) == type({}) then
			for i = 1, #v do
				print("artist id: "..v[i])
			end
		else
			print(k, v);
		end
	end
end
--]]
