import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedMenu = 0;

  bool showDetail = false;
  bool showPayment = false;
  bool showPaymentSuccess = false;
  bool isEditing = false;
  bool showTableError = false;

  int selectedFood = 0;

  int quantity1 = 1;
  int quantity2 = 1;
  int quantity3 = 1;
  int quantity4 = 1;
  int quantity5 = 1;
  int quantity6 = 1;
  int quantity7 = 1;
  int quantity8 = 1;

  bool checkout1 = false;
  bool checkout2 = false;
  bool checkout3 = false;
  bool checkout4 = false;
  bool checkout5 = false;
  bool checkout6 = false;
  bool checkout7 = false;
  bool checkout8 = false;

  bool extraCheese1 = false;
  bool extraCheese2 = false;

  String size1 = 'Medium';
  String size2 = 'Medium';

  String note1 = '';
  String note2 = '';
  String note3 = '';
  String note4 = '';
  String note5 = '';
  String note6 = '';
  String note7 = '';
  String note8 = '';

  String selectedSize = 'Medium';
  bool extraCheese = false;
  String note = '';

  String paymentMethod = 'QRIS';

  final TextEditingController noteController = TextEditingController();
  final TextEditingController tableController = TextEditingController();

  final List<String> foodNames = [
    'Mushroom Truffle Pizza',
    'Pepperoni Pizza',
    'Cheese Burger',
    'French Fries',
    'Chicken Wings',
    'Iced Tea',
    'Coca Cola',
    'Sprite',
  ];

  final List<String> foodDescriptions = [
    'Pizza dengan topping mushroom, truffle, dan keju yang gurih.',
    'Pizza dengan topping pepperoni dan keju mozzarella.',
    'Burger dengan beef patty, keju, dan sayuran segar.',
    'Kentang goreng renyah dengan rasa gurih.',
    'Chicken wings dengan bumbu BBQ yang gurih.',
    'Teh dingin yang menyegarkan.',
    'Minuman Coca Cola dingin yang menyegarkan.',
    'Minuman Sprite dingin dengan rasa lemon-lime.',
  ];

  final List<int> foodPrices = [
    45000,
    42000,
    35000,
    20000,
    30000,
    10000,
    10000,
    10000,
  ];

  final List<String> foodImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIKQePQtzSD4yX3JgD_j8Hr5cO73OtWCV_sT5ZzQc8MzARKWDzhnO-__FA&s=10',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnW_hAOH_8EwdSaw9TUFm9wAtayYKobwFWy8xkb1DQzZarzcO1L2UDEGVy&s=10',
    'https://images.themodernproper.com/production/posts/2016/ClassicCheeseBurger_9.jpg?w=1200&h=1200&q=60&fm=jpg&fit=crop&dm=1749310239&s=463b18fc3bb51dc5d96e866c848527c4',
    'https://images.unsplash.com/photo-1573080496219-bb080dd4f877',
    'https://www.thecookierookie.com/wp-content/uploads/2024/02/bbq-chicken-wings-recipe-2-960x1200.jpg',
    'https://images.unsplash.com/photo-1556679343-c7306c1976bc',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcnd-QguEcdBOuFrTwoB6ayPjE3yKJ7q7xHXnt_JAzcg2lChT2fR-q3a0&s=10',
    'https://cdn11.bigcommerce.com/s-2fq65jrvsu/images/stencil/500x659/products/547/6472/sprite_500ml__63811.1759836924.jpg?c=1',
  ];

  @override
  void dispose() {
    noteController.dispose();
    tableController.dispose();
    super.dispose();
  }

  String formatPrice(int price) {
    int thousands = price ~/ 1000;
    int remainder = price % 1000;

    if (remainder == 0) {
      return 'Rp $thousands.000';
    }

    return 'Rp $thousands.$remainder';
  }

  int getQuantity(int index) {
    if (index == 0) {
      return quantity1;
    }

    if (index == 1) {
      return quantity2;
    }

    if (index == 2) {
      return quantity3;
    }

    if (index == 3) {
      return quantity4;
    }

    if (index == 4) {
      return quantity5;
    }

    if (index == 5) {
      return quantity6;
    }

    if (index == 6) {
      return quantity7;
    }

    return quantity8;
  }

  String getNote(int index) {
    if (index == 0) {
      return note1;
    }

    if (index == 1) {
      return note2;
    }

    if (index == 2) {
      return note3;
    }

    if (index == 3) {
      return note4;
    }

    if (index == 4) {
      return note5;
    }

    if (index == 5) {
      return note6;
    }

    if (index == 6) {
      return note7;
    }

    return note8;
  }

  int getProductPrice(int index) {
    int price = foodPrices[index];

    if (index == 0) {
      if (size1 == 'Medium') {
        price = price + 5000;
      }

      if (size1 == 'Large') {
        price = price + 10000;
      }

      if (extraCheese1) {
        price = price + 5000;
      }
    }

    if (index == 1) {
      if (size2 == 'Medium') {
        price = price + 5000;
      }

      if (size2 == 'Large') {
        price = price + 10000;
      }

      if (extraCheese2) {
        price = price + 5000;
      }
    }

    return price;
  }

  int getSubtotal() {
    int total = 0;

    if (checkout1) {
      total = total + getProductPrice(0) * quantity1;
    }

    if (checkout2) {
      total = total + getProductPrice(1) * quantity2;
    }

    if (checkout3) {
      total = total + getProductPrice(2) * quantity3;
    }

    if (checkout4) {
      total = total + getProductPrice(3) * quantity4;
    }

    if (checkout5) {
      total = total + getProductPrice(4) * quantity5;
    }

    if (checkout6) {
      total = total + getProductPrice(5) * quantity6;
    }

    if (checkout7) {
      total = total + getProductPrice(6) * quantity7;
    }

    if (checkout8) {
      total = total + getProductPrice(7) * quantity8;
    }

    return total;
  }

  int getServiceFee() {
    if (getTotalProduct() > 0) {
      return 3000;
    }

    return 0;
  }

  int getTotalPrice() {
    return getSubtotal() + getServiceFee();
  }

  int getTotalProduct() {
    int total = 0;

    if (checkout1) {
      total = total + quantity1;
    }

    if (checkout2) {
      total = total + quantity2;
    }

    if (checkout3) {
      total = total + quantity3;
    }

    if (checkout4) {
      total = total + quantity4;
    }

    if (checkout5) {
      total = total + quantity5;
    }

    if (checkout6) {
      total = total + quantity6;
    }

    if (checkout7) {
      total = total + quantity7;
    }

    if (checkout8) {
      total = total + quantity8;
    }

    return total;
  }

  void openDetail(int index) {
    setState(() {
      selectedFood = index;
      showDetail = true;
      isEditing = false;

      if (index == 0) {
        selectedSize = size1;
        extraCheese = extraCheese1;
        note = note1;
      }

      if (index == 1) {
        selectedSize = size2;
        extraCheese = extraCheese2;
        note = note2;
      }

      if (index == 2) {
        note = note3;
      }

      if (index == 3) {
        note = note4;
      }

      if (index == 4) {
        note = note5;
      }

      if (index == 5) {
        note = note6;
      }

      if (index == 6) {
        note = note7;
      }

      if (index == 7) {
        note = note8;
      }

      noteController.text = note;
    });
  }

  void editProduct(int index) {
    setState(() {
      selectedFood = index;
      showDetail = true;
      isEditing = true;

      if (index == 0) {
        selectedSize = size1;
        extraCheese = extraCheese1;
        note = note1;
      }

      if (index == 1) {
        selectedSize = size2;
        extraCheese = extraCheese2;
        note = note2;
      }

      if (index == 2) {
        note = note3;
      }

      if (index == 3) {
        note = note4;
      }

      if (index == 4) {
        note = note5;
      }

      if (index == 5) {
        note = note6;
      }

      if (index == 6) {
        note = note7;
      }

      if (index == 7) {
        note = note8;
      }

      noteController.text = note;
    });
  }

  void saveProduct() {
    setState(() {
      note = noteController.text;

      if (selectedFood == 0) {
        size1 = selectedSize;
        extraCheese1 = extraCheese;
        note1 = note;
        checkout1 = true;

        if (quantity1 == 0) {
          quantity1 = 1;
        }
      }

      if (selectedFood == 1) {
        size2 = selectedSize;
        extraCheese2 = extraCheese;
        note2 = note;
        checkout2 = true;

        if (quantity2 == 0) {
          quantity2 = 1;
        }
      }

      if (selectedFood == 2) {
        note3 = note;
        checkout3 = true;

        if (quantity3 == 0) {
          quantity3 = 1;
        }
      }

      if (selectedFood == 3) {
        note4 = note;
        checkout4 = true;

        if (quantity4 == 0) {
          quantity4 = 1;
        }
      }

      if (selectedFood == 4) {
        note5 = note;
        checkout5 = true;

        if (quantity5 == 0) {
          quantity5 = 1;
        }
      }

      if (selectedFood == 5) {
        note6 = note;
        checkout6 = true;

        if (quantity6 == 0) {
          quantity6 = 1;
        }
      }

      if (selectedFood == 6) {
        note7 = note;
        checkout7 = true;

        if (quantity7 == 0) {
          quantity7 = 1;
        }
      }

      if (selectedFood == 7) {
        note8 = note;
        checkout8 = true;

        if (quantity8 == 0) {
          quantity8 = 1;
        }
      }

      showDetail = false;
      isEditing = false;
      selectedMenu = 1;
    });
  }

  void removeProduct(int index) {
    setState(() {
      if (index == 0) {
        quantity1 = 1;
        checkout1 = false;
      }

      if (index == 1) {
        quantity2 = 1;
        checkout2 = false;
      }

      if (index == 2) {
        quantity3 = 1;
        checkout3 = false;
      }

      if (index == 3) {
        quantity4 = 1;
        checkout4 = false;
      }

      if (index == 4) {
        quantity5 = 1;
        checkout5 = false;
      }

      if (index == 5) {
        quantity6 = 1;
        checkout6 = false;
      }

      if (index == 6) {
        quantity7 = 1;
        checkout7 = false;
      }

      if (index == 7) {
        quantity8 = 1;
        checkout8 = false;
      }
    });
  }

  void startPayment() {
    if (tableController.text == '') {
      setState(() {
        showTableError = true;
      });
      return;
    }

    setState(() {
      showTableError = false;
      showPayment = true;
    });
  }

  void finishPayment() {
    setState(() {
      showPayment = false;
      showPaymentSuccess = true;
    });
  }

  void finishCashOrder() {
    setState(() {
      showPayment = false;
      showPaymentSuccess = true;
    });
  }

  void finishOrder() {
    setState(() {
      showPaymentSuccess = false;

      checkout1 = false;
      checkout2 = false;
      checkout3 = false;
      checkout4 = false;
      checkout5 = false;
      checkout6 = false;
      checkout7 = false;
      checkout8 = false;

      quantity1 = 1;
      quantity2 = 1;
      quantity3 = 1;
      quantity4 = 1;
      quantity5 = 1;
      quantity6 = 1;
      quantity7 = 1;
      quantity8 = 1;

      tableController.clear();
      showTableError = false;

      selectedMenu = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalProduct = getTotalProduct();
    int totalPrice = getTotalPrice();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: const Icon(
            Icons.fastfood,
            color: Colors.white,
          ),
          title: const Text(
            'Food Order',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: showPaymentSuccess
              ? buildPaymentSuccess()
              : showPayment
                  ? buildPaymentPage()
                  : showDetail
                      ? buildDetail()
                      : buildPage(),
        ),
        bottomNavigationBar:
            showDetail || showPayment || showPaymentSuccess
                ? null
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (totalProduct > 0 && selectedMenu != 2)
                        Container(
                          margin: const EdgeInsets.fromLTRB(
                            15,
                            10,
                            15,
                            10,
                          ),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total ($totalProduct produk)',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    formatPrice(totalPrice),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedMenu = 2;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('Checkout'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        currentIndex: selectedMenu,
                        selectedItemColor: Colors.red,
                        unselectedItemColor: Colors.grey,
                        onTap: (index) {
                          setState(() {
                            selectedMenu = index;
                            showTableError = false;
                          });
                        },
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.restaurant_menu),
                            label: 'Menu',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart),
                            label: 'Cart',
                          ),
                        ],
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget buildPage() {
    if (selectedMenu == 0) {
      return buildHome();
    }

    if (selectedMenu == 1) {
      return buildMenu();
    }

    return buildCart();
  }

  Widget buildHome() {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 700;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 30 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Pesan makanan favoritmu dengan mudah.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isDesktop ? 30 : 20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'REKOMENDASI HARI INI',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Nikmati makanan\nfavoritmu!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedMenu = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red,
                      ),
                      child: const Text('Lihat Menu'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Menu Favorit',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            buildFoodCard(0),
            buildFoodCard(1),
            buildFoodCard(2),
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 700;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 30 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Menu',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Pilih makanan yang kamu suka.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            buildFoodCard(0),
            buildFoodCard(1),
            buildFoodCard(2),
            buildFoodCard(3),
            buildFoodCard(4),
            buildFoodCard(5),
            buildFoodCard(6),
            buildFoodCard(7),
          ],
        ),
      ),
    );
  }

  Widget buildFoodCard(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 700;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              foodImages[index],
              width: isDesktop ? 150 : 110,
              height: isDesktop ? 150 : 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodNames[index],
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  foodDescriptions[index],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Text(
                  formatPrice(foodPrices[index]),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      openDetail(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Text(
                        'Lihat Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetail() {
    int finalPrice = foodPrices[selectedFood];

    if (selectedFood == 0 || selectedFood == 1) {
      if (selectedSize == 'Medium') {
        finalPrice = finalPrice + 5000;
      }

      if (selectedSize == 'Large') {
        finalPrice = finalPrice + 10000;
      }

      if (extraCheese) {
        finalPrice = finalPrice + 5000;
      }
    }

    int currentQuantity = getQuantity(selectedFood);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            foodImages[selectedFood],
            width: double.infinity,
            height: 280,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showDetail = false;
                        isEditing = false;
                      });
                    },
                    child: const Text(
                      '< Kembali',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  foodNames[selectedFood],
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  formatPrice(finalPrice),
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  foodDescriptions[selectedFood],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                if (selectedFood == 0 || selectedFood == 1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      const Text(
                        'Ukuran',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          buildSizeButton('Small'),
                          const SizedBox(width: 8),
                          buildSizeButton('Medium'),
                          const SizedBox(width: 8),
                          buildSizeButton('Large'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              extraCheese = !extraCheese;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: extraCheese
                                  ? Colors.red.shade50
                                  : Colors.white,
                              border: Border.all(
                                color: extraCheese
                                    ? Colors.red
                                    : Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  extraCheese
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Extra Cheese + Rp 5.000',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 25),
                const Text(
                  'Jumlah',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedFood == 0 &&
                                quantity1 > 1) {
                              quantity1--;
                            }

                            if (selectedFood == 1 &&
                                quantity2 > 1) {
                              quantity2--;
                            }

                            if (selectedFood == 2 &&
                                quantity3 > 1) {
                              quantity3--;
                            }

                            if (selectedFood == 3 &&
                                quantity4 > 1) {
                              quantity4--;
                            }

                            if (selectedFood == 4 &&
                                quantity5 > 1) {
                              quantity5--;
                            }

                            if (selectedFood == 5 &&
                                quantity6 > 1) {
                              quantity6--;
                            }

                            if (selectedFood == 6 &&
                                quantity7 > 1) {
                              quantity7--;
                            }

                            if (selectedFood == 7 &&
                                quantity8 > 1) {
                              quantity8--;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '$currentQuantity',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedFood == 0) {
                              quantity1++;
                            }

                            if (selectedFood == 1) {
                              quantity2++;
                            }

                            if (selectedFood == 2) {
                              quantity3++;
                            }

                            if (selectedFood == 3) {
                              quantity4++;
                            }

                            if (selectedFood == 4) {
                              quantity5++;
                            }

                            if (selectedFood == 5) {
                              quantity6++;
                            }

                            if (selectedFood == 6) {
                              quantity7++;
                            }

                            if (selectedFood == 7) {
                              quantity8++;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.add_circle,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Text(
                  'Catatan Pesanan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: noteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: '(Opsional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: saveProduct,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        isEditing
                            ? 'Simpan Perubahan'
                            : 'Tambah ke Keranjang',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSizeButton(String size) {
    bool selected = selectedSize == size;

    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: selected ? Colors.red : Colors.white,
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                size,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCart() {
    int subtotal = getSubtotal();
    int serviceFee = getServiceFee();
    int totalPrice = getTotalPrice();

    bool cartEmpty =
        !checkout1 &&
        !checkout2 &&
        !checkout3 &&
        !checkout4 &&
        !checkout5 &&
        !checkout6 &&
        !checkout7 &&
        !checkout8;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Keranjang',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Pesanan yang kamu pilih.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                if (cartEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: Text(
                        'Keranjang masih kosong',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                if (checkout1) buildCartItem(0),
                if (checkout2) buildCartItem(1),
                if (checkout3) buildCartItem(2),
                if (checkout4) buildCartItem(3),
                if (checkout5) buildCartItem(4),
                if (checkout6) buildCartItem(5),
                if (checkout7) buildCartItem(6),
                if (checkout8) buildCartItem(7),
                if (!cartEmpty) ...[
                  const SizedBox(height: 10),
                  const Text(
                    'Nomor Meja',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: tableController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value != '') {
                        setState(() {
                          showTableError = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Masukkan nomor meja',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ringkasan Pembayaran',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        if (checkout1) buildCheckoutItem(0),
                        if (checkout2) buildCheckoutItem(1),
                        if (checkout3) buildCheckoutItem(2),
                        if (checkout4) buildCheckoutItem(3),
                        if (checkout5) buildCheckoutItem(4),
                        if (checkout6) buildCheckoutItem(5),
                        if (checkout7) buildCheckoutItem(6),
                        if (checkout8) buildCheckoutItem(7),
                        const Divider(),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Subtotal',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              formatPrice(subtotal),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Service Fee'),
                            Text(
                              formatPrice(serviceFee),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              formatPrice(totalPrice),
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Metode Pembayaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      buildPaymentButton('QRIS'),
                      const SizedBox(width: 8),
                      buildPaymentButton('Bayar di Kasir'),
                    ],
                  ),
                  const SizedBox(height: 25),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: startPayment,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Buat Pesanan',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ],
            ),
          ),
        ),
        if (showTableError && !cartEmpty)
          Positioned(
            top: 10,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 13,
              ),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Mohon isi nomor meja',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget buildCheckoutItem(int index) {
    int quantity = getQuantity(index);
    int price = getProductPrice(index);
    int total = price * quantity;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodNames[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$quantity x ${formatPrice(price)}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatPrice(total),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCartItem(int index) {
    int quantity = getQuantity(index);
    int price = getProductPrice(index);

    String modification = '';

    if (index == 0) {
      modification = size1;

      if (extraCheese1) {
        modification = '$modification • Extra Cheese';
      }
    }

    if (index == 1) {
      modification = size2;

      if (extraCheese2) {
        modification = '$modification • Extra Cheese';
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  foodImages[index],
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodNames[index],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (modification != '')
                      Text(
                        modification,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    const SizedBox(height: 5),
                    Text(
                      formatPrice(price),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    editProduct(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (getNote(index) != '')
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                'Catatan: ${getNote(index)}',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (quantity == 1) {
                      removeProduct(index);
                    } else {
                      setState(() {
                        if (index == 0) {
                          quantity1--;
                        }

                        if (index == 1) {
                          quantity2--;
                        }

                        if (index == 2) {
                          quantity3--;
                        }

                        if (index == 3) {
                          quantity4--;
                        }

                        if (index == 4) {
                          quantity5--;
                        }

                        if (index == 5) {
                          quantity6--;
                        }

                        if (index == 6) {
                          quantity7--;
                        }

                        if (index == 7) {
                          quantity8--;
                        }
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '$quantity',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (index == 0) {
                        quantity1++;
                      }

                      if (index == 1) {
                        quantity2++;
                      }

                      if (index == 2) {
                        quantity3++;
                      }

                      if (index == 3) {
                        quantity4++;
                      }

                      if (index == 4) {
                        quantity5++;
                      }

                      if (index == 5) {
                        quantity6++;
                      }

                      if (index == 6) {
                        quantity7++;
                      }

                      if (index == 7) {
                        quantity8++;
                      }
                    });
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.red,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                formatPrice(price * quantity),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPaymentButton(String payment) {
    bool selected = paymentMethod == payment;

    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() {
              paymentMethod = payment;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: selected ? Colors.red : Colors.white,
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                payment,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPaymentPage() {
    int totalPrice = getTotalPrice();

    if (paymentMethod == 'QRIS') {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPayment = false;
                    });
                  },
                  child: const Text(
                    '< Kembali ke Keranjang',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Text(
                  'Pembayaran QRIS',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Silakan scan QRIS di bawah\nuntuk menyelesaikan pembayaran.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: Container(
                  width: 230,
                  height: 230,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.qr_code_2,
                      size: 150,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formatPrice(totalPrice),
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: finishPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Saya Sudah Membayar',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showPayment = false;
                  });
                },
                child: const Text(
                  '< Kembali ke Keranjang',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Center(
              child: Icon(
                Icons.point_of_sale,
                size: 70,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Silakan Bayar di Kasir',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Pesanan kamu telah dibuat.\nSilakan lakukan pembayaran di kasir.\n\nPesanan akan diproses setelah pembayaran dilakukan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formatPrice(totalPrice),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: finishCashOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentSuccess() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Pesanan Berhasil!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              paymentMethod == 'QRIS'
                  ? 'Pembayaran berhasil.\nPesanan kamu sedang diproses.'
                  : 'Pesanan kamu telah dibuat.\nPesanan akan diproses setelah pembayaran di kasir.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Nomor Meja: ${tableController.text}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: finishOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}