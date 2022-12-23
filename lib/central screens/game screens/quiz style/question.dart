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
  {
    'id': 35,
    "question": "(conquer defeat) (strike pound)",
    "image": "none",
    "options": ["beat", "force", "punch", "triumph", "win"],
    "answer_index": 0,
    "category": "word connections"
  },
  {
    'id': 36,
    "question": "(decieve cheat) (recline rest)",
    "image": "none",
    "options": ["false", "bed", "untrue", "lie", "sleep"],
    "answer_index": 3,
    "category": "word connections"
  },
  {
    'id': 37,
    "question": "(level flat) (regular constant)",
    "image": "none",
    "options": ["smooth", "uniform", "even", "same", "plain"],
    "answer_index": 2,
    "category": "word connections"
  },
  {
    'id': 38,
    "question": "(rigid stiff) (company business)",
    "image": "none",
    "options": ["hard", "trader", "solid", "firm", "inflexible"],
    "answer_index": 3,
    "category": "word connections"
  },
  {
    'id': 39,
    "question": "(attack invade) (price fee)",
    "image": "none",
    "options": ["bill", "charge", "assault", "cost", "raid"],
    "answer_index": 1,
    "category": "word connections"
  },
  {
    'id': 40,
    "question": "(siren bell) (frighten terrify)",
    "image": "none",
    "options": ["alarm", "scare", "startle", "horn", "warn"],
    "answer_index": 0,
    "category": "word connections"
  },
  {
    'id': 41,
    "question": "(group type) (friendly generous)",
    "image": "none",
    "options": ["class", "kind", "tender", "sort", "gentle"],
    "answer_index": 1,
    "category": "word connections"
  },
  {
    'id': 42,
    "question": "(32 [4] 8) (54 [6] 9) (72 [?] 12)",
    "image": "none",
    "options": ["11", "6", "9", "7", "3"],
    "answer_index": 1,
    "category": "missing number"
  },
  {
    'id': 43,
    "question": "(28 [86] 15) (12 [94] 35) (28 [?] 17)",
    "image": "none",
    "options": ["94", "75", "100", "90", "45"],
    "answer_index": 3,
    "category": "missing number"
  },
  {
    'id': 44,
    "question": "(18 [68] 25) (14 [20] 3) (7 [?] 12)",
    "image": "none",
    "options": ["29", "35", "31", "25", "33"],
    "answer_index": 2,
    "category": "missing number"
  },
  {
    'id': 45,
    "question": "(73 [45] 26) (28 [8] 18) (63 [?] 22)",
    "image": "none",
    "options": ["27", "29", "32", "43", "39"],
    "answer_index": 4,
    "category": "missing number"
  },
  {
    'id': 46,
    "question": "(57 [34] 25) (49 [31] 20) (23 [?] 9)",
    "image": "none",
    "options": ["22", "16", "19", "21", "15"],
    "answer_index": 1,
    "category": "missing number"
  },
  {
    'id': 47,
    "question": "(3 [13] 6) (2 [3] 4) (5 [?] 8)",
    "image": "none",
    "options": ["35", "45", "40", "34", "36"],
    "answer_index": 0,
    "category": "missing number"
  },
  {
    'id': 48,
    "question": "(16 [14] 4) (48 [16] 8) (63 [?] 9)",
    "image": "none",
    "options": ["21", "17", "23", "19", "15"],
    "answer_index": 1,
    "category": "missing number"
  },
  {
    'id': 49,
    "question": "(17 [32] 2) (13 [36] 3) (9 [?] 4)",
    "image": "none",
    "options": ["32", "34", "31", "36", "33"],
    "answer_index": 0,
    "category": "missing number"
  },
  {
    'id': 50,
    "question": "(happen pea) (rescue cue) (stones [?])",
    "image": "none",
    "options": ["net", "one", "set", "son", "not"],
    "answer_index": 0,
    "category": "make a word from another word"
  },
  {
    'id': 51,
    "question": "(correct cot) (pianist sit) (leopard [?])",
    "image": "none",
    "options": ["rap", "pad", "red", "pea", "rod"],
    "answer_index": 2,
    "category": "make a word from another word"
  },
  {
    'id': 52,
    "question": "(pressure user) (metallic lace) (carriage [?])",
    "image": "none",
    "options": ["acre", "cage", "race", "area", "care"],
    "answer_index": 3,
    "category": "make a word from another word"
  },
  {
    'id': 53,
    "question": "(pavement even) (learning rain) (goodness [?])",
    "image": "none",
    "options": ["done", "nose", "send", "song", "does"],
    "answer_index": 4,
    "category": "make a word from another word"
  },
  {
    'id': 54,
    "question": "(balloon loan) (orchard hard) (treacle [?])",
    "image": "none",
    "options": ["tear", "acre", "cart", "earl", "real"],
    "answer_index": 1,
    "category": "make a word from another word"
  },
  {
    'id': 55,
    "question": "(tactics cast) (decline need) (situate [?])",
    "image": "none",
    "options": ["suit", "test", "site", "east", "ties"],
    "answer_index": 4,
    "category": "make a word from another word"
  },
  {
    'id': 56,
    "question": "(defence need) (talents nest) (traumas [?])",
    "image": "none",
    "options": ["rust", "rams", "mats", "must", "mast"],
    "answer_index": 3,
    "category": "make a word from another word"
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
