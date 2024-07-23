ltn12 = require "ltn12";
https = require "ssl.https";
json = require "json";

function artworkData()
	local res = {};
	local artist_id_list = {};

	https.request({
		url = "https://api.artic.edu/api/v1/artworks/search?query[exists][field]=artist_id&fields=id,title,date_end,place_of_origin,artist_id&limit=50",
		method = "GET",
		headers = {["Content-Type"] = "application/json"},
		sink = ltn12.sink.table(res)
	});
	res = json.decode(res[1]);
	
	for _, obj in pairs(res.data) do
		table.insert(artist_id_list, obj.artist_id);
	end
	return res.data, artist_id_list;
end

function artistData(artist_id_list)
	local res = {};
	local req_url = "https://api.artic.edu/api/v1/artists?ids=";
	for i=1, #artist_id_list do
		req_url = string.format("%s%d", req_url, artist_id_list[i]);
		if i < #artist_id_list then
			req_url = req_url..",";
		end
	end
	https.request({
		url = string.format("%s",req_url.."&fields=id,title,birth_date"),
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
	return -- non-country names will be set as Undefined
	{
		{ id = 1, name = "Undefined" },
		{ id = 2, name = "United States" },
		{ id = 3, name = "France" },
		{ id = 4, name = "Mexico" },
		{ id = 5, name = "Spain" },
		{ id = 6, name = "Germany" },
		{ id = 7, name = "England" },
		{ id = 8, name = "Japan" },
		{ id = 9, name = "Norway" },
		{ id = 10, name = "Holland" },
		{ id = 11, name = "Netherlands" },
		{ id = 12, name = "Republic of the Congo" },
		{ id = 13, name = "Canada" },
		{ id = 14, name = "Belgium" },
		{ id = 15, name = "Italy" },
		{ id = 16, name = "Scotland" },
		{ id = 17, name = "Switzerland" },
		{ id = 18, name = "Egypt" },
		{ id = 19, name = "Russia" },
		{ id = 20, name = "India" },
		{ id = 21, name = "Kenya" },
		{ id = 22, name = "Gabon" },
		{ id = 23, name = "South Africa" },
		{ id = 24, name = "Austria" },
		{ id = 25, name = "Turkey" },
		{ id = 26, name = "China" },
		{ id = 27, name = "Indonesia" },
		{ id = 28, name = "Iran" },
		{ id = 29, name = "Peru" },
		{ id = 30, name = "Greece" },
		{ id = 31, name = "Ireland" },
		{ id = 32, name = "Venezuela" },
		{ id = 33, name = "Ancient Greece" },
		{ id = 34, name = "Brazil" },
		{ id = 35, name = "Colombia" },
		{ id = 36, name = "Argentina" },
		{ id = 37, name = "Uruguay" },
		{ id = 38, name = "Paraguay" },
		{ id = 39, name = "Chile" },
		{ id = 40, name = "Ecuador" },
		{ id = 41, name = "Bolivia" },
		{ id = 42, name = "Guatemala" },
		{ id = 43, name = "Cuba" },
		{ id = 44, name = "Portugal" },
		{ id = 45, name = "Israel" },
		{ id = 46, name = "Ukraine" },
		{ id = 47, name = "Thailand" },
		{ id = 48, name = "Finland" },
		{ id = 49, name = "Denmark" },
		{ id = 50, name = "Poland" },
};
end
