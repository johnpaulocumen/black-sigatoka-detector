import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Trivia extends StatelessWidget {
  final int initialIndex;

  const Trivia({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 5,
              child: IconButton(
                icon: const Icon(Icons.keyboard_return_rounded, size: 25,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '  DISEASE OVERVIEW',
                      style: TextStyle(
                        fontFamily: 'RubikMoonrocks',
                        color: Color(0xFF092A1A),
                        fontSize: 24,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: ImageSlider(initialIndex: initialIndex),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  final int initialIndex;

  const ImageSlider({super.key, this.initialIndex = 0});

  @override
  ImageSliderState createState() => ImageSliderState();
}

class ImageSliderState extends State<ImageSlider> {
  final List<Map<String, String>> imageList = [
    {
      'url': 'images/carousel_1.jpg',
      'title': 'Symptoms',
      'description':
      'Black sigatoka (Mycosphaerella fijiensis) first causes small, light yellow spots or streaks on leaves of about one month old. The symptoms run parallel to the veins. Within a few days, the spots become a few centimetres in size and turn brown with light grey centres. These spots enlarge further and the tissue around the lesions turns yellow and dies. Lesions merge and the whole leaf turns brown and ultimately dies. In cases of severe infection leaves may die within a few weeks. Because of the lack of leaf tissues, fruit maturity is hampered (Koppert, 2023). The symptoms of Black Sigatoka are sometimes indistinguishable from those of Yellow Sigatoka, particularly in the advanced stages of necrosis, where they exhibit striking similarities. However, the disparity becomes evident in the early stages of evolution. In Stage 1, small whitish spots are visible only on the lower surface of the leaf. Progressing to Stage 2, brown rusty streaks become apparent, especially on the lower surface. In Stage 3, these streaks lengthen and widen. Moving to Stage 4, brown to black, round, or elliptical broad stripes develop. Advancing to Stage 5, the lesions turn black, usually surrounded by a yellow halo. Finally, in Stage 6, the center of the stain dries up with a black halo, itself surrounded by a yellow halo (The Institute of Technique Tropical , 2022).',
    },
    {
      'url': 'images/carousel_2.jpg',
      'title': 'Recommendations',
      'description':
      'Crucial steps to combat black sigatoka disease effectively. Maintain 6-8 healthy leaves during bunching for optimal bunch production. Remove infected/dried leaves, arranging them lower surface down in rows to curb disease spread. Control weeds, ensure proper drainage to minimize humidity favoring fungal growth. Employ fertilizers for healthy leaf emergence to counter the disease. Apply fungicides like Propiconazole, Fenpropimorph, Boscalid (with Banana spray oil), or Manzate (with water) every 14-21 days during the wet season, if disease data is not available. Rotate fungicides to prevent resistance, adhering strictly to safety guidelines provided by manufacturers (Peters, 2013).',
    },
    {
      'url': 'images/carousel_3.jpg',
      'title': 'Disease History',
      'description':
      'Black Sigatoka was first recognized in the Sigatoka Valley of Fiji in 1963, but was probably widespread in Southeast Asia and the South Pacific by that time. In the Western Hemisphere, it first appeared in 1972 in Honduras and now occurs on the mainland from central Mexico south to Bolivia and northwestern Brazil, and in the Caribbean basin in Cuba, Jamaica, the Dominican Republic and southern Florida. In Africa, the disease was first recorded in Zambia in 1973 and has since spread throughout the sub-Saharan portions of that continent (PLoetz, 2001). ',
    },
  ];

  late CarouselController _carouselController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height - 250.0;

    return Column(
      children: [
        Expanded(
          child: Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: containerHeight,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 1.0,
                enableInfiniteScroll: false,
                viewportFraction: 0.8,
                initialPage: _currentIndex,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imageList.map((Map<String, String> imageData) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: containerWidth,
                      height: containerHeight,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: containerWidth,
                              height: containerHeight,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(imageData['url']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: containerWidth,
                              height: containerHeight,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                ),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF092A1A),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      imageData['title']!,
                                      style: const TextStyle(
                                        fontFamily: 'BlackOpsOne',
                                        color: Colors.white,
                                        fontSize: 18,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                const WidgetSpan(
                                                  child: SizedBox(width: 25.0),
                                                ),
                                                TextSpan(
                                                  text: imageData['description']!,
                                                  style: const TextStyle(
                                                    fontFamily: 'Abel',
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    letterSpacing: 1.15,
                                                    wordSpacing: 2,
                                                    height: 1.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Slide ${_currentIndex + 1} of ${imageList.length}',
          style: const TextStyle(
            fontFamily: 'Lekton',
            fontSize: 16.0,
            color: Color(0xFF092A1A),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}