local uv = require('luv')
local M = {}


-- local TcpStream = {}
-- TcpStream.__index = TcpStream
--
-- function M.connect()
--   local host, port = "127.0.0.1", 3456
--   local client = uv.new_tcp()
--   local mt = setmetatable({
--     _socket = client,
--     _stream_error = nil
--   }, TcpStream)
--   uv.tcp_connect(client, host, port, function (err)
--     mt._stream_error = mt._stream_error or err
--   end)
--
--   uv.write(mt._socket, data, function(err)
--     if err then
--       error(mt._stream_error or err)
--     end
--   end)
--
--   -- local tcp = assert(socket.tcp())
--   --
--   -- tcp:connect(host, port);
--   --note the newline below
--   --tcp:send(
--   local hello = [[{
--     "method": "hello",
--     "id": "arbitrary-something",
--     "params": [{"me": {"editor":"nvim"}}]
--  }]]
--
--   -- while true do
--   --     local s, status, partial = tcp:receive()
--   --     print(s or partial)
--   --     if status == "closed" then break end
--   -- end
--   -- tcp:close()
-- end
--
-- vim.keymap.set("n", "<leader>z", M.connect, { silent = true})
return M
