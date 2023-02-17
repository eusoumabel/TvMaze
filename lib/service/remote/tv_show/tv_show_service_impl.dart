import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/service/configuration/constants/api_constants.dart';
import 'package:tv_maze/service/configuration/service/http_method.dart';
import 'package:tv_maze/service/configuration/service/safe_request.dart';
import 'package:tv_maze/service/configuration/service/safe_service.dart';
import 'package:tv_maze/service/configuration/service/safe_service_impl.dart';
import 'package:tv_maze/service/model/tv_show_model.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_service.dart';

class TvShowServiceImpl extends TvShowService {
  final SafeService _service = SafeServiceImpl();

  @override
  AsyncResult<List<TvShowModel>, Exception> getTvShows() async {
    final request = SafeRequest(
      path: ApiConstants.kGetShows,
      method: HttpMethod.get,
    );

    try {
      final response = await _service.doRequest(request);
      return Success(response.data);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
