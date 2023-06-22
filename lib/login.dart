import 'package:chatapp/chat.dart';
import 'package:chatapp/components/textbutton2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late final TextEditingController nameTxtController;
  final unfocusNode = FocusNode();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nameTxtController = TextEditingController();
  }

  @override
  void dispose() {
    dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Container(
                    width: 263,
                    height: 444,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 60, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: SvgPicture.asset(
                                'assets/images/02-User-Oultine.svg',
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 60, 16, 0),
                              child: TextFormField(
                                controller: nameTxtController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'nameTxtController',
                                  const Duration(milliseconds: 0),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Digite seu nome',
                                  labelStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                  hintStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.bodyMedium!,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 80, 0, 0),
                            child: TextButton2(
                              onPressed: () async {
                                if (nameTxtController.text != null &&
                                    nameTxtController.text != '') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatWidget(
                                        userName: nameTxtController.text,
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Nome não pode ficar vazio',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .color!,
                                        ),
                                      ),
                                      duration:
                                          const Duration(milliseconds: 3000),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  );
                                }
                              },
                              text: 'Entrar',
                              options: TextButtonOptions(
                                width: 155,
                                height: 49,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                color: Theme.of(context).colorScheme.primary,
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium!,
                                elevation: 3,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
