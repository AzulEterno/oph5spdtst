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
local dispatcher = require "luci.dispatcher"

function index()
  if not nixio.fs.access("/etc/config/oph5spdtst") then return end

  entry({"admin","network","oph5spdtst"}, call("redirect_to_test"), _("OPH5 SPD Test"), 60)

  entry({"admin","network","oph5spdtst","test"},
        template("oph5spdtst/main"), _("Speed Test"), 10).leaf = true

  entry({"admin","network","oph5spdtst","settings"},
        cbi("oph5spdtst/settings"), _("Settings"), 20).leaf = true
end

function redirect_to_test()
  local dsp = require "luci.dispatcher"
  luci.http.redirect(dsp.build_url("admin","network","oph5spdtst","test"))
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
