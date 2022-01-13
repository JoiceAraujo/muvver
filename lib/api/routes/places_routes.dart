import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class PlacesRoutesProtocol {
  void getPredications({required String input, required Success success, required Failure failure});
}

class PlacesRoutes extends PlacesRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getPredications({required String input, required Success success, required Failure failure}) {
    final endpoint = Endpoint(
      method: 'Get',
      path: '/place/autocomplete/json?input=$input&language=pt-BR&types=(cities)',
    );

    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
