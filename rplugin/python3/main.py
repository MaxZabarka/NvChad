# websocket_server.py

import asyncio
import pynvim
import websockets

@pynvim.plugin
class WebSocketServer(object):
    def __init__(self, nvim):
        self.nvim = nvim
        self.server = None

    @pynvim.function('StartServer', sync=False)
    async def start_server(self, args):
        self.nvim.out_write('Started WebSocket server on localhost:8765\n')
        async def handler(websocket, path):
            # This function will be called for each connection.
            # It will run for the lifetime of the connection.
            while True:
                msg = await websocket.recv()
                self.nvim.async_call(lambda: self.nvim.out_write(f'Received message: {msg}\n'))

        # Start the server
        self.server = await websockets.serve(handler, 'localhost', 8765)
        self.nvim.out_write('Started WebSocket server on localhost:8765\n')

    @pynvim.function('StopServer', sync=False)
    async def stop_server(self, args):
        if self.server:
            self.server.close()
            await self.server.wait_closed()
            self.nvim.out_write('Stopped WebSocket server\n')
