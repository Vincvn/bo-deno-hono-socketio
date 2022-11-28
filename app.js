import { serve } from 'https://deno.land/std/http/server.ts'
import { Hono } from 'https://deno.land/x/hono/mod.ts'
import { Server } from "https://deno.land/x/socket_io@0.1.1/mod.ts"
const io = new Server()
io.on("connection", (socket) => {
  console.log(`${socket.id} connected`)
})
const app = new Hono()
const API_VERSION = "0.0.1"
let servers = []
servers.push(serve(io.handler(), {
     port: Deno.env.get("SOCKET_PORT") || 8001,
}))
servers.push(serve(app.fetch, {
    port: Deno.env.get("PORT") || 8000,
}))
await Promise.all(servers)
