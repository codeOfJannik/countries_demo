import 'package:countries_demo/common/constants/app_constants.dart';
import 'package:countries_demo/common/data/query.dart';
import 'package:countries_demo/common/data/response_parser.dart';
import 'package:graphql/client.dart';

class GqlCountryApi {
  final GraphQLClient _client;

  GqlCountryApi()
      : _client = GraphQLClient(
          link: HttpLink(AppConstants.countryApiBaseUrl),
          cache: GraphQLCache(),
        );

  Future<QueryResult<T>> query<T>(Query query, {ApiResponseParser<T>? parser}) {
    final options = QueryOptions<T>(
      document: gql(query.gqlQuery),
      parserFn: parser?.parse,
    );
    return _client.query(options);
  }
}
