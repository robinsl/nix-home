local plugins = {
}

-- List of modules to load
local modules = { "colorscheme", }

-- Function to load and aggregate modules
local function loadModules(modules)
    local results = {}

    for _, item in ipairs(plugins) do
        table.insert(results, item)
    end

    for _, moduleName in ipairs(modules) do
        local loadedModule = require("plugins." .. moduleName)
        -- Flatten the results from each module
        for _, item in ipairs(loadedModule) do
            table.insert(results, item)
        end
    end

    return results
end

-- Load and return all modules' results
local allPlugins = loadModules(modules)

return allPlugins

