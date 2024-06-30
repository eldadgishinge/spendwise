import 'package:flutter/material.dart';
import 'add_income.dart';
import 'add_expense.dart';
import 'resources_page.dart';
import 'profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'
    show timeDilation; // For controlling animation speed

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spendwise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildBalanceCard(context),
            _buildRecentTransactions(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpensePage()),
          );
        },
        backgroundColor: Color(0xFFFF8D6C),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            IconButton(
              icon: Icon(Icons.insert_chart),
              onPressed: () {},
            ),
            SizedBox(width: 40), // The dummy child
            IconButton(
              icon: Icon(Icons.folder),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResourcesPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00B2E7), Color(0xFFFF8D6C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Total Balance',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            Text('\$3800',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF0FAFE), // Light blue color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddIncomePage()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.arrow_upward,
                          color: Color(0xFFFF8D6C), size: 32),
                      Text('Income',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text('\$5000',
                          style: TextStyle(
                              fontSize: 20, color: Color(0xFFFF8D6C))),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF0FAFE), // Light blue color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddExpensePage()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.arrow_downward,
                          color: Color(0xFFFF8D6C), size: 32),
                      Text('Expenses',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text('\$1200',
                          style: TextStyle(
                              fontSize: 20, color: Color(0xFFFF8D6C))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Expanded(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Colors.orange),
            title: Text('Shopping'),
            subtitle: Text('Buy some grocery'),
            trailing: Text('- \$120'),
          ),
          ListTile(
            leading: Icon(Icons.subscriptions, color: Colors.purple),
            title: Text('Subscription'),
            subtitle: Text('Coursera Student'),
            trailing: Text('- \$80'),
          ),
          ListTile(
            leading: Icon(Icons.fastfood, color: Colors.red),
            title: Text('Food'),
            subtitle: Text('Buy a ramen'),
            trailing: Text('- \$32'),
          ),
        ],
      ),
    );
  }
}
