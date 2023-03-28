import 'dart:math';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(MyApp());
}

// Classe principal que gerencia o estado do aplicativo e a interface do usuário
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  stt.SpeechToText? _speech; // Instância da biblioteca speech_to_text
  bool _isListening = false; // Estado atual da escuta

  // Método chamado quando o aplicativo é iniciado, para inicializar a instância da biblioteca speech_to_text
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  // Inicia a escuta do reconhecimento de voz
  void startListening() async {
    bool available = await _speech!.initialize(
      onError: (val) => print('onError: $val'),
      onStatus: (val) => print('onStatus: $val'),
    );
    if (available) {
      _speech!.listen(
        onResult: (val) {
          setState(() {
            String speechText = val.recognizedWords;
            processSpeech(speechText);
          });
        },
      );
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  // Interrompe a escuta do reconhecimento de voz
  void stopListening() {
    _speech!.stop();
  }

  // Processa o texto obtido pelo reconhecimento de voz
  void processSpeech(String speechText) {
    // Aqui, você pode usar expressões regulares ou outro método de sua escolha para identificar se o texto é uma pergunta ou uma tentativa de adivinhação.
    // Atualize a interface do usuário de acordo.
  }

  // Constrói a interface do usuário do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Jogo de Adivinhação')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: !_isListening ? startListening : stopListening,
              child: Text(_isListening ? 'Parar escuta' : 'Iniciar escuta'),
            ),
            // Adicione um widget para exibir a resposta atual (sim/não/dica) e as perguntas feitas.
            // Exemplo: ListView.builder ou Column com Text widgets.
          ],
        ),
      ),
    );
  }
}


