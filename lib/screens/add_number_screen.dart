import 'package:flutter/material.dart';
import 'package:fpf_project/utils/list_function.dart'; // Importa a função analyzeList

class AddNumberScreen extends StatefulWidget {
  const AddNumberScreen({super.key});

  @override
  AddNumberScreenState createState() => AddNumberScreenState(); // Alterado aqui
}

class AddNumberScreenState extends State<AddNumberScreen> {  // Alterado aqui
  final TextEditingController _numberController = TextEditingController();
  String _result = '';

  void _processNumbers() {
    String input = _numberController.text;
    List<String> numberStrings = input.split(',');
    List<int> numbers = [];

    // Converte a lista de strings para inteiros
    for (var number in numberStrings) {
      int? parsedNumber = int.tryParse(number.trim());
      if (parsedNumber != null) {
        numbers.add(parsedNumber);
      }
    }

    // Chama a função analyzeList para calcular o menor, maior e a soma
    if (numbers.isNotEmpty) {
      final result = analyzeList(numbers);

      setState(() {
        _result = 'Smallest: ${result['smallest']}, Largest: ${result['largest']}, Sum: ${result['sum']}';
      });
    } else {
      setState(() {
        _result = 'Invalid input. Please enter valid numbers.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Numbers')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Enter numbers separated by commas'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processNumbers,
              child: Text('Process Numbers'),
            ),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
