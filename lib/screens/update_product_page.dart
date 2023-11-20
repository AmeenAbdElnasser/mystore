import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';
class UpdateProductPage extends StatefulWidget {
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();

  updateProduct({required id, required String title, required price, required String desc, required String image, required String category}) {}
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName , desc , image ;
  bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              CustomTextField(
                onChanged: (data)
                {
                  productName = data;
                },
                hintText: 'Product Name',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data)
                {
                  desc = data;
                },
                hintText: 'description',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                inputType: TextInputType.number,
                onChanged: (data)
                {
                  price = data;
                },
                hintText: 'price',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data)
                {
                  image = data;
                },
                hintText: 'image',
              ),
              SizedBox(
                height: 40,
              ),
              CustomButon(text: 'Update',
                onTap: ()
                {
                  isLoading = true;
                  setState(() {});
                  try {
                    updateproduct(product);
                    print('success');
                  }catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateproduct(ProductModel product) async {
  await UpdateProductPage().updateProduct(
      id : product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}


