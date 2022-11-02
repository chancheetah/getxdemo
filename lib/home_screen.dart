import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnews/custom_tag.dart';
import 'bottom_nav_bar.dart';
import 'getdatacontroller.dart';
import 'image_container.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  final getDataController = Get.put(GetDataController());

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getDataController.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(index: 0),
        extendBodyBehindAppBar: true,
        body: !getDataController.isLoading.value
            ? ListView(
                padding: EdgeInsets.zero,
                children: [
                  ImageContainer(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    imageUrl:
                        "https://res.cloudinary.com/people-matters/image/upload/fl_immutable_cache,w_624,h_351,q_auto,f_auto/v1578710070/1578710068.jpg",
//                    imageUrl: getDataController
//                            .getDataModel.value.articles![0].urlToImage ??
//                        "https://res.cloudinary.com/people-matters/image/upload/fl_immutable_cache,w_624,h_351,q_auto,f_auto/v1578710070/1578710068.jpg",
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTag(
                          backgroundColor: Colors.grey.withAlpha(150),
                          children: [
                            Text(
                              'News of the Day',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "title",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.25,
                                color: Colors.white,
                              ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Row(
                            children: [
                              Text(
                                'Learn More',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.arrow_right_alt,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
