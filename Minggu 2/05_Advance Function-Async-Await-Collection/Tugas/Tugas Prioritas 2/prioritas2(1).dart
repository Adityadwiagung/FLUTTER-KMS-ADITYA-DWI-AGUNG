void main(){
  List<List<int>> dataList = [
    [1, 2],
    [2, 3],
    [4, 5],
    [6, 7],
  ];

  Map<int, int> mapDataList = Map.fromIterable(
    dataList,
    key: (item) => item[0],
    value: (item) => item[1],
  );

  print(mapDataList);
}

