import 'package:flutter/material.dart';

class RentDonateScreen extends StatefulWidget {
  const RentDonateScreen({super.key});

  @override
  State<RentDonateScreen> createState() => _RentDonateScreenState();
}

class _RentDonateScreenState extends State<RentDonateScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rent & Donate'),
        backgroundColor: Colors.lightBlue,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Rent'),
            Tab(text: 'Donate'),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRentTab(),
          _buildDonateTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new item to rent or donate based on current tab
          _showAddItemDialog(_tabController.index == 0 ? 'Rent' : 'Donate');
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildRentTab() {
    // Sample categories for rent
    final List<Map<String, dynamic>> rentCategories = [
      {'name': 'Tools', 'icon': Icons.build},
      {'name': 'Equipment', 'icon': Icons.handyman},
      {'name': 'Sports Gear', 'icon': Icons.sports},
      {'name': 'Party Supplies', 'icon': Icons.celebration},
      {'name': 'Electronics', 'icon': Icons.devices},
      {'name': 'Vehicles', 'icon': Icons.directions_car},
    ];

    // Sample items for rent
    final List<Map<String, dynamic>> rentItems = [
      {
        'name': 'Cordless Drill',
        'price': '\$5/day',
        'location': 'Downtown',
        'rating': 4.7,
        'image': 'assets/images/drill.jpg',
      },
      {
        'name': 'Pressure Washer',
        'price': '\$15/day',
        'location': 'Westside',
        'rating': 4.5,
        'image': 'assets/images/washer.jpg',
      },
      {
        'name': 'Camping Tent (4-person)',
        'price': '\$20/day',
        'location': 'Northside',
        'rating': 4.3,
        'image': 'assets/images/tent.jpg',
      },
      {
        'name': 'Digital Projector',
        'price': '\$25/day',
        'location': 'Eastside',
        'rating': 4.8,
        'image': 'assets/images/projector.jpg',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for items to rent',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
          ),
          const SizedBox(height: 24),

          // Categories
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rentCategories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.lightBlue.withOpacity(0.2),
                        child: Icon(
                          rentCategories[index]['icon'],
                          color: Colors.lightBlue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        rentCategories[index]['name'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Featured items
          const Text(
            'Featured Items for Rent',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: rentItems.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image placeholder
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rentItems[index]['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            rentItems[index]['price'],
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 14,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                rentItems[index]['location'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber.shade600,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                rentItems[index]['rating'].toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDonateTab() {
    // Sample categories for donations
    final List<Map<String, dynamic>> donateCategories = [
      {'name': 'Clothing', 'icon': Icons.checkroom},
      {'name': 'Books', 'icon': Icons.book},
      {'name': 'Furniture', 'icon': Icons.chair},
      {'name': 'Toys', 'icon': Icons.toys},
      {'name': 'Electronics', 'icon': Icons.devices},
      {'name': 'Food', 'icon': Icons.fastfood},
    ];

    // Sample items for donation
    final List<Map<String, dynamic>> donateItems = [
      {
        'name': 'Winter Clothes Collection',
        'organization': 'Hope Charity',
        'location': 'Downtown Center',
        'urgency': 'High',
        'image': 'assets/images/clothes.jpg',
      },
      {
        'name': 'Used Textbooks',
        'organization': 'Education for All',
        'location': 'University Area',
        'urgency': 'Medium',
        'image': 'assets/images/books.jpg',
      },
      {
        'name': 'Children\'s Toys',
        'organization': 'Kids Support',
        'location': 'Community Center',
        'urgency': 'Medium',
        'image': 'assets/images/toys.jpg',
      },
      {
        'name': 'Non-perishable Food',
        'organization': 'Food Bank',
        'location': 'Multiple Locations',
        'urgency': 'High',
        'image': 'assets/images/food.jpg',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for donation opportunities',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
          ),
          const SizedBox(height: 24),

          // Categories
          const Text(
            'Donation Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: donateCategories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green.withOpacity(0.2),
                        child: Icon(
                          donateCategories[index]['icon'],
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        donateCategories[index]['name'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Featured donation opportunities
          const Text(
            'Current Donation Needs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: donateItems.length,
            itemBuilder: (context, index) {
              Color urgencyColor;
              switch (donateItems[index]['urgency']) {
                case 'High':
                  urgencyColor = Colors.red.shade600;
                  break;
                case 'Medium':
                  urgencyColor = Colors.orange.shade600;
                  break;
                default:
                  urgencyColor = Colors.green.shade600;
              }

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image placeholder
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              donateItems[index]['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Organized by: ${donateItems[index]['organization']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: Colors.grey.shade600,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  donateItems[index]['location'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: urgencyColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: urgencyColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    '${donateItems[index]['urgency']} Need',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: urgencyColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Handle donate action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(100, 36),
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                              ),
                              child: const Text('Donate Now'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showAddItemDialog(String type) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add $type Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Item Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: type == 'Rent' ? 'Price per day' : 'Organization',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Handle image upload
                        },
                        icon: const Icon(Icons.photo_camera),
                        label: const Text('Take Photo'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Handle gallery selection
                        },
                        icon: const Icon(Icons.photo_library),
                        label: const Text('Gallery'),
                      ),
                    ),
                  ],
                ),
                if (type == 'Donate')
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Urgency Level',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Low', 'Medium', 'High']
                          .map((level) => DropdownMenuItem(
                        value: level,
                        child: Text(level),
                      ))
                          .toList(),
                      onChanged: (value) {
                        // Handle selection
                      },
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save the new item and close dialog
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: type == 'Rent' ? Colors.lightBlue : Colors.green,
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}