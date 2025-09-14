import http.server
import socketserver

PORT = 8000

class MyHandler(http.server.SimpleHTTPRequestHandler):def do_GET(self):
        if self.path == '/':
            self.path = '/index.html'  # Redirect to index.html
        return http.server.SimpleHTTPRequestHandler.do_GET(self)

with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    fco.logger.i(f"Serving at port {PORT}")
    httpd.serve_forever()