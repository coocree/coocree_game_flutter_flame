import 'dart:math';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

// Classe que gerencia a lógica do jogo de adivinhação
class GuessingGame extends Game {
  List<String> fruits = ['maçã', 'banana', 'laranja', 'kiwi', 'melancia']; // Lista de frutas do jogo
  String currentItem = ""; // Item atual que o jogador deve adivinhar
  Random random = Random(); // Objeto Random para selecionar itens aleatoriamente
  int score = 0; // Pontuação atual do jogador
  int totalItems = 0; // Total de itens no jogo

  // Construtor do jogo
  GuessingGame() {
    selectRandomItem();
    totalItems = fruits.length;
  }

  // Seleciona um item aleatório da lista de frutas
  void selectRandomItem() {
    currentItem = fruits[random.nextInt(fruits.length)];
  }

  // Responde às perguntas do jogador com base no item atual
  String respondToQuestion(String question) {
    // Implemente a lógica para responder às perguntas com base na currentItem e retorne "sim", "não" ou dicas.
    return "";
  }

  // Verifica se a tentativa de adivinhação do jogador está correta
  bool checkGuess(String guess) {
    if (guess.toLowerCase() == currentItem.toLowerCase()) {
      selectRandomItem();
      return true; // Adivinhação correta
    }
    return false; // Adivinhação incorreta
  }

  // Atualiza a pontuação do jogador e verifica se todos os itens foram adivinhados
  void updateScore() {
    score++;
    if (score == totalItems) {
      // O jogo termina, exiba uma mensagem de "Parabéns!" e reinicie o jogo ou retorne ao menu principal.
    }
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
  }

  @override
  void update(double dt) {
    // TODO: implement update
  }
}


