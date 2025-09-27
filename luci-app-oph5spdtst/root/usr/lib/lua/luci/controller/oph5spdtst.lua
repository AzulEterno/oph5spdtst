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

local http = require "luci.http"
local json = require "luci.jsonc"
local uci = require "luci.model.uci"

function index()
    if not nixio.fs.access("/etc/config/oph5spdtst") then
        return
    end

    local root = entry({"admin", "network", "oph5spdtst"}, alias("admin", "network", "oph5spdtst", "test"), _("OPH5 SPD Test"), 60)
    root.dependent = false
    root.subindex = true
    root.acl_depends = { "luci-app-oph5spdtst" }

    local test = entry({"admin", "network", "oph5spdtst", "test"}, template("oph5spdtst/main"), _("Speed Test"), 10)
    test.leaf = true
    test.acl_depends = { "luci-app-oph5spdtst" }

    local settings = entry({"admin", "network", "oph5spdtst", "settings"}, cbi("oph5spdtst/settings"), _("Settings"), 20)
    settings.leaf = true
    settings.acl_depends = { "luci-app-oph5spdtst" }

    local config = entry({"admin", "network", "oph5spdtst", "config.js"}, call("action_config_js"), nil)
    config.leaf = true
    config.dependent = false
    config.acl_depends = { "luci-app-oph5spdtst" }
end

local function uci_flag_to_bool(value)
    if value == nil then
        return nil
    end
    if value == true or value == 1 or value == "1" then
        return true
    end
    if value == false or value == 0 or value == "0" then
        return false
    end
    return nil
end

local function uci_number(value)
    local number_value = tonumber(value)
    if not number_value then
        return nil
    end
    return number_value
end

function action_config_js()
    local cursor = uci.cursor()
    local config = cursor:get_all("oph5spdtst", "settings") or {}
    local payload = {
        enabled = uci_flag_to_bool(config.enabled),
        pingSamples = uci_number(config.ping_samples),
        pingTimeout = uci_number(config.ping_timeout),
        ulDataSize = uci_number(config.ul_data_size),
        dlThreads = uci_number(config.dl_threads),
        ulThreads = uci_number(config.ul_threads),
        dlDuration = uci_number(config.dl_duration),
        ulDuration = uci_number(config.ul_duration)
    }

    http.prepare_content("application/javascript")
    http.write("window.OPH5SPDTEST = ")
    http.write(json.stringify(payload))
    http.write(";\n")
end
