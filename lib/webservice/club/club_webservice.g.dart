// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_webservice.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ClubWebService implements ClubWebService {
  _ClubWebService(this._dio, {this.baseUrl});

  final Dio _dio;

  String baseUrl = "https://www.strava.com/api/v3/"

  @override
  Future<List<Club>> getClub(Int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = {"Authorization":"Bearer $AppConstants.ACCESS_TOKEN"};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Club>>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/clubs/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Club.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
