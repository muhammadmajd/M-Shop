

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/common/widgets/appbar/tabbar.dart';
import 'package:tinder/common/widgets/custom_shapes/container/search_container.dart';
import 'package:tinder/common/widgets/layouts/grid_layout.dart';
import 'package:tinder/features/shop/controllers/category_controller.dart';
import 'package:tinder/utils/constents/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/shimmers/brand_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constents/colors.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../controllers/brand_controller.dart';
import '../brand/all_brands.dart';
import '../brand/brand_products.dart';
import 'category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen ({super. key});
  @override
  Widget build (BuildContext context) {
    final brandController = Get .put(BrandController());

    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
          appBar: TAppBar (
            title: Text('Store', style: Theme.of (context) .textTheme. headlineMedium),
            actions: [
                  TCartCounterIcon(onPressed: (){}, iconColor: TColors.white,),
              ],
            ),

          body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors
                    .black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding:  const EdgeInsets.all(TSizes.defaultSpace,),
                child: ListView(
                  shrinkWrap: true,
                // physics:  const NeverScrollableScrollPhysics(),
                  children:  [
                    /// --- Search bar
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    const TSearchContainer(text: '', showBorder: true,showBackground: false,padding: EdgeInsets.zero),
                    const SizedBox(height: TSizes.spacesBtwsections,),

                    /// -- Featured Brands
                    TSectionHeading(title: 'Featured Brands', onPressed: ()=>Get.to(()=>const AllBrandsScreen())),
                     const SizedBox (height: TSizes.spaceBtwItems / 1.5),

                    Obx(
                      (){
                    if (brandController.isLoading.value) return const TBrandsShimmer();
                                if (brandController .featuredBrands.isEmpty) {
                                  return Center(
                                      child: Text('No Data Found!', style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(color: Colors.white)));
                                }

                        return TGridLayout(itemCount: brandController.featuredBrands.length,
                                  mainAxisExtent: 80,
                                  //mainAxisExtent: 80,
                                  itemBuilder: (_, index){
                                    final brand = brandController.featuredBrands [index];
                                return  TBrandCard(showBorder: true, brand: brand,
                                  onTap: ()=>Get.to(()=>  TBrandProducts(brand: brand,)),);
                              });}
                    )



                  ],
                ),
                ),
                ///  Tabs
              /*bottom: const TTabBar(
                  tabs: [
                    Tab (child: Text ("Sports ")),
                    Tab (child: Text ('Furniture ')),
                    Tab (child: Text ('Electronics')),
                    Tab (child: Text ("Clothes ")),
                    Tab (child: Text ("Cosmetics ")),
                  ])*/
                  bottom: TTabBar (tabs: categories.map ((category) => Tab(child: Text (category.name))).toList()),
              ),

            ];
          },
            /*body: const TabBarView(
                children:[
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                ]
            ),*/
              body: TabBarView(
                  children: categories.map((category) => TCategoryTab(category: category)).toList ()
            ),
              ),
      )
    );
    }
  }

