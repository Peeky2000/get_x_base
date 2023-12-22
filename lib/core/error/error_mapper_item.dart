part of 'error_to_string_mapper.dart';

abstract class ErrorToStringMapperItem {
  ErrorToStringMapperItem(this.key);

  final String key;

  String getDisplay(dynamic exception) {
    return key;
  }

  bool isMatch(Exception exception);
}

class NoNetworkMapperItem extends ErrorToStringMapperItem {
  NoNetworkMapperItem() : super(LocaleKeys.noInternet.tr);

  @override
  bool isMatch(Exception exception) => exception is NetworkIssueException;
}

class GeneralErrorMapperItem extends ErrorToStringMapperItem {
  GeneralErrorMapperItem() : super(LocaleKeys.errGeneral.tr);

  @override
  String getDisplay(exception) {
    String message = exception.toString();
    return message.isEmpty ? key : message;
  }

  @override
  bool isMatch(Exception exception) => exception is GeneralException;
}

class HttpErrorResponseMapperItem extends ErrorToStringMapperItem {
  HttpErrorResponseMapperItem() : super(LocaleKeys.errGeneral.tr);

  @override
  String getDisplay(dynamic exception) {
    if (exception is ServerException && exception.hasError) {
      final dio.Response? errorResp = exception.error.response;
      if (errorResp != null) {
        BaseResponseModel<dynamic> result =
            BaseResponseModel.fromJson(errorResp.data, (json) => json);
        return result.message;
      }
    }
    return key;
  }

  @override
  bool isMatch(Exception exception) => exception is ServerException;
}
