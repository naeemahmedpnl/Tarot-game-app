import 'package:flutter/material.dart';
import 'package:tarrot/views/cardscreen/details_screen.dart';
import 'package:tarrot/views/cardscreen/widgets/card_data.dart';



class CardData {
  final String name;
  final String description;
  final String imagePath;

  CardData({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class CardGirdView extends StatelessWidget {
  const CardGirdView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 163 / 246,
          ),
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the DetailScreen and pass the card data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(cardData: cards[index]),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  cards[index].imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
