local m,s,o
local SYS  = require "luci.sys"

m = Map("flowoffload")
m.title	= translate("Turbo ACC Acceleration Settings")
m:append(Template("flow/status"))

s = m:section(TypedSection, "flow")
s.addremove = false
s.anonymous = true

flow = s:option(Flag, "flow_offloading", translate("Enable flow offloading"))
flow.default = 0
flow.rmempty = false
flow.description = translate("Enable software flow offloading for connections")

hw = s:option(Flag, "flow_offloading_hw", translate("Enable HW NAT"))
hw.default = 0
hw.rmempty = true
hw.description = translate("Enable Hardware NAT")
hw:depends("flow_offloading", 1)

bbr = s:option(Flag, "bbr", translate("Enable BBR"))
bbr.default = 0
bbr.rmempty = false
bbr.description = translate("Bottleneck Bandwidth and Round-trip propagation time (BBR)")

dns = s:option(Flag, "dns", translate("DNS Acceleration"))
dns.default = 0
dns.rmempty = false
dns.description = translate("Enable DNS Cache Acceleration and anti ISP DNS pollution")

o = s:option(Value, "dns_server", translate("Upsteam DNS Server"))
o.default = "119.29.29.29,223.5.5.5"
o.description = translate("Muitiple DNS server can saperate with ','")
o:depends("dns", 1)

return m
