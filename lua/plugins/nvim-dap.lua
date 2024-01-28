local debugging_signs = require("util.icons").debugging_signs

return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- set custom icons
		for name, sign in pairs(debugging_signs) do
			sign = type(sign) == "table" and sign or { sign }
			vim.fn.sign_define(
				"Dap" .. name,
				{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
			)
		end

		-- setup dap
		dapui.setup()

	end,
	dependencies = "rcarriga/nvim-dap-ui",
}
