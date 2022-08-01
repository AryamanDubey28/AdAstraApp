import 'package:firebase_database/firebase_database.dart';

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

// class BuildQuizDB {
//   late final dref = FirebaseDatabase.instance.ref();
//   late DatabaseReference databaseReference;

//   setData() async {
//     await dref.child("Questions").set({
//       'id': 4,
//       "question": "9 + 10 = _____",
//       "options": ["20", "23", "17", "19"],
//       "answer_index": 3
//     });
//     print("done");
//   }
// }

const List sample_data_vr = [
  {
    'id': 1,
    "question": "AB is to CD as PQ is to [ ? ]",
    "image": "none",
    "options": ["RT", "SR", "ST", "RS", "QR"],
    "answer_index": 3,
    "category": "letter codes"
  },
  {
    'id': 2,
    "question": "The film ended happily after all",
    "image": "none",
    "options": ["The film", "film ended", "ended happily", "happily after"],
    "answer_index": 1,
    "category": "practice quiz"
  },
  {
    'id': 3,
    "question": "(staff [not] gnome)   (epoch [ ? ] image)",
    "image": "none",
    "options": ["gem", "map", "hip", "ham", "mop"],
    "answer_index": 1,
    "category": "practice quiz"
  },
  {
    'id': 4,
    "question": "If the code for FOOT is ENNS, what is the code for TOE?",
    "image": "none",
    "options": ["STU", "SND", "UPF", "SRQ"],
    "answer_index": 1,
    "category": "word codes"
  },
  {
    'id': 5,
    "question": "CQ DQ EP FP [ ? ]",
    "image": "none",
    "options": ["GP", "GO", "HO", "GR", "GQ"],
    "answer_index": 1,
    "category": "practice quiz"
  },
  {
    'id': 6,
    "question": "PT is to NQ as CG is to [ ? ]",
    "image": "none",
    "options": ["AD", "EJ", "ED", "AE", "AJ"],
    "answer_index": 0,
    "category": "letter codes"
  },
  {
    'id': 7,
    "question": "EH is to DK as NV is to [ ? ]",
    "image": "none",
    "options": ["MS", "OY", "MU", "MY", "OS"],
    "answer_index": 3,
    "category": "letter codes"
  },
  {
    'id': 8,
    "question": "FG is to HD as KL is to [ ? ]",
    "image": "none",
    "options": ["IM", "MN", "MJ", "IH", "MI"],
    "answer_index": 4,
    "category": "letter codes"
  },
  {
    'id': 9,
    "question": "EN is to AP as RJ is to [ ? ]",
    "image": "none",
    "options": ["VH", "NL", "VL", "TF", "NH"],
    "answer_index": 1,
    "category": "letter codes"
  },
  {
    'id': 10,
    "question": "LU is to OS as TH is to [ ? ]",
    "image": "none",
    "options": ["WF", "QJ", "RK", "WJ", "QF"],
    "answer_index": 0,
    "category": "letter codes"
  },
  {
    'id': 11,
    "question": "FR is to CV as LT is to [ ? ]",
    "image": "none",
    "options": ["IW", "IX", "OP", "QX", "IP"],
    "answer_index": 1,
    "category": "letter codes"
  },
  {
    'id': 12,
    "question": "BG is to XJ as DV is to [ ? ]",
    "image": "none",
    "options": ["ZY", "HS", "YZ", "ZS", "HY"],
    "answer_index": 0,
    "category": "letter codes"
  },
  {
    'id': 13,
    "question": "mea[?]able  si[?]op",
    "image": "none",
    "options": ["p", "n", "f", "t", "c"],
    "answer_index": 3,
    "category": "missing letter"
  },
  {
    'id': 14,
    "question": "sou[?]age  rea[?]ide",
    "image": "none",
    "options": ["n", "b", "p", "l", "r"],
    "answer_index": 4,
    "category": "missing letter"
  },
  {
    'id': 15,
    "question": "tur[?]old  dea[?]ill",
    "image": "none",
    "options": ["f", "n", "b", "r", "c"],
    "answer_index": 0,
    "category": "missing letter"
  },
  {
    'id': 16,
    "question": "ba[?]ame  dra[?]ate",
    "image": "none",
    "options": ["g", "n", "l", "f", "d"],
    "answer_index": 0,
    "category": "missing letter"
  },
  {
    'id': 17,
    "question": "pa[?]ash  la[?]ail",
    "image": "none",
    "options": ["s", "w", "t", "b", "g"],
    "answer_index": 1,
    "category": "missing letter"
  },
  {
    'id': 18,
    "question": "sta[?]ent  ru[?]owl",
    "image": "none",
    "options": ["r", "y", "f", "b", "t"],
    "answer_index": 3,
    "category": "missing letter"
  },
  {
    'id': 19,
    "question": "cur[?]arn  mal[?]ar",
    "image": "none",
    "options": ["b", "w", "e", "m", "d"],
    "answer_index": 2,
    "category": "missing letter"
  },
  {
    'id': 20,
    "question": "sa[?]ear  to[?]ide",
    "image": "none",
    "options": ["p", "b", "y", "w", "g"],
    "answer_index": 3,
    "category": "missing letter"
  },
  {
    'id': 21,
    "question": "If the code for RING is SKQK, what does IGOT mean?",
    "image": "none",
    "options": ["HELP", "HEAL", "HELD", "HEAT", "HEAP"],
    "answer_index": 3,
    "category": "word codes"
  },
  {
    'id': 22,
    "question": "If the code for HARP is HBTS, what does LFUV mean?",
    "image": "none",
    "options": ["LAST", "LEFT", "LESS", "LEAN", "LIST"],
    "answer_index": 2,
    "category": "word codes"
  },
  {
    'id': 23,
    "question": "If the code for WHEN is AKIQ, what is the code for LOAF?",
    "image": "none",
    "options": ["HKWB", "HLWC", "PRCG", "PREI", "PSEJ"],
    "answer_index": 3,
    "category": "word codes"
  },
  {
    'id': 24,
    "question": "If the code for SEEM is UCGK, what does DMQK mean?",
    "image": "none",
    "options": ["BOOM", "FOAM", "FOOT", "BOMB", "FLAT"],
    "answer_index": 0,
    "category": "word codes"
  },
  {
    'id': 25,
    "question": "If the code for MAST is IXQS, what does ZRLD mean?",
    "image": "none",
    "options": ["DARE", "VOID", "DUMB", "DUNE", "VANE"],
    "answer_index": 3,
    "category": "word codes"
  },
  {
    'id': 26,
    "question": "If the code for MORE is IRPF, what is the code for PUSH?",
    "image": "none",
    "options": ["LRQG", "LXQI", "TXUI", "TRUG", "LXOK"],
    "answer_index": 1,
    "category": "word codes"
  },
  {
    'id': 27,
    "question": "If the code for PAIR is MYHR, what is the code for BEST?",
    "image": "none",
    "options": ["EHVW", "YBPQ", "EGTT", "YCPR", "YCRT"],
    "answer_index": 4,
    "category": "word codes"
  },
  {
    'id': 28,
    "question": "32 37 41 44 46 [?]",
    "image": "none",
    "options": ["47", "51", "45", "48", "53"],
    "answer_index": 0,
    "category": "number sequences"
  },
  {
    'id': 29,
    "question": "5 8 14 26 50 [?]",
    "image": "none",
    "options": ["100", "68", "96", "62", "98"],
    "answer_index": 4,
    "category": "number sequences"
  },
  {
    'id': 30,
    "question": "29 31 23 27 17 23 11 [?]",
    "image": "none",
    "options": ["9", "17", "21", "20", "19"],
    "answer_index": 4,
    "category": "number sequences"
  },
  {
    'id': 31,
    "question": "20 18 19 16 17 13 14 [?]",
    "image": "none",
    "options": ["10", "8", "20", "9", "13"],
    "answer_index": 3,
    "category": "number sequences"
  },
  {
    'id': 32,
    "question": "69 58 68 59 67 [?]",
    "image": "none",
    "options": ["60", "58", "65", "57", "74"],
    "answer_index": 0,
    "category": "number sequences"
  },
  {
    'id': 33,
    "question": "1 8 5 11 7 12 7 [?]",
    "image": "none",
    "options": ["1", "21", "3", "13", "11"],
    "answer_index": 4,
    "category": "number sequences"
  },
  {
    'id': 34,
    "question": "6 13 28 59 122 [?]",
    "image": "none",
    "options": ["249", "251", "245", "244", "239"],
    "answer_index": 0,
    "category": "number sequences"
  },
];

