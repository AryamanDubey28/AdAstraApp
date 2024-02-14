// ignore_for_file: constant_identifier_names

class Question {
  late final int? id, answer;
  late final String question;
  late final String? image;
  late final List<String>? options;
  late final String? category;

  Question(
      {this.id,
      required this.question,
      this.image,
      this.answer,
      this.options,
      this.category});
}

const List sample_data_variables = [
  {
    'id': 1,
    "question": "Which one of these is a data type in Python",
    "image": "none",
    "options": ["CPU", "RAM", "String", "Monitor", "Number"],
    "answer_index": 2,
    "category": "data types"
  },
  {
    'id': 2,
    "question": "What type of data is the number 5 in Python?",
    "image": "none",
    "options": ["Text", "Integer", "List", "Boolean", "Friend"],
    "answer_index": 1,
    "category": "Data Types"
  },
  {
    'id': 3,
    "question":
        "If you want to save your name in Python, which data type would you use?",
    "image": "none",
    "options": ["Number", "Boolean", "String", "Fruit", "Shape"],
    "answer_index": 2,
    "category": "Data Types"
  },
  {
    'id': 4,
    "question":
        "Which data type in Python can be used to store more than one item in a single variable?",
    "image": "none",
    "options": ["Letter", "Number", "List", "Boolean", "Color"],
    "answer_index": 2,
    "category": "Data Types"
  },
  {
    'id': 5,
    "question": "What data type would you use to store the area of a triangle?",
    "image": "none",
    "options": ["Float", "Integer", "String", "Boolean", "Character"],
    "answer_index": 0,
    "category": "Data Types"
  },
  {
    'id': 6,
    "question": "What data type in Python would you use to store a book’s name",
    "image": "none",
    "options": ["String", "Integer", "Tuple", "List", "Dictionary"],
    "answer_index": 0,
    "category": "Data Types"
  },
  {
    'id': 7,
    "question": "If we set x = 5 in Python, what is 'x' called?",
    "image": "none",
    "options": [
      "A number",
      "A variable",
      "A string",
      "A python",
      "A math problem"
    ],
    "answer_index": 1,
    "category": "Variables"
  },
  {
    'id': 8,
    "question":
        "What happens to the old value of a variable when we assign a new value to it?",
    "image": "none",
    "options": [
      "It gets bigger",
      "It disappears",
      "It becomes a string",
      "It gets saved",
      "It multiplies"
    ],
    "answer_index": 1,
    "category": "Variables"
  },
  {
    'id': 9,
    "question":
        "If I say 'y = 10' and then 'y = y + 5', what is the value of 'y' now?",
    "image": "none",
    "options": ["5", "10", "15", "20", "25"],
    "answer_index": 2,
    "category": "Variables"
  },
  {
    'id': 10,
    "question": "Can the name of a variable be a number, like 1 or 2?",
    "image": "none",
    "options": ["Yes", "No"],
    "answer_index": 1,
    "category": "Variables"
  },
  {
    'id': 11,
    "question":
        "If we first set 'animal = cat' and later 'animal = dog', what does 'animal' equal?",
    "image": "none",
    "options": ["cat", "dog", "catdog", "animal", "None of the above"],
    "answer_index": 1,
    "category": "Variables"
  },
  {
    'id': 12,
    "question": "Which variable name gives us the best idea of what it stores?",
    "image": "none",
    "options": ["x", "age", "data", "value", "n"],
    "answer_index": 1,
    "category": "Smart Variable Names"
  },
  {
    'id': 13,
    "question":
        "If you were keeping track of the number of books read, which variable name would be the best choice?",
    "image": "none",
    "options": ["b", "num", "booksRead", "readCount", "All are good"],
    "answer_index": 2,
    "category": "Smart Variable Names"
  },
  {
    'id': 14,
    "question": "Why is 'totalApples' a better variable name than 'ta'?",
    "image": "none",
    "options": [
      "It's longer",
      "It's more descriptive",
      "It uses capital letters",
      "All of the above",
      "None of the above"
    ],
    "answer_index": 1,
    "category": "Smart Variable Names"
  },
  {
    'id': 15,
    "question":
        "If you have a variable for storing a user's first name, which of these is the best name for it?",
    "image": "none",
    "options": ["userFirstName", "ufn", "userName", "firstName", "name1"],
    "answer_index": 0,
    "category": "Smart Variable Names"
  },
  {
    'id': 16,
    "question": "What is a string in Python?",
    "image": "none",
    "options": [
      "A type of number",
      "A sequence of characters",
      "A Python snake",
      "A kind of list",
      "A special variable"
    ],
    "answer_index": 1,
    "category": "Strings"
  },
  {
    'id': 17,
    "question": "How do you write the string 'Hello, World!' in Python?",
    "image": "none",
    "options": [
      "'Hello, World!'",
      "(Hello, World!)",
      "[Hello, World!]",
      "/Hello, World!/"
    ],
    "answer_index": 0,
    "category": "Strings"
  },
  {
    'id': 18,
    "question":
        "If you have the string 'Python', what is the result of adding ' is fun!' to it?",
    "image": "none",
    "options": [
      "'Python is fun!'",
      "'Python+ is fun!'",
      "Error",
      "'Pythonis fun!'",
      "'Python, is fun!'"
    ],
    "answer_index": 0,
    "category": "Strings"
  },
  {
    'id': 19,
    "question":
        "Which of the following can be used to find the length of a string named 'code'?",
    "image": "none",
    "options": [
      "len(code)",
      "code.len()",
      "length(code)",
      "code.length()",
      "size(code)"
    ],
    "answer_index": 0,
    "category": "Strings"
  },
  {
    'id': 20,
    "question": "How do you get the first character of the string 'Data'?",
    "image": "none",
    "options": ["Data[1]", "Data[0]", "Data.first()", "Data(1)", "Data.get(0)"],
    "answer_index": 1,
    "category": "Strings"
  },
  {
    'id': 21,
    "question": "If we concatenate 'Sun' and 'day', what will be the result?",
    "image": "none",
    "options": ["'Sunday'", "'Sun-day'", "'Sun day'", "'Sun+day'", "'Sund'"],
    "answer_index": 0,
    "category": "Strings"
  },
  {
    'id': 22,
    "question": "What does the method upper() do to a string 'hello'?",
    "image": "none",
    "options": [
      "Makes it louder",
      "Turns it into 'HELLO'",
      "Makes it uppercase",
      "Reverses it",
      "Deletes it"
    ],
    "answer_index": 1,
    "category": "Strings"
  },
];

