import 'package:flutter/material.dart';

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem({required this.question, required this.answer, this.isExpanded = false});
}

class MedicalFAQScreen extends StatefulWidget {
  const MedicalFAQScreen({super.key});

  @override
  State<MedicalFAQScreen> createState() => _MedicalFAQScreenState();
}

class _MedicalFAQScreenState extends State<MedicalFAQScreen> {
  // Sample list of medical-related FAQs
  final List<FAQItem> _faqItems = [
    FAQItem(
      question: 'How can I book an appointment?',
      answer: 'You can book an appointment using our mobile app or by calling the clinic directly. Simply choose a date and time, and select your preferred doctor.',
    ),
    FAQItem(
      question: 'How can I get a prescription refill?',
      answer: 'You can request a prescription refill by visiting your doctor’s office or by contacting our pharmacy through the app.',
    ),
    FAQItem(
      question: 'Do you accept health insurance?',
      answer: 'Yes, we accept most major health insurance plans. Please check the insurance section on our website for a full list of accepted insurance providers.',
    ),
    FAQItem(
      question: 'What should I bring to my first appointment?',
      answer: 'Please bring a valid ID, your insurance card, and a list of any medications you are currently taking.',
    ),
    FAQItem(
      question: 'Can I cancel or reschedule my appointment?',
      answer: 'Yes, you can cancel or reschedule your appointment through our app or by calling the clinic at least 24 hours before the scheduled time.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan ,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("FAQ's",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),


          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: _faqItems.map((faqItem) => _buildFAQItem(faqItem)).toList(),
          ),
        ),
      ),
    );
  }

  // Widget to build each FAQ item
  Widget _buildFAQItem(FAQItem faqItem) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          faqItem.question,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        trailing: Icon(faqItem.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              faqItem.answer,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            faqItem.isExpanded = expanded;
          });
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MedicalFAQScreen(),
  ));
}
