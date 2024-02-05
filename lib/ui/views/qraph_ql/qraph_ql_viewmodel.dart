import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stacked/stacked.dart';

class QraphQlViewModel extends BaseViewModel {
  final String _query = """
    query users {
      users {
        id
        name
        rocket
        twitter
      }
    }
  """;

  String get query => _query;

  final String _jobsQuery = '''
    query {
      jobs {
        id
        title
        company {
          name
        }
      }
    }
''';

  String get jobsQuery => _jobsQuery;

  final String _spaceXDragons = """
query Dragons {
  dragons {
    name
    first_flight
    diameter {
      feet
    }
    launch_payload_mass {
      lb
    }
  }
}
""";

  String get spaceXDragons => _spaceXDragons;

  final String _spaceXShips = """
query Ships {
  ships {
    id
    model
    name
    type
    status
  }
}
""";

  String get spaceXShips => _spaceXShips;

  final String _nodeQl = """
      query getImagesByCategory(\$imageCategory: String) {
        images(category: \$imageCategory) {
          title
          owner
          category
          url
        }
      }
""";

  String get nodeQL => _nodeQl;
}
