//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:built_collection/built_collection.dart';
import 'package:coffee_machine_api/src/api_util.dart';
import 'package:coffee_machine_api/src/model/material_response_dto.dart';

class MaterialApi {

  final Dio _dio;

  final Serializers _serializers;

  const MaterialApi(this._dio, this._serializers);

  /// apiMaterialGet
  /// 
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BuiltList<MaterialResponseDTO>] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BuiltList<MaterialResponseDTO>>> apiMaterialGet({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/Material';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    BuiltList<MaterialResponseDTO>? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(BuiltList, [FullType(MaterialResponseDTO)]),
      ) as BuiltList<MaterialResponseDTO>;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BuiltList<MaterialResponseDTO>>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// apiMaterialIdDelete
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> apiMaterialIdDelete({ 
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/Material/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// apiMaterialIdGet
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [MaterialResponseDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<MaterialResponseDTO>> apiMaterialIdGet({ 
    required int id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/Material/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    MaterialResponseDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(MaterialResponseDTO),
      ) as MaterialResponseDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<MaterialResponseDTO>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// apiMaterialIdPut
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [materialName] 
  /// * [materialUnit] 
  /// * [costPerUnit] 
  /// * [stockQuantity] 
  /// * [isConsumable] 
  /// * [imageUrl] 
  /// * [contentType] 
  /// * [contentDisposition] 
  /// * [headers] 
  /// * [length] 
  /// * [name] 
  /// * [fileName] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [MaterialResponseDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<MaterialResponseDTO>> apiMaterialIdPut({ 
    required int id,
    String? materialName,
    String? materialUnit,
    double? costPerUnit,
    double? stockQuantity,
    bool? isConsumable,
    String? imageUrl,
    String? contentType,
    String? contentDisposition,
    BuiltMap<String, BuiltList<String>>? headers,
    int? length,
    String? name,
    String? fileName,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/Material/{id}'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(int)).toString());
    final _options = Options(
      method: r'PUT',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'multipart/form-data',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = FormData.fromMap(<String, dynamic>{
        if (materialName != null) r'MaterialName': encodeFormParameter(_serializers, materialName, const FullType(String)),
        if (materialUnit != null) r'MaterialUnit': encodeFormParameter(_serializers, materialUnit, const FullType(String)),
        if (costPerUnit != null) r'CostPerUnit': encodeFormParameter(_serializers, costPerUnit, const FullType(double)),
        if (stockQuantity != null) r'StockQuantity': encodeFormParameter(_serializers, stockQuantity, const FullType(double)),
        if (isConsumable != null) r'IsConsumable': encodeFormParameter(_serializers, isConsumable, const FullType(bool)),
        if (imageUrl != null) r'ImageUrl': encodeFormParameter(_serializers, imageUrl, const FullType(String)),
        if (contentType != null) r'ContentType': encodeFormParameter(_serializers, contentType, const FullType(String)),
        if (contentDisposition != null) r'ContentDisposition': encodeFormParameter(_serializers, contentDisposition, const FullType(String)),
        if (headers != null) r'Headers': encodeFormParameter(_serializers, headers, const FullType(BuiltMap, [FullType(String), FullType(BuiltMap)])),
        if (length != null) r'Length': encodeFormParameter(_serializers, length, const FullType(int)),
        if (name != null) r'Name': encodeFormParameter(_serializers, name, const FullType(String)),
        if (fileName != null) r'FileName': encodeFormParameter(_serializers, fileName, const FullType(String)),
      });

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    MaterialResponseDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(MaterialResponseDTO),
      ) as MaterialResponseDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<MaterialResponseDTO>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// apiMaterialPost
  /// 
  ///
  /// Parameters:
  /// * [materialName] 
  /// * [materialUnit] 
  /// * [costPerUnit] 
  /// * [stockQuantity] 
  /// * [isConsumable] 
  /// * [imageUrl] 
  /// * [contentType] 
  /// * [contentDisposition] 
  /// * [headers] 
  /// * [length] 
  /// * [name] 
  /// * [fileName] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [MaterialResponseDTO] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<MaterialResponseDTO>> apiMaterialPost({ 
    String? materialName,
    String? materialUnit,
    double? costPerUnit,
    double? stockQuantity,
    bool? isConsumable,
    String? imageUrl,
    String? contentType,
    String? contentDisposition,
    BuiltMap<String, BuiltList<String>>? headers,
    int? length,
    String? name,
    String? fileName,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/Material';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'multipart/form-data',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = FormData.fromMap(<String, dynamic>{
        if (materialName != null) r'MaterialName': encodeFormParameter(_serializers, materialName, const FullType(String)),
        if (materialUnit != null) r'MaterialUnit': encodeFormParameter(_serializers, materialUnit, const FullType(String)),
        if (costPerUnit != null) r'CostPerUnit': encodeFormParameter(_serializers, costPerUnit, const FullType(double)),
        if (stockQuantity != null) r'StockQuantity': encodeFormParameter(_serializers, stockQuantity, const FullType(double)),
        if (isConsumable != null) r'IsConsumable': encodeFormParameter(_serializers, isConsumable, const FullType(bool)),
        if (imageUrl != null) r'ImageUrl': encodeFormParameter(_serializers, imageUrl, const FullType(String)),
        if (contentType != null) r'ContentType': encodeFormParameter(_serializers, contentType, const FullType(String)),
        if (contentDisposition != null) r'ContentDisposition': encodeFormParameter(_serializers, contentDisposition, const FullType(String)),
        if (headers != null) r'Headers': encodeFormParameter(_serializers, headers, const FullType(BuiltMap, [FullType(String), FullType(BuiltMap)])),
        if (length != null) r'Length': encodeFormParameter(_serializers, length, const FullType(int)),
        if (name != null) r'Name': encodeFormParameter(_serializers, name, const FullType(String)),
        if (fileName != null) r'FileName': encodeFormParameter(_serializers, fileName, const FullType(String)),
      });

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    MaterialResponseDTO? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(MaterialResponseDTO),
      ) as MaterialResponseDTO;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<MaterialResponseDTO>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
