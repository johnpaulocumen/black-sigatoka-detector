import 'package:flutter/material.dart';

class TextContainerBuilder {

  static Widget build(String outputText) {
    if (outputText == "Black Sigatoka detected!") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: RichText(
          text: const TextSpan(
            children: [
              WidgetSpan(
                child: SizedBox(width: 30.0),
              ),
              TextSpan(
                text:
                "Black Sigatoka, also known as Black Leaf Streak disease, is a devastating fungal disease that affects banana and plantain plants. It causes characteristic dark spots with yellow halos on leaves, leading to leaf damage, reduced fruit production, and economic losses in banana cultivation.",
                style: TextStyle(
                  fontFamily: 'Abel',
                  color: Colors.black,
                  fontSize: 20,
                  height: 1.15,
                  wordSpacing: 2,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.justify,
        ),
      );
    } else if (outputText == "No Black Sigatoka found!") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: RichText(
          text: const TextSpan(
            children: [
              WidgetSpan(
                child: SizedBox(width: 0.0),
              ),
              TextSpan(
                text:
                  "There is no information.",
                style: TextStyle(
                  fontFamily: 'Abel',
                  color: Colors.black,
                  fontSize: 20,
                  height: 1.15,
                  wordSpacing: 2,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else if (outputText == "Not Recognized Image!") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: RichText(
          text: const TextSpan(
            children: [
              WidgetSpan(
                child: SizedBox(width: 30.0),
              ),
              TextSpan(
                text:
                "Unable to recognize the image. Please ensure clarity and focus in the image, or either the image is not a banana leaf.",
                style: TextStyle(
                  fontFamily: 'Abel',
                  color: Colors.black,
                  fontSize: 20,
                  height: 1.15,
                  wordSpacing: 2,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.justify,
        ),
      );
    } else {
      // Handle any other cases or provide a default container
      return Container();
    }
  }
}
