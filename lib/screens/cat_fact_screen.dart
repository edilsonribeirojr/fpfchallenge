import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatFactScreen extends StatefulWidget {
  @override
  CatFactScreenState createState() => CatFactScreenState();
}

class CatFactScreenState extends State<CatFactScreen> {
  String _fact = '';
  bool _isLoading = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchCatFact();
  }

  // Função para buscar um novo fato
  Future<void> _fetchCatFact() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final response = await http.get(Uri.parse('https://catfact.ninja/fact'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _fact = data['fact'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load fact';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cat Fact')),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _error.isNotEmpty
                ? Text(_error, style: TextStyle(color: Colors.red))
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _fact,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _fetchCatFact,  // Recarregar o fato
                          child: Text('Get New Fact'),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
