import 'package:chatapp/components/iconbutton2.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String? userName;

  @override
  ChatWidgetState createState() => ChatWidgetState();
}

class ChatWidgetState extends State<ChatWidget> {
  late final TextEditingController textController;
  final unfocusNode = FocusNode();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          automaticallyImplyLeading: false,
          leading: IconButton2(
            borderColor: const Color(0x00E7D1E8),
            borderRadius: 20,
            buttonSize: 32,
            fillColor: const Color(0x00E7D1E8),
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Theme.of(context).textTheme.bodyMedium!.color,
              size: 32,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Text(
              widget.userName!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
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
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      reverse: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: TextFormField(
                            controller: textController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: IconButton2(
                          borderColor:
                              Theme.of(context).textTheme.bodyMedium!.color!,
                          borderRadius: 28,
                          borderWidth: 1,
                          buttonSize: 40,
                          fillColor: Theme.of(context).colorScheme.primary,
                          icon: Icon(
                            Icons.send,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color!,
                            size: 24,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
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
    );
  }
}
