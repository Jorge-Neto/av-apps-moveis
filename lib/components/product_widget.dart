import 'package:avaliacao/core/app_colors.dart';
import 'package:avaliacao/models/product_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatelessWidget {
  final counter = ValueNotifier<int>(0);
  final ProductModel productModel;

  ProductWidget({Key? key, required this.productModel}) : super(key: key);

  Column _buildActions() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            counter.value += 1;
          },
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.colorGreen,
              shape: BoxShape.circle,
            ),
            height: 30,
            width: 30,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder<int>(
              valueListenable: counter,
              builder: (context, value, child) {
                return Text('$value');
              }),
        ),
        GestureDetector(
          onTap: () {
            if (counter.value >= 1) {
              counter.value -= 1;
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.colorRed,
              shape: BoxShape.circle,
            ),
            height: 30,
            width: 30,
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardProduct() {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.network(
                productModel.imageUrl,
                height: 60,
                width: 60,
                semanticsLabel: productModel.name,
                placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator()),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        productModel.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'R\$ ${productModel.value.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              _buildActions(),
              const SizedBox(
                width: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCardProduct();
  }
}
