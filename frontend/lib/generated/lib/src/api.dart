//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:coffee_machine_api/src/serializers.dart';
import 'package:coffee_machine_api/src/auth/api_key_auth.dart';
import 'package:coffee_machine_api/src/auth/basic_auth.dart';
import 'package:coffee_machine_api/src/auth/bearer_auth.dart';
import 'package:coffee_machine_api/src/auth/oauth.dart';
import 'package:coffee_machine_api/src/api/brew_api.dart';
import 'package:coffee_machine_api/src/api/coffee_machine_api.dart';
import 'package:coffee_machine_api/src/api/material_api.dart';
import 'package:coffee_machine_api/src/api/materials_api.dart';
import 'package:coffee_machine_api/src/api/operations_api.dart';
import 'package:coffee_machine_api/src/api/process_api.dart';
import 'package:coffee_machine_api/src/api/products_api.dart';

class CoffeeMachineApi {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  CoffeeMachineApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get BrewApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BrewApi getBrewApi() {
    return BrewApi(dio, serializers);
  }

  /// Get CoffeeMachineApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CoffeeMachineApi getCoffeeMachineApi() {
    return CoffeeMachineApi(dio, serializers);
  }

  /// Get MaterialApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MaterialApi getMaterialApi() {
    return MaterialApi(dio, serializers);
  }

  /// Get MaterialsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MaterialsApi getMaterialsApi() {
    return MaterialsApi(dio, serializers);
  }

  /// Get OperationsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  OperationsApi getOperationsApi() {
    return OperationsApi(dio, serializers);
  }

  /// Get ProcessApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ProcessApi getProcessApi() {
    return ProcessApi(dio, serializers);
  }

  /// Get ProductsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ProductsApi getProductsApi() {
    return ProductsApi(dio, serializers);
  }
}