const List sample_data_operations = [
  {
    'id': 1,
    "question": "What is the result of adding 123 and 456 in Python?",
    "image": "none",
    "options": ["579", "568", "678", "789", "569"],
    "answer_index": 0,
    "category": "Arithmetic Operations"
  },
  {
    'id': 2,
    "question":
        "If you add the numbers 78 and 22 together in Python, what number do you get?",
    "image": "none",
    "options": ["100", "95", "105", "90", "110"],
    "answer_index": 0,
    "category": "Arithmetic Operations"
  },
  {
    'id': 3,
    "question": "What is the result of integer division 7 // 2 in Python?",
    "image": "none",
    "options": ["3.5", "4", "3", "2", "None of the above"],
    "answer_index": 2,
    "category": "Arithmetic Operations"
  },
  {
    'id': 4,
    "question":
        "If you perform integer division of 9 by 4 in Python, what do you get?",
    "image": "none",
    "options": ["2.25", "2", "3", "1", "None of the above"],
    "answer_index": 1,
    "category": "Arithmetic Operations"
  },
  {
    'id': 5,
    "question": "What is 4 > 4 ?",
    "image": "none",
    "options": ["True", "False", "Both", "Neither"],
    "answer_index": 1,
    "category": "Comparison Operations"
  },
  {
    'id': 6,
    "question": "What is the sign for less than or equal to",
    "image": "none",
    "options": ["<=", ">=", "<", ">", "<>"],
    "answer_index": 0,
    "category": "Comparison Operations"
  },
  {
    'id': 7,
    "question": "If a = 5, what is a % 2",
    "image": "none",
    "options": ["0", "1", "2", "3", "Not Possible"],
    "answer_index": 1,
    "category": "Using Variables in Operations"
  },
  {
    "id": 8,
    "question":
        "You have 3 apples and your friend gives you 2 more. How many apples do you have now? Let 'apples' be the number of apples.",
    "image": "none",
    "options": ["1", "2", "3", "5", "7"],
    "answer_index": 4,
    "category": "Using Variables in Operations"
  }
];

