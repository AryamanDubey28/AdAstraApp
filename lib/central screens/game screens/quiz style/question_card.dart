import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/controllers/question_controller.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/option.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/question.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  Widget getImage(String image) {
    if (image == "none") {
      return const SizedBox(
        height: 1,
      );
    } else {
      return Image.asset(image);
    }
  }

  Widget getTextWidg(String question) {
    if (question == "none") {
      return const SizedBox(
        height: 1,
      );
    } else {
      return FittedBox(fit:BoxFit.scaleDown, child:
      Text(
        question,
        style: 
        
        Theme.of(context)
        
            .textTheme
            .displaySmall
            ?.copyWith(color: Colors.black),

      ));
      
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    QuestionController controller =
        Get.put(QuestionController(ExplorePage.index));
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(25)), height: height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            getTextWidg(widget.question.question),

            getImage(widget.question.image!),
            SizedBox(
              height: height*0.005 ,
            ),

            //new
            ...List.generate(
                widget.question.options!.length,
                (index) => Option(
                    text: widget.question.options![index],
                    index: index,
                    press: () {
                      controller.checkAns(widget.question, index);
                    })),
            
],),)

    

            // ...List.generate(
            //     widget.question.options!.length,
            //     (index) => Option(
            //         text: widget.question.options![index],
            //         index: index,
            //         press: () {
            //           _controller.checkAns(widget.question, index);
            //         }))
          
        );
      
    
  }
}
