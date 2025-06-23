import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import all the screens
import 'screens/AccountScreen.dart';
import 'screens/BuySellScreen.dart';
import 'screens/CartScreen.dart';
import 'screens/home_screen.dart';
import 'screens/MoreScreen.dart';
import 'screens/RentDonateScreen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';

void main() {
  runApp(const CircularEconomyApp());
}

class CircularEconomyApp extends StatelessWidget {
  const CircularEconomyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CEM',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        colorScheme: const ColorScheme.light(
          primary: Colors.lightBlue,
          secondary: Colors.grey,
        ),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/account': (context) => const AccountScreen(),
        '/buysell': (context) => const BuySellScreen(),
        '/cart': (context) => const CartScreen(),
        '/more': (context) => const MoreScreen(),
        '/rentdonate': (context) => const RentDonateScreen(),
        '/login': (context) => const LoginScreen(),

      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  // List of screens for the bottom navigation
  final List<Widget> _screens = [
    const HomeContent(), // This will be your current home screen content
    const CartScreen(),
    const AccountScreen(),
    const MoreScreen(),
  ];

  // Images for the sliding banner
  final List<String> bannerImages = [
    'assets/images/product1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  // Products for advertisement
  final List<Map<String, dynamic>> adProducts = [
    {
      'name': 'Refurbished Computers',
      'price': '\$49.99',
      'image': 'assets/images/product1.jpg',
    },
    {
      'name': 'Reclaimed Tables',
      'price': '\$299.50',
      'image': 'assets/images/product2.jpg',
    },
    {
      'name': 'Recycled Steel',
      'price': '\$12.99/kg',
      'image': 'assets/images/product3.jpg',
    },
    {
      'name': 'Eco-Cement',
      'price': '\$8.50/bag',
      'image': 'assets/images/product4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '🔍 Search for products...',
                  hintStyle: const TextStyle(color: Colors.white70, fontSize: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/signup'),
            child: const Text(
              "🚀 Sign Up",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
      drawer: buildDrawer(context),
      body: _selectedIndex == 0
          ? const HomeContent()
          : _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '🏠 Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '🛒 Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '👤 Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '📋 More',
          ),
        ],
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.lightBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'CEM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.lightBlue),
              title: const Text('Home', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.lightBlue),
              title: const Text('Buy & Sell', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/buysell');
              },
            ),
            ListTile(
              leading: const Icon(Icons.card_giftcard, color: Colors.lightBlue),
              title: const Text('Rent & Donate', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/rentdonate');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.lightBlue),
              title: const Text('Cart', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.lightBlue),
              title: const Text('Account', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.more_horiz, color: Colors.lightBlue),
              title: const Text('More', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Colors.lightBlue),
              title: const Text('Login', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add, color: Colors.lightBlue),
              title: const Text('Sign Up', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Home content remains the same
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildWelcomeSection(),
              const SizedBox(height: 30),
              buildImageSlider(),
              const SizedBox(height: 30),
              buildAdvertisementProducts(),
              const SizedBox(height: 30),
              buildFeatureGrid(context),
              const SizedBox(height: 30),
              buildAboutSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWelcomeSection() {
    return Text("CEM",
        style: GoogleFonts.montserrat(
            fontSize: 42, fontWeight: FontWeight.bold, color: Colors.black));
  }

  Widget buildImageSlider() {
    final List<String> bannerImages = [
      'assets/images/banner1.jpg',
      'assets/images/banner2.jpg',
      'assets/images/banner3.jpg',
    ];

    final PageController _pageController = PageController(initialPage: 0);

    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: bannerImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                bannerImages[index],
                fit: BoxFit.cover,
                // Use a placeholder if you don't have the actual images yet
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: Center(
                      child: Text(
                        'Banner ${index + 1}',
                        style: const TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildAdvertisementProducts() {
    final List<Map<String, dynamic>> adProducts = [
      {
        'name': 'Refurbished Computers',
        'price': '\$499.99',
        'image': 'assets/images/product1.jpg',
      },
      {
        'name': 'Reclaimed Tables',
        'price': '\$299.50',
        'image': 'assets/images/product2.jpg',
      },
      {
        'name': 'Recycled Steel',
        'price': '\$12.99/kg',
        'image': 'assets/images/product3.jpg',
      },
      {
        'name': 'Eco-Cement',
        'price': '\$8.50/bag',
        'image': 'assets/images/product4.jpg',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Featured Products",
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: adProducts.length,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Container(
                        height: 140,
                        color: Colors.grey.shade200,
                        child: Center(
                          child: Text(
                            '${adProducts[index]['name']}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            adProducts[index]['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            adProducts[index]['price'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildFeatureGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Our Services",
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            buildFeatureCard(
              '♻️ Buy & Sell',
              'Trade pre-loved items',
                  () {
                Navigator.pushNamed(context, '/buysell');
              },
            ),
            buildFeatureCard(
              '🎁 Rent & Donate',
              'Share resources',
                  () {
                Navigator.pushNamed(context, '/rentdonate');
              },
            ),
            buildFeatureCard(
              '📚 Learn',
              'Sustainability tips',
                  () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Learn'),
                      content: const Text('This is a placeholder for the Learn screen.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close', style: TextStyle(color: Colors.lightBlue)),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            buildFeatureCard(
              '👥 Community',
              'Join local events',
                  () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Community'),
                      content: const Text('This is a placeholder for the Community screen.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close', style: TextStyle(color: Colors.lightBlue)),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildFeatureCard(String title, String subtitle, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About Us",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "We're on a mission to promote sustainability through a circular economy. Our platform connects people who want to buy, sell, rent, or donate pre-loved items.",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}