add_rules("mode.debug", "mode.release")

set_languages("cxx23")
set_warnings("all", "error")

-- git submodule add https://github.com/MarcusMogg/xmake-plugins.git plugins
-- git submodule update --init --recursive
-- add_plugindirs(path.join(os.projectdir(), "plugins"))

includes("hello")
