import '../../../api/routes/places_routes.dart';
import '../../../models/prediction.dart';

typedef Failure = void Function(String error);
typedef Success = void Function(List<String> predictions);

abstract class GetPredictionsUseCaseProtocol {
  void execute({required String input, required Success success, required Failure failure});
}

class GetPredictionsUseCase extends GetPredictionsUseCaseProtocol {
  PlacesRoutesProtocol routes;

  GetPredictionsUseCase({required this.routes});

  @override
  void execute({required String input, required Success success, required Failure failure}) {
    routes.getPredications(
      input: input,
      success: (response) {
        final predictionsList = response['predictions'] as List;
        final predictions = predictionsList.fold<List<String>>([], _foldPredictionsList);

        success(predictions);
      },
      failure: (error) {
        failure(error.message);
      },
    );
  }

  List<String> _foldPredictionsList(List<String> predictions, dynamic predictionMap) {
    final prediction = Prediction.fromMap(predictionMap as Map<String, dynamic>);
    predictions.add(prediction.description);

    return predictions;
  }
}
