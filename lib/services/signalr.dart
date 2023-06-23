import 'dart:io';

import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SignalRHub {
  final String url = "https://localhost:7134/chatHub?username=";
  late final HubConnection hubConnection;

  SignalRHub(String name) {
    Logger logger = Logger("ChatPageViewModel");

    try {
      hubConnection = HubConnectionBuilder()
          .withUrl(
            url + name,
            options: HttpConnectionOptions(
              httpClient: WebSupportingHttpClient(logger,
                  httpClientCreateCallback: _httpClientCreateCallback),
              logger: logger,
              logMessageContent: true,
            ),
          )
          .withAutomaticReconnect(retryDelays: [2000, 5000, 10000, 20000])
          .configureLogging(logger)
          .build();

      hubConnection.onclose(({Exception? error}) => print("Connection Closed"));
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future startHub() async {
    await hubConnection.start();
  }

  void _httpClientCreateCallback(Client httpClient) {
    HttpOverrides.global = HttpOverrideCertificateVerificationInDev();
  }

  void getMessages(void Function(List<Object?>?) newMethod) {
    hubConnection.on("ReceiveMessage", newMethod);
  }

  void sendMensagens(String nome, String message) {
    if (hubConnection.connectionId == null) {
      return;
    }

    hubConnection.invoke("SendMessage",
        args: [hubConnection.connectionId!, nome, message]);
  }
}

class HttpOverrideCertificateVerificationInDev extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
