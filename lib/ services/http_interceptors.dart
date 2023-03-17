import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v("Requisição para ${data.baseUrl}\nCabeçalhos: ${data.headers}\nCorpo: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if(data.statusCode ~/ 100 == 2) { //divisão inteira por 100 serve para filtrar o statusCode caso ele esteja fora do range 0-299, fazendo com que ele seja exibido como erro
      logger.i("Resposta para ${data.url}\nStatus da Resposta:${data.statusCode}\nCabeçalhos: ${data.headers}\nCorpo: ${data.body}");
      return data;
    } else{
      logger.e("Resposta para ${data.url}\nStatus da Resposta:${data.statusCode}\nCabeçalhos: ${data.headers}\nCorpo: ${data.body}");
      return data;
    }

  }

}