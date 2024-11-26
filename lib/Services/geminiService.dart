import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:yesilsepet/current_recipe.dart';

final API_KEY = "AIzaSyC_7lz4zEWcdzvWGiAbPe5YUWeM7vQUx88";


Future<String> giveGeminiData() async{
  var ingredients = CurrentRecipe().ingredients;
  var preferences = CurrentRecipe().preferences;
  return talkWithGemini("Can you create me a recipe with the ingredients: ${ingredients}"
      "considering the preferences in ${preferences}?");
}


Future<String> talkWithGemini(String msg) async{
  final model = GenerativeModel(model: 'gemini-pro', apiKey: API_KEY);
  final content = Content.text(msg);
  final response = await model.generateContent([content]);
  print("Response from gemini is: ${response.text}");
  return response.text.toString();
}