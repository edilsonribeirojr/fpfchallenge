Map<String, int> analyzeList(List<int> numbers) {
  int smallest = numbers[0];
  int largest = numbers[0];
  int sum = 0;

  for (var number in numbers) {
    if (number < smallest) smallest = number;
    if (number > largest) largest = number;
    sum += number;
  }

  return {
    'smallest': smallest,
    'largest': largest,
    'sum': sum,
  };
}

void main() {}
