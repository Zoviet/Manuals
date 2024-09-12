local http = require ('ssl.https')
local mime = require("mime")
local json = require('rapidjson')
local base64 = require('base64')
local ltn12 = require('ltn12')
local log = require('log')
log.outfile = 'user.log'
log.level = 'trace' 

local _M = {}

local login ='guest'

local password ='guest'

local master_code = 0

local salt = 'gdi5mm71R6YF'

local result 

local function decode_password(str)
	local str = string.reverse(str)
	str = str..'=='
	str = base64.decode(str)
	return string.gsub(str,salt,'')
end

function get(id) 
	respbody = {}
	log.info('https://hh24lock.ru/api/v2/admin/?id='..id)
	local result, respcode, respheaders, respstatus = http.request {
		method = 'GET',
		url = 'https://hh24lock.ru/api/v2/admin/?id='..id,	
		source = ltn12.source.empty(),
		headers = {
			['Authorization'] = 'Basic '..(mime.b64('admin:1234')),
			['Content-Type'] = 'application/json',
			['User-Agent'] = 'LuaSocket 3.0.0'
		},
		sink = ltn12.sink.table(respbody)
	}	
	respbody = table.concat(respbody)	
	log.info(respbody)
	if not (respcode == 200) then return false end
	ok,err = pcall(json.decode,respbody)
	if not ok then return false end
	return json.decode(respbody)	
end

function _M.get_login(id) 
	result = get(id)
	if result then
		login = result.data[2].login
	end
	return login
end

function _M.get_password() 
	if result then
		password = decode_password(result.data[2].password)
	end
	return password
end

function _M.get_master_code() 
	if result then
		master_code = result.data[1].master_code
	end
	return master_code
end

 print(_M.get_login(42))

return _M
