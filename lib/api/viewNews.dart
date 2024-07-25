import 'package:newss_app/api/repo.dart';
import 'package:newss_app/model/fetchData.dart';

class ViewNews {
  final api = Repo();

  Future<FetchData> fetchDataApi() async {
    final response = await api.fetchDataApi();
    return response;
  }
}
