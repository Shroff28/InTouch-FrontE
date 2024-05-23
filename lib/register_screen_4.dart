import 'package:flutter/material.dart';

class RegisterScreen4 extends StatefulWidget {
  const RegisterScreen4({Key? key}) : super(key: key);

  @override
  _RegisterScreen4State createState() => _RegisterScreen4State();
}

class _RegisterScreen4State extends State<RegisterScreen4> {
  final List<String> _options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];

  final List<String> _selectedOptions = [];

  void _toggleSelection(String option) {
    setState(() {
      if (_selectedOptions.contains(option)) {
        _selectedOptions.remove(option);
      } else {
        _selectedOptions.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 69, 16, 194),
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              const Text(
                'Let me know more about you',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 250,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 138, 178, 221),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: _options.map((option) {
                    final isSelected = _selectedOptions.contains(option);
                    return GestureDetector(
                      onTap: () => _toggleSelection(option),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color.fromARGB(255, 69, 16, 194)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: isSelected
                                ? Colors.white
                                : const Color.fromARGB(255, 69, 16, 194),
                            width: 2.0,
                          ),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color.fromARGB(255, 69, 16, 194),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
