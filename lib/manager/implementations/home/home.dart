import 'package:bloc_project_structure/api/api.dart';
import 'package:bloc_project_structure/api/home/home.dart';
import 'package:bloc_project_structure/manager/abstractions/home/home.dart';
import 'package:bloc_project_structure/model/home_model.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/subjects.dart';

/// Inherit homeAbstraction to all the method use this class.
class HomeManager extends HomeAbstraction {

  final BehaviorSubject<List<UserModel>> homeData = BehaviorSubject<List<UserModel>>();

  set homeDataSet(data) {
    homeData.sink.add(data);
  }

  void closeHomeData() {
    homeData.close();
  }


  @override
  Future getHomeAPIData() async {
    HomeResponse<List<dynamic>> homeResponse = await GetIt.instance<API>().homeAPI.getHomeAPI();

    if (homeResponse.errorMessage == null) {
      List<UserModel> data = [];

      for (var element in homeResponse.response!) {
        data.add(UserModel.fromJson(element));
      }

      homeDataSet = data;
    }
  }
}
