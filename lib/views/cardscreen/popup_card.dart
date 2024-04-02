import 'package:flutter/material.dart';
import 'package:tarrot/views/cardscreen/widgets/card_girdview.dart';
import 'package:tarrot/widgets/custom_btn.dart'; // Assuming CardData model is defined in a separate file

class PopupCard extends StatelessWidget {
  final CardData cardData;

  const PopupCard({Key? key, required this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      //SET THE BACKGROUND COLOR TO BLACK
      backgroundColor: const Color(0xff1D1A28),
      child: Container(
        width: 360,
        height: 560,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),

        // ADD A COLUMN TO DISPLAY THE CARD DETAILS
        child: Container(
          width: 350,
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 54, 49, 72),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),

                  // DISPLAY THE CARD LOGO
                  child: CardLogo(),
                ),
                const SizedBox(height: 10),

                // DISPLAY THE CARD NAME
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    cardData.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                
                // DISPLAY THE CARD DESCRIPTION
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Description goes here...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                
                // ADD A CONTAINER TO DISPLAY THE LINE
                Container(
                  height: 3,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //PREMIUM PRICE
                      const PremiumPrice(),
                      const SizedBox(height: 10),

                      //CUSTOM BUTTON
                      CustomButton(
                        ontap: () {},
                        btnText: 'Get Started',
                      ),
                      const SizedBox(height: 10),

                      //BULLET POINTS
                      const Text(
                        "Everything in basic included",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Tarot-Serif',
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return _buildBulletPoint('Bullet point $index');
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }


// Helper method to build bullet points
  Widget _buildBulletPoint(String s) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            color: Colors.white,
            size: 10,
          ),
          const SizedBox(width: 10),
          Text(
            s,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class PremiumPrice extends StatelessWidget {
  const PremiumPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 13,
          fontFamily: 'Tarot-Serif',
        ),
        children: [
          TextSpan(
            text: '\$10', // Dollar amount
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Tarot-Serif',
            ),
          ),
          TextSpan(
            text: ' per user/month billed annually or ',
          ),
          TextSpan(
            text: '\$14', // Dollar amount
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'Tarot-Serif',
            ),
          ),
          TextSpan(
            text: ' billed monthly',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'Tarot-Serif',
            ),
          )
        ],
      ),
    );
  }
}



// CardLogo widget
class CardLogo extends StatelessWidget {
  const CardLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
            ),
            Positioned(
              top: -6,
              left: 20,
              child: Text(
                'B',
                style: TextStyle(
                  fontFamily: 'TT Alientz',
                  fontWeight: FontWeight.w400,
                  fontSize: 50,
                  color: Color(0xff1D1A28),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


