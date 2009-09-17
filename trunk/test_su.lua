require("luasofia")

function time_test()

  print (luasofia.su_nanotime())

  print (luasofia.su_monotime())

  now = luasofia.su_now()
  sthen = now

  print(luasofia.su_time_print(now))

  for us=0,1000000,300 do 
    sthen.tv_sec = now.tv_sec
    sthen.tv_usec = now.tv_usec + us
    if sthen.tv_usec >= 1000000 then
      sthen.tv_usec = sthen.tv_usec - 1000000
      sthen.tv_sec = sthen.tv_sec + 1
    end
    t1 = luasofia.su_duration(now, sthen)
    t2 = luasofia.su_duration(sthen, now)
    if t1 ~= -t2 then
      print("ERROR: t1 ~= -t2")
    end
  end
end

function do_init(root, p)

end

function do_destroy(root, p)

end

--luasofia.su_init()

time_test()

root = luasofia.su_root_create(nil);
if (not root) then
    print("ERROR: su_root_create")
    exit(1)
end

print("test_su: testing " .. luasofia.su_root_name(root) .. " port implementation")

luasofia.su_root_threading(root, 0)

--[[
if luasofia.su_clone_start(root, ping, pinger, do_init, do_destroy) ~= 0 then
    print("su_clone_start")
    exit(1)
end

if luasofia.su_clone_start(root, pong, &ponger, do_init, do_destroy) != 0 then
    print("su_clone_start")
    exit(1)
end
--]]

luasofia.su_deinit()

