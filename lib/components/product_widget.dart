import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final counter = ValueNotifier<int>(0);

  ProductWidget({Key? key}) : super(key: key);
  Column _buildActions() {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            counter.value += 1;
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            height: 30,
            width: 30,
            child: Icon(Icons.add, color: Colors.white,),
          ),
        ),
        ValueListenableBuilder<int>(
            valueListenable: counter,
            builder: (context, value, child) {
              return Text('$value');
            }
        ),
        GestureDetector(
          onTap: (){
            if(counter.value >= 1){
              counter.value -= 1;
            };
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            height: 30,
            width: 30,
            child: Icon(Icons.remove, color: Colors.white,),
          ),
        ),
      ],
    );
  }

  Widget _buildCardProduct() {
    return Card(
      elevation: 10,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterLogo(
              size: 100,
            ),
            Column(
              children: [
                Text(
                  'A',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'R\$15,00',
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            _buildActions()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCardProduct();
  }
}
