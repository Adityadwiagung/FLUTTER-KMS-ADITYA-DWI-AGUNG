Map<String, int> menghitungFrekuensi(List<String> inputList) {
  Map<String, int> frekuensi = {};
  for (String item in inputList) {
    if (frekuensi.containsKey(item)) {
      frekuensi[item] = frekuensi[item]! + 1;
    } else {
      frekuensi[item] = 1;
    }
  }

  return frekuensi;
}

void main() {
  List<String> input = ["js", "js", "js", "golang", "python", "js", "js", "golang", "rust"];
  Map<String, int> frekuensi = menghitungFrekuensi(input);

  frekuensi.forEach((key, value) {
    print("$key: $value");
  });
}