const List sample_data_numeracy = [
  {
    'id': 1,
    "question": "9 + 3 = _____",
    "image": "none",
    "options": ["20", "93", "1", "12"],
    "answer_index": 3,
    "category": "quick maths"
  },
  {
    'id': 2,
    "question": "7 x 3 + 4 = _____",
    "image": "none",
    "options": ["20", "25", "77", "734"],
    "answer_index": 1,
    "category": "quick maths"
  },
  {
    'id': 3,
    "question": "55 - 5",
    "image": "none",
    "options": ["9", "50", "60", "555", "2"],
    "answer_index": 1,
    "category": "quick maths"
  },
  {
    'id': 4,
    "question": "7 x 7 = _____",
    "image": "none",
    "options": ["77", "49", "14", "94"],
    "answer_index": 1,
    "category": "quick maths"
  },
  {
    'id': 5,
    "question": "2 x 2 x 2",
    "image": "none",
    "options": ["4", "8", "22", "222", "0"],
    "answer_index": 1,
    "category": ""
  },
];

const List sample_data_nvr = [
  {
    'id': 1,
    "question": "none",
    "image": "lib/assets/nvr_images/nvr_q2.png",
    "options": [
      "lib/assets/nvr_images/nvr_q2_o5.png",
      "lib/assets/nvr_images/nvr_q2_o4.png",
      "lib/assets/nvr_images/nvr_q2_o3.png",
      "lib/assets/nvr_images/nvr_q2_o2.png",
      "lib/assets/nvr_images/nvr_q2_o1.png"
    ],
    "answer_index": 2,
    "category": "practice quiz"
  },
  {
    'id': 2,
    "question": "none",
    "image": "lib/assets/nvr_images/nvr_q1.png",
    "options": [
      "lib/assets/nvr_images/nvr_q1_o5.png",
      "lib/assets/nvr_images/nvr_q1_o4.png",
      "lib/assets/nvr_images/nvr_q1_o3.png",
      "lib/assets/nvr_images/nvr_q1_o2.png",
      "lib/assets/nvr_images/nvr_q1_o1.png"
    ],
    "answer_index": 2,
    "category": ""
  },
];
