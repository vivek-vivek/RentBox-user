// import 'package:dio/dio.dart';

// class DioService {
//   Dio dio = Dio();

//   DioService() {
//     Dio dio = Dio();

//     // Add a request interceptor
//     dio.interceptor.request.onSend = (Options options) {
//       // Add the headers
//       options.headers["Content-Type"] = "application/json";
//       return options;
//     };

//     // Add a response interceptor
//     dio.interceptors.response.onError = (DioError e) {
//       // check the status code
//       if (e.response?.statusCode == 401) {
//         print("Unauthorized Error");
//       } else if (e.response?.statusCode == 404) {
//         print("Not Found Error");
//       } else if (e.response?.statusCode >= 500) {
//         print("Server Error");
//       } else if (e.type == DioErrorType.CONNECT_TIMEOUT ||
//           e.type == DioErrorType.RECEIVE_TIMEOUT ||
//           e.type == DioErrorType.SEND_TIMEOUT) {
//         print("Timeout Error");
//       } else if (e.type == DioErrorType.CANCEL) {
//         print("Request Cancelled");
//       } else if (e.type == DioErrorType.DEFAULT) {
//         if (e.error.runtimeType == SocketException) {
//           print('Connection refused: ${e.error}');
//         } else {
//           // unknown error
//           print('Unknown error: ${e.error}');
//         }
//       }
//       // re-throw the error
//       return e;
//     };
//   }
// }
