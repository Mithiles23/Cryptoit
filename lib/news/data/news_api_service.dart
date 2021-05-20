import 'package:chopper/chopper.dart';


part 'news_api_service.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class NewsApiService extends ChopperService{

  @Get(path: "/")
  Future<Response> getNews({
    @Query("q") String q = "crypto",
    @Query("from") String from = "2021-05-20",
    @Query("sortBy") String sort = "publishedAt",
    @Query("apiKey") String apiKey = "76602acb8dd54507881b7ba66b93db76",
  });

  static NewsApiService create(){

    final client = ChopperClient(baseUrl: "https://newsapi.org/v2/eveything?language=en",
      services: [
        _$NewsApiService(),
      ],
      converter: JsonConverter()
    );

    return _$NewsApiService(client);

  }

}
