import 'package:bloc_project_structure/manager/implementations/home/home.dart';
import 'package:get_it/get_it.dart';

/// Overall App All The Manager Object Create This Class.
/// This Object To All API Manage.
class Manager {
  final HomeManager homeManager;
  Manager() : homeManager = HomeManager();
}

Manager get manager => GetIt.instance<Manager>();
