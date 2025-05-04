Map <String, int> analyzeList(List<int> numbers)
 {
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

void main() {
List<int> numbers = [1, 2, 3, 4, 5];

  final result = analyzeList(numbers);

  print('The smallest number is: ${result['smallest']}');
  print('The largest number is: ${result['largest']}');
  print('The sum is: ${result['sum']}');
}