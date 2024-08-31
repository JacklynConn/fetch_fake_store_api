import 'package:flutter/material.dart';
import 'package:flutter_part2/models/product_models.dart';
import '../../service/product_service/product_service.dart';
import 'detail_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel> products = [];
  bool isLoading = true;
  List<ProductModel> productSearch = [];

  void fetchProducts() async {
    await ProductService.getAllProducts().then((value) {
      setState(() {
        products = value;
        isLoading = false;
      });
    });
  }

  void searchProducts(String name) {
    setState(() {
      productSearch = products
          .where((element) =>
              element.title!.toLowerCase().contains(name.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[400],
        title: const Text(
          "Product Page",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.place_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 55,
              child: TextField(
                textAlign: TextAlign.center,
                cursorHeight: 25,
                style: const TextStyle(
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: "Searching...",
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ),
                ),
                onChanged: (text) {
                  searchProducts(text);
                },
              ),
            ),
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : productSearch.isEmpty
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                              childAspectRatio: 0.9,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          var data = products[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    productModel: data,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: SizedBox(
                                          height: 120,
                                          child: Image.network(
                                            data.image!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10, top: 10, right: 5),
                                              child: Text(
                                                data.title!,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Text(
                                              "\$${data.price}",
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        Text(
                                          data.rating!.rate.toString(),
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: productSearch.length,
                        itemBuilder: (context, index) {
                          var data = productSearch[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    productModel: data,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Image.network(
                                    data.image!,
                                    height: 60,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Text(
                                      data.title!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
