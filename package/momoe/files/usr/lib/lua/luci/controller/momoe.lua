module("luci.controller.momoe", package.seeall)

function index()
	local page
	page = entry({"admin", "network", "momoe"}, cbi("momoe"), _("移远模块"), 100)
	page.dependent = true
	-- entry({"admin", "network", "momoe", "status"}, call("action_status"))
	-- entry({"admin", "network", "momoe", "status"})
end
