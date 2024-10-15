import 'package:flutter/material.dart';

class Startingslider extends StatefulWidget {
  const Startingslider({super.key});

  @override
  State<Startingslider> createState() => _StartingsliderState();
}

class _StartingsliderState extends State<Startingslider> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  bool lastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: currentPage == index ? 20 : 10, // Wider dot for the active page
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
                lastPage = index == 2;
              });
            },
            children: const [
              FirstImage(
                  imagePath: "images/fashion.png",
                  title: "Fashion",
                  paragraph: "Discover the latest trends in fashion."),
              FirstImage(
                  imagePath: "images/Sales.png",
                  title: "Sales",
                  paragraph: "Get the best deals on clothing and accessories."),
              FirstImage(
                  imagePath: "images/Shopping.png",
                  title: "Shopping",
                  paragraph: "Enjoy seamless shopping experience."),
            ],
          ),
          Positioned(
            bottom: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => _buildDot(index, context)),
            ),
          ),
          if (lastPage) // Show "Get Started" button on the last page
            Positioned(
              bottom: 10,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class FirstImage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String paragraph;
  const FirstImage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.paragraph,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,
              height: 300), // Set a fixed height for the image
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            paragraph,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
