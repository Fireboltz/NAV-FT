mport 'dart:convert';
import 'package:flutter/services.dart';
import 'package:navft/enums/questionnaire_type.dart';
import 'package:navft/models/questionnaire.dart';

class QuestionnaireService {
  String _getQuestionnaireAssetPath(QuestionnaireType questionnaireType) {
    switch (questionnaireType) {
      case QuestionnaireType.satisfaction:
        return 'assets/questionnaires/satisfaction_with_life_scale.json';
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