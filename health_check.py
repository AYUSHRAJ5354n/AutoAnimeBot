import socket

HOST = "0.0.0.0"
PORT = 8080

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
    server.bind((HOST, PORT))
    server.listen(1)
    print(f"TCP health check running on port {PORT}...")
    
    while True:
        conn, _ = server.accept()
        conn.close()  # Close immediately to satisfy TCP checks
