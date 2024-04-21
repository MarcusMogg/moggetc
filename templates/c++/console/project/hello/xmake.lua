add_requires("catch2")

target("hello-lib")
    set_kind("static")
    add_files("hello.cc")
    -- remove_files("*_test.cc")

-- https://xmake.io/#/zh-cn/manual/project_target?id=targetadd_tests
for _, file in ipairs(os.files("*_test.cc")) do
    local name = path.basename(file)
    target(name)
        set_kind("binary")
        set_default(false)
        add_deps("hello-lib")
        add_packages("catch2")
        add_files(path.filename(file))
        add_tests("default")
end
