#!/usr/bin/env lua5.3
--[[--
File  : powerline.lua
Author: Amsid S <amsit14@gmail.com>
Date  : 10.12.2020
--]]--


powerline_luapath = "/github.com/audunmg/powerline-lua"
powerline_luapath = os.getenv("HOME") .. powerline_luapath .. "/?.lua;"



package.path = package.path .. powerline_luapath
modules = {
	"duration",
	"ssh",
	"username",
	"hostname",
	"path",
  "git",
	"exitcode",
}



function fgColor(code)
	return string.format("\\[\27[38;5;%dm\\]", code)
end
function bgColor(code)
	return string.format("\\[\27[48;5;%dm\\]", code)
end
function fgbgColor(fg,bg)
	return string.format("\\[\27[38;5;%d;48;5;%dm\\]", fg, bg )
end
function reset()
	return "\\[\27[0m\\]"
end

mods = {}
params = {
	theme = require('powerline.theme'),
  separator = '▒░',
	condensed = false
}

params.cwd = os.getenv('PWD')

if os.getenv('PL_CONDENSED') == "yes"  then
	params.condensed = true
end
if os.getenv('PL_SEPARATOR') == "none" then
	params.separator = ''
end

for k,v in ipairs(arg) do
	if (v == "-d") or (v == "--duration") or (v == "-duration") then
			params.duration = tonumber(arg[k+1])
	end
	if (v == "-c") or (v == "--condensed") or (v == "-condensed") then
			params.condensed = true
	end
	if (v == "-e") or (v == "--exit-code") or (v == "-error") then
			params.exitcode = tonumber(arg[k+1])
	end
	if (v == "-m") or (v == "--modules") then
			modules = {}
			for mod in string.gmatch(arg[k+1], "[^,]+") do
				table.insert(modules,mod)
			end
	end
end


buffer = ""
segments = {}
-- run all modules
for _, module in ipairs(modules) do
  mod = require("powerline."..module)
	modsegments = mod.main(params)
	for k,seg in ipairs(modsegments) do 
		if not (seg.text == nil or #seg.text == 0) then
			table.insert(segments,seg)
		end
	end
end

-- build prompt
for idz,segment in ipairs(segments) do
	if segment.foreground == nil then
		print("ERROR IN "..segment.name)
		break
	end
	if segment.background == nil then
		print("ERROR IN "..segment.name)
		break
	end
	if not (idz  == 1) then
		buffer = buffer .. fgbgColor( segments[idz-1].background, segment.background)
		if not params.condensed then
			buffer = buffer .. "█" -- unicode 2588  █ full block
		end
	  buffer = buffer .. params.separator
		if not params.condensed then
			buffer = buffer .. " "
		end
	end
	buffer = buffer .. fgbgColor( segment.foreground, segment.background)
	buffer = buffer .. segment.text

end

-- Round off
buffer = buffer .. reset()
if not (params.separator == '') then
	buffer = buffer .. fgColor( segments[#segments].background)
	if not params.condensed then
		buffer = buffer .. "█" -- unicode 2588  █ full block
	end
	buffer = buffer .. params.separator
  buffer = buffer .. reset()
end
buffer = buffer .. " "
print(buffer)


