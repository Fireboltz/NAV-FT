import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:navft/questionnaire/enums/questionnaire_type.dart';
import 'package:navft/questionnaire/models/questionnaire.dart';

class QuestionnaireService {
  String _getQuestionnaireAssetPath(QuestionnaireType questionnaireType) {
    switch (questionnaireType) {
      case QuestionnaireType.body:
        return 'assets/questionnaires/body.json';
      case QuestionnaireType.brake:
        return 'assets/questionnaires/brakes.json';
      case QuestionnaireType.electricals:
        return 'assets/questionnaires/electricals.json';
      case QuestionnaireType.finishing:
        return 'assets/questionnaires/finishing.json';
      case QuestionnaireType.glasses:
        return 'assets/questionnaires/safety_glasses.json';
      case QuestionnaireType.horn:
        return 'assets/questionnaires/horn.json';
      case QuestionnaireType.info:
        return 'assets/questionnaires/info.json';
      case QuestionnaireType.painting:
        return 'assets/questionnaires/painting.json';
      case QuestionnaireType.roadTest:
        return 'assets/questionnaires/road_test.json';
      case QuestionnaireType.seatBelts:
        return 'assets/questionnaires/belts.json';
      case QuestionnaireType.signals:
        return 'assets/questionnaires/signals.json';
      case QuestionnaireType.speedometer:
        return 'assets/questionnaires/speedometer.json';
      case QuestionnaireType.steering:
        return 'assets/questionnaires/steering.json';
      case QuestionnaireType.suspension:
        return 'assets/questionnaires/suspension.json';
      case QuestionnaireType.tyres:
        return 'assets/questionnaires/tyres.json';
      case QuestionnaireType.wiper:
        return 'assets/questionnaires/wipers.json';
      default:
        return null;
    }
  }

  Future<Questionnaire> getQuestionnaire(QuestionnaireType questionnaireType) async {
    final assetPath = _getQuestionnaireAssetPath(questionnaireType);
    final jsonData = await rootBundle.loadString(assetPath);
    final jsonDataDecoded = jsonDecode(jsonData);
    return Questionnaire.fromJson(jsonDataDecoded);
  }
}
