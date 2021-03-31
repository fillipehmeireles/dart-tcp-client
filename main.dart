import 'tcp-client.dart';

main(List<String> args) {
  var conn = TCPClient('localhost', 4000);
  conn.connectToServer();
}
