import 'package:chatapp/components/iconbutton2.dart';
import 'package:chatapp/components/messages.dart';
import 'package:chatapp/message.dart';
import 'package:chatapp/services/signalr.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  ChatWidgetState createState() => ChatWidgetState();
}

class ChatWidgetState extends State<ChatWidget> {
  late final TextEditingController textController;
  final unfocusNode = FocusNode();
  late final SignalRHub hub;
  late String connectionId;
  bool visible = false;

  late final List<MessageModel> messages = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    hub = SignalRHub(widget.userName);
    textController = TextEditingController();
    hub.startHub().then((value) {
      hub.getMessages(
        (p0) {
          String nome = p0![1].toString() == hub.hubConnection.connectionId
              ? p0![2].toString()
              : "Tella";
          setState(() {
            messages.add(
              MessageModel(
                userId: p0![1].toString(),
                nome: nome,
                message: p0![3].toString(),
              ),
            );
            print(p0!.toString());
          });
        },
      );
      setState(() {
        visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible,
        replacement: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 231, 209, 232)),
          child: const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 75, 57, 239),
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color.fromARGB(255, 231, 209, 232),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 209, 196, 233),
              automaticallyImplyLeading: false,
              leading: IconButton2(
                borderColor: const Color(0x00E7D1E8),
                borderRadius: 20,
                buttonSize: 32,
                fillColor: const Color(0x00E7D1E8),
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                  size: 32,
                ),
                onPressed: () {
                  hub.hubConnection.stop();
                  Navigator.pop(context);
                },
              ),
              title: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Text(
                  widget.userName!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              actions: [
                Container(
                  width: 60,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0x00E7D1E8),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 2,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 231, 209, 232),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: messages.length,
                          padding: EdgeInsets.zero,
                          reverse: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (buildContext, int) {
                            return Message(
                              left:
                                  messages[messages.length - 1 - int].userId !=
                                      hub.hubConnection.connectionId,
                              message:
                                  messages[messages.length - 1 - int].message,
                              name: messages[messages.length - 1 - int].nome,
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 8, 0),
                              child: TextFormField(
                                controller: textController,
                                autofocus: true,
                                obscureText: false,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 209, 196, 233),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 89, 99),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 255, 89, 99),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: IconButton2(
                              borderColor: Colors.black,
                              borderRadius: 28,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor:
                                  const Color.fromARGB(255, 231, 209, 232),
                              icon: const Icon(
                                Icons.send,
                                color: Colors.black,
                                size: 24,
                              ),
                              onPressed: () {
                                hub.sendMensagens(
                                  widget.userName,
                                  textController.text,
                                );
                                textController.text = "";
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
