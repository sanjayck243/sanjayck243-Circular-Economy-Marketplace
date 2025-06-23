import 'package:flutter/material.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({super.key});

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy & Sell'),
        backgroundColor: Colors.lightBlue,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Buy'),
            Tab(text: 'Sell'),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBuyTab(),
          _buildSellTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton(
        onPressed: () {
          // Add new item to sell
          _showAddItemDialog();
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      )
          : null,
    );
  }

  Widget _buildBuyTab() {
    // Sample categories
    final List<Map<String, dynamic>> categories = [
      {'name': 'Electronics', 'icon': Icons.devices},
      {'name': 'Furniture', 'icon': Icons.chair},
      {'name': 'Clothing', 'icon': Icons.checkroom},
      {'name': 'Books', 'icon': Icons.book},
      {'name': 'Tools', 'icon': Icons.handyman},
      {'name': 'Sports', 'icon': Icons.sports_basketball},
    ];

    // Sample products
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Used Laptop',
        'price': '\$450',
        'location': 'Downtown',
        'image': 'assets/images/laptop.jpg',
        'rating': 4.5,
      },
      {
        'name': 'Wooden Chair',
        'price': '\$85',
        'location': 'Westside',
        'image': 'assets/images/chair.jpg',
        'rating': 4.2,
      },
      {
        'name': 'Vintage Bicycle',
        'price': '\$125',
        'location': 'Eastside',
        'image': 'assets/images/bicycle.jpg',
        'rating': 4.0,
      },
      {
        'name': 'Camera',
        'price': '\$220',
        'location': 'Northside',
        'image': 'assets/images/camera.jpg',
        'rating': 4.7,
      },
    ];

    return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Search bar
    TextField(
    controller: _searchController,
    decoration: InputDecoration(
    hintText: 'Search for items',
    prefixIcon: const Icon(Icons.search),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: Colors.grey.shade100,
    ),
    ),
    const SizedBox(height: 20),

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
    itemCount: categories.length,
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
    categories[index]['icon'],
    color: Colors.lightBlue,
    ),
    ),
    const SizedBox(height: 8),
    Text(
    categories[index]['name'],
    textAlign: TextAlign.center,
    style: const TextStyle(fontSize: 12),
    ),
    ],
    ),
    );
    },
    ),
    ),

    const SizedBox(height: 20),

    // Products list
    const Text(
    'Recently Added',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(height: 12),
    ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: products.length,
    itemBuilder: (context, index) {
    return Card(
    margin: const EdgeInsets.only(bottom: 16),
    elevation: 2,
    child: ListTile(
    contentPadding: const EdgeInsets.all(12),
    leading: Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(
    Icons.image,
    color: Colors.grey.shade600,
    ),
    ),
    title: Text(
    products[index]['name'],
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const SizedBox(height: 4),
    Text(products[index]['price']),
    const SizedBox(height: 4),
    Row(
    children: [
    Icon(
    Icons.location_pin,
    size: 16,
    color: Colors.grey.shade600,
    ),
    const SizedBox(width: 4),
    Text(
    products[index]['location'],
    style: TextStyle(
    color: Colors.grey.shade600,
    fontSize: 12,
    ),
    ),
      const SizedBox(width: 8),
      Icon(
        Icons.star,
        size: 16,
        color: Colors.amber,
      ),
      const SizedBox(width: 4),
      Text(
        '${products[index]['rating']}',
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 12,
        ),
      ),
    ],
    ),
    ],
    ),
      trailing: IconButton(
        icon: const Icon(Icons.favorite_border),
        onPressed: () {},
      ),
      onTap: () {
        // View product details
      },
    ),
    );
    },
    ),
    ],
    ),
    );
  }

  Widget _buildSellTab() {
    // Sample listed items
    final List<Map<String, dynamic>> listedItems = [
      {
        'name': 'Old Smartphone',
        'price': '\$120',
        'status': 'Active',
        'views': 24,
      },
      {
        'name': 'Coffee Table',
        'price': '\$75',
        'status': 'Pending',
        'views': 8,
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats cards
          Row(
            children: [
              Expanded(
                child: _buildStatCard('Items Listed', '2'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard('Items Sold', '0'),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // My listings
          const Text(
            'My Listings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          listedItems.isEmpty
              ? Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Icon(
                  Icons.inventory,
                  size: 64,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 16),
                Text(
                  'No items listed yet',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _showAddItemDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                  child: const Text('Add Item'),
                ),
              ],
            ),
          )
              : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listedItems.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 2,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  title: Text(
                    listedItems[index]['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(listedItems[index]['price']),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: listedItems[index]['status'] == 'Active'
                                  ? Colors.green.shade100
                                  : Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              listedItems[index]['status'],
                              style: TextStyle(
                                color: listedItems[index]['status'] == 'Active'
                                    ? Colors.green.shade800
                                    : Colors.orange.shade800,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.visibility,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${listedItems[index]['views']} views',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                    onSelected: (value) {
                      // Handle menu actions
                    },
                  ),
                  onTap: () {
                    // View item details
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Item for Sale'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                    prefixText: '\$',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add photo logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                  ),
                  icon: const Icon(Icons.add_a_photo),
                  label: const Text('Add Photos'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save item logic
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
              child: const Text('List Item'),
            ),
          ],
        );
      },
    );
  }
}