const List sample_data_conditionals = [
  {
    'id': 1,
    "question":
        "If it's sunny, what would you wear? Choose the Python if-else statement that matches.",
    "image": "none",
    "options": [
      "if weather == 'sunny':\n    wear = 'T-shirt'\nelse:\n    wear = 'Raincoat'",
      "if weather == 'rainy':\n    wear = 'T-shirt'\nelse:\n    wear = 'Raincoat'",
      "if weather == 'sunny':\n    wear = 'Raincoat'\nelse:\n    wear = 'T-shirt'",
      "if weather = 'sunny':\n    wear = 'T-shirt'\nelse:\n    wear = 'Raincoat'"
    ],
    "answer_index": 0,
    "category": "if else"
  },
  {
    'id': 2,
    "question":
        "If you have 5 apples and your friend gives you 2 more, do you have more than 5 apples?",
    "image": "none",
    "options": [
      "Yes, if apples > 5:\n    print('More than 5 apples')\nelse:\n    print('5 or less apples')",
      "No, if apples <= 5:\n    print('5 or less apples')\nelse:\n    print('More than 5 apples')",
      "Yes, if apples <= 5:\n    print('5 or less apples')\nelse:\n    print('More than 5 apples')",
      "No, if apples > 5:\n    print('More than 5 apples')\nelse:\n    print('5 or less apples')"
    ],
    "answer_index": 2,
    "category": "if else"
  },
  {
    'id': 3,
    "question":
        "What does a Python program do if it's raining outside and you have an umbrella?",
    "image": "none",
    "options": [
      "if raining == True and have_umbrella == True:\n    action = 'Go outside'\nelse:\n    action = 'Stay inside'",
      "if raining == False or have_umbrella == False:\n    action = 'Go outside'\nelse:\n    action = 'Stay inside'",
      "if raining == True or have_umbrella == True:\n    action = 'Stay inside'\nelse:\n    action = 'Go outside'",
      "if raining == False and have_umbrella == True:\n    action = 'Stay inside'\nelse:\n    action = 'Go outside'"
    ],
    "answer_index": 0,
    "category": "if else"
  },
  {
    'id': 4,
    "question":
        "Choose the correct Python if-else statement for checking if your score is 100 to win a prize.",
    "image": "none",
    "options": [
      "if score == 100:\n    print('Win a prize')\nelse:\n    print('Try again')",
      "if score = 100:\n    print('Win a prize')\nelse:\n    print('Try again')",
      "if score != 100:\n    print('Try again')\nelse:\n    print('Win a prize')",
      "if score > 100:\n    print('Win a prize')\nelse:\n    print('Try again')"
    ],
    "answer_index": 2,
    "category": "if else"
  },
  {
    'id': 5,
    "question":
        "If the temperature is below 0 degrees, we call it freezing. If it's above 30 degrees, it's hot. Otherwise, it's comfortable. Pick the correct Python statement.",
    "image": "none",
    "options": [
      "if temperature < 0:\n    weather = 'Freezing'\nelif temperature > 30:\n    weather = 'Hot'\nelse:\n    weather = 'Comfortable'",
      "if temperature > 0:\n    weather = 'Freezing'\nelif temperature < 30:\n    weather = 'Hot'\nelse:\n    weather = 'Comfortable'",
      "if temperature == 0:\n    weather = 'Freezing'\nelif temperature == 30:\n    weather = 'Hot'\nelse:\n    weather = 'Comfortable'",
      "if temperature <= 0:\n    weather = 'Hot'\nelif temperature >= 30:\n    weather = 'Freezing'\nelse:\n    weather = 'Comfortable'"
    ],
    "answer_index": 0,
    "category": "elif"
  },
  {
    'id': 6,
    "question":
        "What Python code helps a robot decide if it should move forward, turn left, or turn right based on the path's direction?",
    "image": "none",
    "options": [
      "if path == 'straight':\n    action = 'Move forward'\nelif path == 'left':\n    action = 'Turn left'\nelse:\n    action = 'Turn right'",
      "if path == 'right':\n    action = 'Move forward'\nelif path == 'straight':\n    action = 'Turn left'\nelse:\n    action = 'Turn right'",
      "if path == 'left':\n    action = 'Move forward'\nelif path == 'right':\n    action = 'Turn left'\nelse:\n    action = 'Turn straight'",
      "if path == 'straight':\n    action = 'Turn right'\nelif path == 'left':\n    action = 'Move forward'\nelse:\n    action = 'Turn left'"
    ],
    "answer_index": 0,
    "category": "elif"
  },
  {
    'id': 7,
    "question":
        "Choose the Python code that correctly tells you what to wear based on the day's temperature.",
    "image": "none",
    "options": [
      "if temperature > 20:\n    wear = 'Shorts'\nelif temperature > 10:\n    wear = 'Jeans'\nelse:\n    wear = 'Jacket'",
      "if temperature <= 10:\n    wear = 'Jacket'\nelif temperature <= 20:\n    wear = 'Jeans'\nelse:\n    wear = 'Shorts'",
      "if temperature < 10:\n    wear = 'Shorts'\nelif temperature < 20:\n    wear = 'Jeans'\nelse:\n    wear = 'Jacket'",
      "if temperature == 20:\n    wear = 'Jeans'\nelif temperature == 10:\n    wear = 'Jacket'\nelse:\n    wear = 'Shorts'"
    ],
    "answer_index": 1,
    "category": "elif"
  },
  {
    'id': 8,
    "question":
        "If you score below 50, you fail. If you score exactly 50, you pass. If you score above 50, you excel. Which Python code is right?",
    "image": "none",
    "options": [
      "if score < 50:\n    result = 'Fail'\nelif score == 50:\n    result = 'Pass'\nelse:\n    result = 'Excel'",
      "if score <= 50:\n    result = 'Fail'\nelif score > 50:\n    result = 'Pass'\nelse:\n    result = 'Excel'",
      "if score == 50:\n    result = 'Fail'\nelif score < 50:\n    result = 'Pass'\nelse:\n    result = 'Excel'",
      "if score > 50:\n    result = 'Fail'\nelif score < 50:\n    result = 'Pass'\nelse:\n    result = 'Excel'"
    ],
    "answer_index": 0,
    "category": "elif"
  },
  {
    'id': 9,
    "question":
        "What Python code decides what to have for breakfast based on the day of the week?",
    "image": "none",
    "options": [
      "if day == 'Monday':\n    breakfast = 'Pancakes'\nelif day == 'Tuesday':\n    breakfast = 'Oatmeal'\nelse:\n    breakfast = 'Eggs'",
      "if day == 'Saturday':\n    breakfast = 'Pancakes'\nelif day == 'Sunday':\n    breakfast = 'Oatmeal'\nelse:\n    breakfast = 'Cereal'",
      "if day == 'Weekday':\n    breakfast = 'Oatmeal'\nelif day == 'Weekend':\n    breakfast = 'Pancakes'\nelse:\n    breakfast = 'Eggs'",
      "if day == 'Monday':\n    breakfast = 'Oatmeal'\nelif day == 'Friday':\n    breakfast = 'Pancakes'\nelse:\n    breakfast = 'Eggs'"
    ],
    "answer_index": 1,
    "category": "elif"
  },
  {
    'id': 10,
    "question":
        "A program checks the age and height of a person to decide if they can ride a roller coaster. You must be at least 12 years old and 120 cm tall. Which Python code correctly implements this?",
    "image": "none",
    "options": [
      "if age >= 12 and height >= 120:\n    can_ride = 'Yes'\nelse:\n    can_ride = 'No'",
      "if age < 12 or height < 120:\n    can_ride = 'No'\nelse:\n    can_ride = 'Yes'",
      "if age >= 12 or height >= 120:\n    can_ride = 'Yes'\nelse:\n    can_ride = 'No'",
      "if age > 12 and height > 120:\n    can_ride = 'Yes'\nelif age == 12 and height == 120:\n    can_ride = 'Yes'\nelse:\n    can_ride = 'No'"
    ],
    "answer_index": 0,
    "category": "logic problems"
  },
  {
    'id': 11,
    "question":
        "A program helps a library decide if a book is 'New', 'Popular', or 'Classic' based on the year it was published. Books published after 2000 are 'New', between 1980 and 2000 are 'Popular', and before 1980 are 'Classic'. Which Python code is correct?",
    "image": "none",
    "options": [
      "if year > 2000:\n    category = 'New'\nelif year >= 1980 and year <= 2000:\n    category = 'Popular'\nelse:\n    category = 'Classic'",
      "if year < 1980:\n    category = 'Classic'\nelif year > 1980 and year < 2000:\n    category = 'Popular'\nelse:\n    category = 'New'",
      "if year >= 1980:\n    if year <= 2000:\n        category = 'Popular'\n    else:\n        category = 'New'\nelse:\n    category = 'Classic'",
      "if year < 2000:\n    category = 'Classic'\nelif year > 2000:\n    category = 'New'\nelse:\n    category = 'Popular'"
    ],
    "answer_index": 0,
    "category": "logic problems"
  },
  {
    'id': 12,
    "question":
        "To determine if water is 'Ice', 'Liquid', or 'Steam' based on temperature, which Python code is accurate? Assume temperature is in Celsius, where below 0 is 'Ice', between 0 and 100 is 'Liquid', and above 100 is 'Steam'.",
    "image": "none",
    "options": [
      "if temperature < 0:\n    state = 'Ice'\nelif temperature <= 100:\n    state = 'Liquid'\nelse:\n    state = 'Steam'",
      "if temperature > 0 and temperature < 100:\n    state = 'Liquid'\nelif temperature >= 100:\n    state = 'Steam'\nelse:\n    state = 'Ice'",
      "if temperature <= 0:\n    state = 'Ice'\nelif temperature > 0 and temperature < 100:\n    state = 'Liquid'\nelse:\n    state = 'Steam'",
      "if temperature >= 100:\n    state = 'Steam'\nelif temperature < 100 and temperature > 0:\n    state = 'Liquid'\nelse:\n    state = 'Ice'"
    ],
    "answer_index": 0,
    "category": "logic problems"
  }
];

