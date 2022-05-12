class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "How many canines does a human have  ______",
    "options": ['Four', 'Eight', 'Twelve', 'Two'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Which one is not a protein?",
    "options": ['Eggs', 'Maize', 'Beans', 'Meat'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "What is the largest planet in our solar system?",
    "options": ['Neptune', 'Jupiter', 'Saturn', 'Pluto'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Legs have feet and arms have________?",
    "options": ['Ankles', 'Hands', 'Toes', 'Skull'],
    "answer_index": 1,
  },
];
