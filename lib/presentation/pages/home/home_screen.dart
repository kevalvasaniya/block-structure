import 'package:bloc_project_structure/manager/manager.dart';
import 'package:bloc_project_structure/model/home_model.dart';
import 'package:bloc_project_structure/presentation/bloc/home/home_bloc.dart';
import 'package:bloc_project_structure/presentation/bloc/home/home_event.dart';
import 'package:bloc_project_structure/presentation/bloc/home/home_state.dart';
import 'package:bloc_project_structure/presentation/widgets/app_text.dart';
import 'package:bloc_project_structure/presentation/widgets/appbars.dart';
import 'package:bloc_project_structure/presentation/widgets/common_widgets.dart';
import 'package:bloc_project_structure/utils/keys.dart';
import 'package:bloc_project_structure/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc? _homeBloc;
  List<UserModel>? homeDataList;
  var isLoading = false;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _homeBloc!.add(InitHomeAPIDataEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarTitle(title: home),
      body: body(),
    );
  }

  /// Body Widget
  Widget body(){
    return BlocProvider(
      create: (context) {
        return HomeBloc(HomeInitialState());
      },
      child: BlocListener<HomeBloc,HomeState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case ShowStartLoaderState:
                setState(() {
                  isLoading = true;
                });
                break;
              case HomeInitialState:
                homeDataList = GetIt.instance<Manager>().homeManager.homeData.value;
                break;
              case ShowEndLoaderState:
                setState(() {
                  isLoading = false;
                });
                break;
            }
          },
          child: BlocBuilder<HomeBloc,HomeState>(
              builder: (context, state) {
                _homeBloc = BlocProvider.of<HomeBloc>(context);
                return  isLoading ?
                circularProgress() :
                homeDataList==null || homeDataList!.isEmpty ?
                noDataFoundWidget()  :
                userDataWithListView();
              }
          )
      ),
    );
  }

  /// No Data Found!
  Widget noDataFoundWidget(){
    return Center(
      child: appText(
          noDataFound
      ),
    );
  }

  /// ListView With User Data
  Widget userDataWithListView(){
    return ListView.builder(
      itemCount: homeDataList!.length,
      itemBuilder: (context, index){
        var data = homeDataList![index];
        return userDataWithListTile(data);
      },
    );
  }

  /// ListTile With User Data
  Widget userDataWithListTile(UserModel data){
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: padding10),
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
        child: appText(
          data.id.toString(),
          color: white,
          fontSize: fontSize14,
          fontWeight: titleTextWeight600
        ),
      ),
      title: appText(
        data.username.toString(),
        color: black,
        fontSize: fontSize16,
        fontWeight: titleTextWeight600
      ),
      subtitle: appText(
        data.email.toString(),
        color: black,
        fontSize: fontSize12,
        fontWeight: normalTextWeight400
      ),
    );
  }
}

