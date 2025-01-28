-- Only load if the extension variable is false, will be defined by setup if not defined
if vim.g.codicons_extension_cmp_disable then
  return
end
require("cmp").register_source("codicons", require("codicons.extensions.cmp"))
