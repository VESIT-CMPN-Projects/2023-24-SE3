class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    " Which of these features of OOP would indicate code reusability?",
    [
      Answer("Polymorphism", false),
      Answer("Abstraction", false),
      Answer("Inheritance", true),
      Answer("Encapsulation", false),
    ],
  ));

  list.add(Question(
    "Which language does not support polymorphism but supports classes?",
    [
      Answer("Ada", true),
      Answer("C++", false),
      Answer("Java", false),
      Answer("SmallTalk", false),
    ],
  ));

  list.add(Question(
    "Which of these types of values result from a delete operator?",
    [
      Answer("null", false),
      Answer("null pointer", false),
      Answer("void pointer", false),
      Answer("void", true),
    ],
  ));

  list.add(Question(

      "To call a base class constructor in a derived class, is it needed to call the base class initializer.",
    [
      Answer("True", false),
      Answer("False", true),
    ],
  ));

  return list;
}