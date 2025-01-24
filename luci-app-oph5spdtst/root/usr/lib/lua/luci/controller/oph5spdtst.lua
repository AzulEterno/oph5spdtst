--[[
--File: oph5spdtst.lua
--Relative Path: \
--File Created: Friday, 24th January 2025 14:44:13
--Author: Azuroso
-------
--Last Modified: Friday, 24th January 2025 14:44:14
-------
--Copyright 2025 Azuroso
--]]

module("luci.controller.oph5spdtst", package.seeall)



function index() 
	if not nixio.fs.access("/etc/config/oph5spdtst") then
		return
	end

	local page = entry({"admin", "network", "oph5spdtst"}, template("oph5spdtst/main"), _("OPH5 SPD Test"), 60)
	page.dependent = false
	page.acl_depends = { "luci-app-oph5spdtst" }
end
