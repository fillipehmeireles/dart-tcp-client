import 'dart:io';

class TCPClient {
  String _host;
  int _port;
  TCPClient(this._host, this._port);

  void disconnectFromServer(Socket _tcpClient) {
    _tcpClient.close();
  }

  void Done(Socket _tcpClient) {
    print("Task done");
    disconnectFromServer(_tcpClient);
  }

  void onError(Socket _tcpClient, Error e) {
    print(e);
    disconnectFromServer(_tcpClient);
  }

  void connectToServer() async {
    Socket socket = await Socket.connect(this._host, this._port);
    socket.listen((event) {
      print(String.fromCharCodes(event).trim());
      print(socket.remoteAddress);
    }, onError: this.onError, cancelOnError: false);
  }
}
