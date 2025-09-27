local m = Map("oph5spdtst", translate("OPH5 SPD Test"))

m.template = "oph5spdtst/settings"

local s = m:section(TypedSection, "oph5spdtst", translate("Speed Test Settings"))

s.anonymous = true

local enabled = s:option(Flag, "enabled", translate("Enable speed test"), translate("Disable to hide the embedded Speed Test interface."))
enabled.default = enabled.enabled
enabled.rmempty = false

local flash = s:option(Flag, "use_flash_stored_payload", translate("Store payload on flash"), translate("Generate and keep the download payload inside persistent storage instead of /tmp."))
flash.default = flash.disabled
flash.rmempty = false

local ping_samples = s:option(Value, "ping_samples", translate("Ping samples"), translate("Number of pings sent to estimate latency and jitter."))
ping_samples.datatype = "range(1,100)"
ping_samples.default = "10"
ping_samples.rmempty = false

local ping_timeout = s:option(Value, "ping_timeout", translate("Ping timeout (ms)"), translate("Time limit in milliseconds before a ping request is considered failed."))
ping_timeout.datatype = "uinteger"
ping_timeout.default = "5000"
ping_timeout.rmempty = false

local ul_data_size = s:option(Value, "ul_data_size", translate("Upload data size (MB)"), translate("Amount of random data generated for each upload test."))
ul_data_size.datatype = "range(1,200)"
ul_data_size.default = "5"
ul_data_size.rmempty = false

local dl_threads = s:option(Value, "dl_threads", translate("Download threads"), translate("Parallel HTTP connections used during download tests."))
dl_threads.datatype = "range(1,32)"
dl_threads.default = "6"
dl_threads.rmempty = false

local ul_threads = s:option(Value, "ul_threads", translate("Upload threads"), translate("Parallel HTTP connections used during upload tests."))
ul_threads.datatype = "range(1,32)"
ul_threads.default = "6"
ul_threads.rmempty = false

local dl_duration = s:option(Value, "dl_duration", translate("Download duration (s)"), translate("Target duration in seconds for download measurements."))
dl_duration.datatype = "range(5,600)"
dl_duration.default = "12"
dl_duration.rmempty = false

local ul_duration = s:option(Value, "ul_duration", translate("Upload duration (s)"), translate("Target duration in seconds for upload measurements."))
ul_duration.datatype = "range(5,600)"
ul_duration.default = "12"
ul_duration.rmempty = false

return m