const List sample_data_loops = [
  {
    'id': 1,
    "question":
        "How do you write a for loop that prints the numbers 1 to 5 in Python?",
    "image": "none",
    "options": [
      "for i in range(1, 6):\n    print(i)",
      "for i in range(5):\n    print(i)",
      "for i in range(1, 5):\n    print(i)",
      "for i in range(6):\n    print(i)"
    ],
    "answer_index": 0,
    "category": "For Loops"
  },
  {
    'id': 2,
    "question":
        "Which for loop correctly prints each letter in the word 'Hello' on a new line?",
    "image": "none",
    "options": [
      "for letter in 'Hello':\n    print(letter)",
      "for i in range('Hello'):\n    print(i)",
      "for i in 'Hello':\n    print('Hello'[i])",
      "for i in range(len('Hello')):\n    print('Hello')"
    ],
    "answer_index": 0,
    "category": "For Loops"
  },
  {
    'id': 3,
    "question":
        "To print the phrase 'Python rocks!' three times, which for loop should you use?",
    "image": "none",
    "options": [
      "for i in range(3):\n    print('Python rocks!')",
      "for i in range(1, 3):\n    print('Python rocks!')",
      "for i in 'Python rocks!':\n    print(i)",
      "for i in range(2):\n    print('Python rocks!')"
    ],
    "answer_index": 0,
    "category": "For Loops"
  },
  {
    'id': 4,
    "question":
        "How would you use a for loop to print the numbers 10 down to 1?",
    "image": "none",
    "options": [
      "for i in range(10, 0, -1):\n    print(i)",
      "for i in range(1, 11):\n    print(11 - i)",
      "for i in range(10):\n    print(10 - i)",
      "for i in range(9, -1, -1):\n    print(i + 1)"
    ],
    "answer_index": 0,
    "category": "For Loops"
  },
  {
    'id': 5,
    "question": "Which for loop correctly prints all odd numbers from 1 to 9?",
    "image": "none",
    "options": [
      "for i in range(1, 10, 2):\n    print(i)",
      "for i in range(1, 9):\n    if i % 2 != 0:\n        print(i)",
      "for i in range(1, 10):\n    if i % 2 == 1:\n        print(i)",
      "for i in range(0, 9, 2):\n    print(i + 1)"
    ],
    "answer_index": 0,
    "category": "For Loops"
  },
  {
    'id': 6,
    "question":
        "To print 'Yes' for each number in the range 1 to 3, which for loop is used?",
    "image": "none",
    "options": [
      "for i in range(1, 4):\n    print('Yes')",
      "for i in range(3):\n    print('Yes')",
      "for i in [1, 2, 3]:\n    print('Yes')",
      "for i in range(1, 3):\n    print('Yes')"
    ],
    "answer_index": 0,
    "category": "For Loops"
  },
  {
    'id': 7,
    "question":
        "Which for loop prints the numbers 2 to 8, skipping every second number (like 2, 4, 6, 8)?",
    "image": "none",
    "options": [
      "for i in range(2, 9, 2):\n    print(i)",
      "for i in range(2, 8):\n    if i % 2 == 0:\n        print(i)",
      "for i in range(2, 8, 2):\n    print(i)",
      "for i in range(2, 10, 2):\n    print(i)"
    ],
    "answer_index": 3,
    "category": "For Loops"
  },
  {
    'id': 1,
    "question":
        "How do you write a while loop that prints the numbers 1 to 5 in Python?",
    "image": "none",
    "options": [
      "i = 1\nwhile i <= 5:\n    print(i)\n    i += 1",
      "while i < 5:\n    print(i)\n    i += 1",
      "i = 0\nwhile i < 5:\n    print(i + 1)\n    i += 1",
      "i = 1\nwhile i < 6:\n    print(i)\n    i++"
    ],
    "answer_index": 0,
    "category": "While Loops"
  },
  {
    'id': 2,
    "question": "Which while loop correctly counts down from 5 to 1?",
    "image": "none",
    "options": [
      "i = 5\nwhile i > 0:\n    print(i)\n    i -= 1",
      "i = 5\nwhile i >= 1:\n    print(i)\n    i = i - 1",
      "i = 6\nwhile i > 1:\n    print(i - 1)\n    i -= 1",
      "i = 5\nwhile i < 1:\n    print(i)\n    i -= 1"
    ],
    "answer_index": 0,
    "category": "While Loops"
  },
  {
    'id': 3,
    "question": "How do you use a while loop to print 'Hello' 3 times?",
    "image": "none",
    "options": [
      "i = 0\nwhile i < 3:\n    print('Hello')\n    i += 1",
      "i = 1\nwhile i <= 3:\n    print('Hello')\n    i += 1",
      "i = 3\nwhile i > 0:\n    print('Hello')\n    i -= 1",
      "i = 0\nwhile i <= 3:\n    print('Hello')\n    i += 1"
    ],
    "answer_index": 0,
    "category": "While Loops"
  },
  {
    'id': 4,
    "question":
        "Which while loop will keep running as long as the user inputs 'yes'?",
    "image": "none",
    "options": [
      "answer = input('Continue? yes/no: ')\nwhile answer == 'yes':\n    answer = input('Continue? yes/no: ')",
      "while input('Continue? yes/no: ') == 'yes':\n    pass",
      "answer = 'yes'\nwhile answer == 'yes':\n    answer = input('Continue? yes/no: ')",
      "answer = 'yes'\nwhile answer != 'no':\n    answer = input('Continue? yes/no: ')"
    ],
    "answer_index": 2,
    "category": "While Loops"
  },
  {
    'id': 5,
    "question":
        "How can a while loop be used to find the first number greater than 100 that is divisible by 17?",
    "image": "none",
    "options": [
      "num = 101\nwhile num % 17 != 0:\n    num += 1",
      "num = 100\nwhile num % 17 == 0:\n    num += 1",
      "num = 101\nwhile num % 17 == 0:\n    num += 1",
      "num = 100\nwhile num % 17 != 0:\n    num += 1"
    ],
    "answer_index": 0,
    "category": "While Loops"
  },
  {
    'id': 6,
    "question": "Write a while loop that prints all even numbers from 2 to 10.",
    "image": "none",
    "options": [
      "i = 2\nwhile i <= 10:\n    print(i)\n    i += 2",
      "i = 2\nwhile i < 10:\n    if i % 2 == 0:\n        print(i)\n    i += 1",
      "i = 1\nwhile i <= 10:\n    if i % 2 == 0:\n        print(i)\n    i += 1",
      "i = 2\nwhile i <= 10:\n    if i % 2 == 0:\n        print(i)\n    i += 1"
    ],
    "answer_index": 0,
    "category": "While Loops"
  },
  {
    'id': 7,
    "question": "Which while loop will print the word 'Python' 5 times?",
    "image": "none",
    "options": [
      "i = 0\nwhile i < 5:\n    print('Python')\n    i += 1",
      "i = 1\nwhile i <= 5:\n    print('Python')\n    i += 1",
      "i = 5\nwhile i > 0:\n    print('Python')\n    i -= 1",
      "count = 5\nwhile count:\n    print('Python')\n    count -= 1"
    ],
    "answer_index": 0,
    "category": "While Loops"
  },
  {
    'id': 8,
    "question": "When is a while loop preferred over a for loop in Python?",
    "image": "none",
    "options": [
      "When the number of iterations is known beforehand.",
      "When iterating over a sequence (like a list or string).",
      "When the loop must run until a condition changes, and the number of iterations is not known.",
      "When you need to loop through numbers in a range."
    ],
    "answer_index": 2,
    "category": "While Loops"
  },
  {
    'id': 9,
    "question":
        "How do you write a nested loop to print a 3x3 grid of asterisks (*) in Python?",
    "image": "none",
    "options": [
      "for i in range(3):\n    for j in range(3):\n        print('*', end='')\n    print()",
      "for i in range(3):\n    print('*')\n    for j in range(3):\n        print('*', end='')",
      "for i in range(3):\n    for j in range(3):\n        print('*', end=' ')\n    print('*')",
      "for i in range(3):\n    print('*' * 3)"
    ],
    "answer_index": 0,
    "category": "Nested Loops"
  },
  {
    'id': 10,
    "question":
        "Which nested loop correctly creates the pattern below?\n1\n22\n333\n4444",
    "image": "none",
    "options": [
      "for i in range(1, 5):\n    for j in range(i):\n        print(i, end='')\n    print()",
      "for i in range(4):\n    for j in range(i + 1):\n        print(j, end='')\n    print()",
      "for i in range(1, 5):\n    print(str(i) * i)",
      "for i in range(4):\n    for j in range(4):\n        print(i + 1, end='')\n    print()"
    ],
    "answer_index": 0,
    "category": "Nested Loops"
  },
  {
    'id': 11,
    "question":
        "How do you use nested loops to count the total number of elements in a list of lists [[1, 2], [3, 4], [5, 6, 7]]?",
    "image": "none",
    "options": [
      "count = 0\nfor sublist in [[1, 2], [3, 4], [5, 6, 7]]:\n    for element in sublist:\n        count += 1",
      "count = 0\nfor i in range(len([[1, 2], [3, 4], [5, 6, 7]])):\n    count += len(i)",
      "for sublist in [[1, 2], [3, 4], [5, 6, 7]]:\n    count = len(sublist)\n    print(count)",
      "count = sum([len(sublist) for sublist in [[1, 2], [3, 4], [5, 6, 7]]])"
    ],
    "answer_index": 0,
    "category": "Nested Loops"
  },
  {
    'id': 12,
    "question":
        "Which nested loop prints a 5x5 grid where each cell contains the row number?",
    "image": "none",
    "options": [
      "for i in range(1, 6):\n    for j in range(5):\n        print(i, end=' ')\n    print()",
      "for i in range(5):\n    for j in range(1, 6):\n        print(j, end=' ')\n    print()",
      "for i in range(5):\n    print(str(i) * 5)",
      "for i in range(1, 6):\n    for j in range(1, 6):\n        print(j, end=' ')\n    print()"
    ],
    "answer_index": 0,
    "category": "Nested Loops"
  }
];
