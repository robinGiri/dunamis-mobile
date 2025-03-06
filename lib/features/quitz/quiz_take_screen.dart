import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuizTakeScreen extends StatefulWidget {
  @override
  _QuizTakeScreenState createState() => _QuizTakeScreenState();
}

class _QuizTakeScreenState extends State<QuizTakeScreen> {
  String selectedCategory = "";
  List categories = [];
  List questions = [];
  Map<String, String> answers = {};
  bool quizStarted = false;
  Map<String, dynamic>? result;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  // Fetch categories from the API
  Future<void> fetchCategories() async {
    final url = Uri.parse("http://localhost:3000/api/v1/category");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          categories = data['data'];
        });
      } else {
        print("Error fetching categories: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  // Start quiz: fetch questions based on the selected category
  Future<void> startQuiz() async {
    String apiUrl;
    if (selectedCategory.isNotEmpty) {
      apiUrl =
          "http://localhost:3000/api/v1/quiz/questions?category=${Uri.encodeComponent(selectedCategory)}";
    } else {
      apiUrl = "http://localhost:3000/api/v1/quiz/questions";
    }
    final url = Uri.parse(apiUrl);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          questions = data['data'];
          quizStarted = true;
        });
      } else {
        print("Error fetching quiz questions: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  // Handle option selection for each question
  void handleOptionChange(String questionId, String option) {
    setState(() {
      answers[questionId] = option;
    });
  }

  // Submit quiz answers
  Future<void> submitQuiz() async {
    List submissions = answers.entries
        .map((entry) => {"questionId": entry.key, "answer": entry.value})
        .toList();
    final url = Uri.parse("http://localhost:3000/api/v1/quiz/submit");
    try {
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(submissions));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result = data;
        });
      } else {
        print("Error submitting quiz: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  Widget buildCategorySelection() {
    return Center(
      child: Column(
        children: [
          Text("Select Quiz Category", style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedCategory.isEmpty ? null : selectedCategory,
            hint: Text("All"),
            items: [
              DropdownMenuItem(
                child: Text("All"),
                value: "",
              ),
              ...categories.map<DropdownMenuItem<String>>((cat) {
                return DropdownMenuItem(
                  child: Text(cat['name']),
                  value: cat['name'],
                );
              }).toList(),
            ],
            onChanged: (value) {
              setState(() {
                selectedCategory = value ?? "";
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: startQuiz,
            child: Text("Start Quiz"),
          )
        ],
      ),
    );
  }

  Widget buildQuizForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...questions.asMap().entries.map((entry) {
            int idx = entry.key;
            var question = entry.value;
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${idx + 1}. ${question['questionText']}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: List.generate(question['options'].length, (i) {
                        String option = question['options'][i];
                        return RadioListTile<String>(
                          title: Text(option),
                          value: option,
                          groupValue: answers[question['_id']],
                          onChanged: (value) {
                            handleOptionChange(question['_id'], value!);
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: submitQuiz,
            child: Text("Submit Quiz"),
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Center(
      child: Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Quiz Result",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                  "You scored ${result?['score']} out of ${result?['totalQuestions']}.",
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text(result?['mark'] ?? "", style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = null;
                    quizStarted = false;
                    questions = [];
                    answers = {};
                  });
                },
                child: Text("Retake Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Take Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: !quizStarted
            ? buildCategorySelection()
            : (result != null ? buildResult() : buildQuizForm()),
      ),
    );
  }
}
