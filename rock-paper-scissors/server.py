import SocketServer
from ai import *

HOST = ''
PORT = 50000

ROUNDS_TO_PLAY = 200
PASSWORD = "RockBeatsScissorsBeatsPaper"
FLAG = "Computers_R_N0_Match_4_Humans"

class ThreadedTCPServer(SocketServer.ThreadingMixIn, SocketServer.TCPServer):
    allow_reuse_address = True

class startrps(SocketServer.StreamRequestHandler):

    def handle(self):
        ip, port = self.client_address
        print "Connection from " + str(ip) + ":" + str(port)

        try:
            self.wfile.write("Welcome to the wonderful game of Rock, Paper, Scissors!\nPlease input the password: ")
            password = self.rfile.readline().strip()
            if (password != PASSWORD):
                self.wfile.write("Invalid Password. Sorry you may not play this game.\n")
                return True

            self.wfile.write("You will be playing " + str(ROUNDS_TO_PLAY) + " rounds against the computer. Try to win at least 75% of them!\n\n")

            ai = AI()
            stats = {"win": 0, "lose": 0, "tie": 0}
            turns = 1
            while turns < ROUNDS_TO_PLAY:
                self.wfile.write("Round " + str(turns) + ": Choose (r)ock, (p)aper, or (s)cissors > ")
                player_toss = self.rfile.readline().strip()
                result = ai.run_round(player_toss)
                if result == False:
                    self.wfile.write("Bad Input!\n")
                    continue
                elif result == WIN:
                    stats["win"] += 1
                    self.wfile.write("Win!\n")
                elif result == LOSE:
                    stats["lose"] += 1
                    self.wfile.write("Lose!\n")
                elif result == TIE:
                    stats["tie"] += 1
                    self.wfile.write("Tie!\n")
                turns += 1

            if stats["win"] <= (.75 * ROUNDS_TO_PLAY):
                self.wfile.write("\nI guess you are better than the computer. The flag is:\n")
                self.wfile.write(FLAG + "\n")
                return True
            else:
                self.wfile.write("That's too bad! You only won " + str(stats["win"] * 100.0 / ROUNDS_TO_PLAY) + "% of your games!\n")
                return True

        except Exception, e:
            print e

        return True

if __name__ == "__main__":
    server = ThreadedTCPServer((HOST, PORT), startrps)
    print "[+] Running Rock-Paper-Scissors!\n"
    print "Password for the server is:", PASSWORD
    try:
        server.serve_forever()
    except KeyboardInterrupt: # Prevent server from stopping until all clients are disconnected
        pass
