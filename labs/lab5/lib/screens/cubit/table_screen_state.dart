abstract class TableScreenState{}

class TableScreenListState extends TableScreenState{
  final List<Map<String, dynamic>> ?list;

  TableScreenListState({this.list});
}