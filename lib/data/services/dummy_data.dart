
import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_category_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_category_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';
import '../../routes/routes.dart';
import '../../utils/constents/image_strings.dart';

class TDummyData{
  /// -- Banners
  static final List <BannerModel> banners = [
    BannerModel(imageUrl: TImages.promoBanner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.promoBanner1, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel (imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel (imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel (imageUrl: TImages.banner7, targetScreen: TRoutes.checkout, active: false),
  ];
  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: TImages.clothIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: TImages.electronicsIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: TImages.sportIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: TImages. sportIcon, name:  'Jewelery', isFeatured: true),

    ///subcategories
    CategoryModel(id: '8', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: TImages.electronicsIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.electronicsIcon, name:
    'Sports Equipments', parentId: '1', isFeatured: false),
    //furniture
    CategoryModel(id: '11', image: TImages.clothIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: true),
    CategoryModel(id: '12', image: TImages.clothIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: true),
    CategoryModel (id: '13', image: TImages.clothIcon, name: 'Office furniture', parentId: '5',   isFeatured: false),
    //electronics
    CategoryModel (id: '14', image: TImages.electronicsIcon, name: 'Laptop' , parentId: '2', isFeatured: false),
    CategoryModel(id: '15', image: TImages.electronicsIcon, name: 'Mobile', parentId: '2',  isFeatured: false),

  ];

  ///--  list of brands
  // -- List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: TImages.sportIcon, name: 'Nike', productsCount: 265, isFeatured: true),
    BrandModel(id: '2', image: TImages.cosmeticsIcon, name: 'Adidas', productsCount: 95, isFeatured: true),
    BrandModel(id: '8', image: TImages.darkAppLogo, name: 'Kenwood', productsCount: 36, isFeatured: false),
    BrandModel(id: '9', image: TImages.animalIcon, name: 'IKEA', productsCount: 36, isFeatured: false),
    BrandModel(id: '5', image: TImages. applePay, name: 'Apple', productsCount: 16, isFeatured: true),
    BrandModel(id: '10', image: TImages.google, name: 'Acer', productsCount: 36, isFeatured: false),
    BrandModel(id: '3', image: TImages. googlePay, name: 'Jordan', productsCount: 36, isFeatured: true),
    BrandModel (id: '4' , image: TImages.sportIcon, name: 'Puma', productsCount: 65, isFeatured: true),
    BrandModel(id: '6', image: TImages.lightAppLogo, name: 'ZARA', productsCount: 36, isFeatured: true),
    BrandModel(id: '7', image: TImages. electronicsIcon, name: 'Samsung', productsCount: 36, isFeatured: false),
  ];
 /// -- -• List of all Brand Categories
 static final List<BrandCategoryModel> brandCategory = [
  BrandCategoryModel (brandId: '1', categoryId: '1'),
  BrandCategoryModel (brandId: '1', categoryId: '8'),
   BrandCategoryModel (brandId: '1', categoryId: '9'),
   BrandCategoryModel (brandId: '1', categoryId: '10'),
   BrandCategoryModel (brandId: '2', categoryId: '1'),
   BrandCategoryModel(brandId: '2', categoryId: '8'),
  BrandCategoryModel(brandId: '2', categoryId: '9'),
   BrandCategoryModel (brandId: '2', categoryId: '10'),
   BrandCategoryModel (brandId: '3', categoryId: '1'),
   BrandCategoryModel (brandId: '3', categoryId: '8'),
   BrandCategoryModel (brandId: '3', categoryId: '9'),
   BrandCategoryModel (brandId: '3', categoryId: '10'),
   BrandCategoryModel (brandId: '4', categoryId: '1'),
  BrandCategoryModel (brandId: '4', categoryId: '8'),
   BrandCategoryModel (brandId: '4', categoryId: '9'),
   BrandCategoryModel (brandId: '4', categoryId: '10'),
  BrandCategoryModel(brandId: '5' ,categoryId: '15'),
  BrandCategoryModel (brandId: '5', categoryId: '2'),
  BrandCategoryModel (brandId: '10', categoryId: '14'),
  BrandCategoryModel(brandId: '6', categoryId: '3'),
  BrandCategoryModel(brandId: '6', categoryId: '16'),
  BrandCategoryModel (brandId: '7', categoryId: '2'),
  BrandCategoryModel (brandId: '8', categoryId: '5'),
  BrandCategoryModel (brandId: '8', categoryId: '11'),
   BrandCategoryModel (brandId: '8', categoryId: '12'),
    BrandCategoryModel (brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
   BrandCategoryModel (brandId: '9', categoryId: '12'),
    BrandCategoryModel (brandId: '9', categoryId: '13'),
  ];

  /// -- List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
  ProductCategoryModel(productId: '001', categoryId: '1'),
  ProductCategoryModel (productId: '001', categoryId: '8'),
  ProductCategoryModel (productId: '004', categoryId: '3'),
  ProductCategoryModel (productId: '002', categoryId: '3'),
  ProductCategoryModel (productId: '002', categoryId: '16'),
  ProductCategoryModel (productId: '003', categoryId: '3'),
  ProductCategoryModel (productId: '005', categoryId: '1'),
  ProductCategoryModel (productId: '005', categoryId: '8'),
  ProductCategoryModel(productId: '006', categoryId: '2'),
  ProductCategoryModel (productId: '007', categoryId: '2'),
    ProductCategoryModel (productId: '005',categoryId: '2'),
    ProductCategoryModel (productId: '019', categoryId: '1'),
    ProductCategoryModel (productId: '019', categoryId: '1'),
    ProductCategoryModel (productId: '020', categoryId: '1'),
    ProductCategoryModel (productId: '020', categoryId: '3'),
    ProductCategoryModel (productId: '021', categoryId: '1'),
    ProductCategoryModel (productId: '014', categoryId: '4'),
    ProductCategoryModel(productId: '002', categoryId: '8'),
    ProductCategoryModel (productId: '008', categoryId: '2'),
    ProductCategoryModel (productId: '003', categoryId: '5'),
    ProductCategoryModel (productId: '013', categoryId: '3'),
    ProductCategoryModel (productId: '014', categoryId: '5'),
    ProductCategoryModel (productId: '004', categoryId: '4'),
    ProductCategoryModel (productId: '005', categoryId: '2'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel (productId: '006', categoryId: '5'),
    ProductCategoryModel (productId: '006', categoryId: '8'),
    ProductCategoryModel(productId: '008', categoryId: '5'),
    ProductCategoryModel (productId: '007', categoryId: '3'),
    ProductCategoryModel (productId: '008', categoryId: '5'),
    ProductCategoryModel (productId: '008', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '5'),
    ProductCategoryModel(productId: '016', categoryId: '3'),
    ProductCategoryModel (productId: '017', categoryId: '5'),
    ProductCategoryModel (productId: '018', categoryId: '8'),
  ];

  /// -- List of all Products
  static final List<ProductModel> products = [
  ProductModel (
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15, price: 135,
      isFeatured: true,
      thumbnail: TImages.promoBanner2,
      description: 'Green Nike sports shoe',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    brand: BrandModel(id: '1', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
    //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
    productVariations: [
          ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

          ProductVariationModel (
            id:'2',
            stock: 15,
            price: 132,
            image: TImages.banner5, //image: TImages.productImage23,
            attributeValues: {'Color': 'Black', 'size': 'EU 32'},

          ),
          ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

          ),
          ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

          ),

          // ProductModel
        ],
          productType: 'ProductType.variable',
        ),
    ProductModel (
      id: '002',
      title: 'Green Nike sports shoe',
      stock: 15, price: 135,
      isFeatured: true,
      thumbnail: TImages.promoBanner2,
      description: 'Green Nike sports shoe',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '1', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '003',
      title: ' T-shirt for all ages',
      stock: 15,
      price: 333,
      isFeatured: true,
      thumbnail: TImages.banner3,
      description: 'Green Nike sports shoe',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '1', image: TImages.promoBanner3, name: 'Nike', productsCount: 222, isFeatured: true),
      images: [TImages.banner1, TImages.banner2, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '004',
      title: 'red T-shirt for all ages',
      stock: 15,
      price: 222,
      isFeatured: true,
      thumbnail: TImages.banner4,
      description: 'Green Nike sports shoe',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 22,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '005',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 325,
      isFeatured: true,
      thumbnail: TImages.banner5,
      description: 'Gray Nike sports shoe',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '006',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 55,
      isFeatured: true,
      thumbnail: TImages.banner5,
      description: 'Green Nike sports shoe',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '007',
      title: 'Blue T-shirt for all ages',
      stock: 77,
      price: 77,
      isFeatured: true,
      thumbnail: TImages.banner1,
      description: 'Green Nike sports shoe for kids',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '3', image: TImages.promoBanner3, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner2, TImages.banner3, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 33,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),

    ProductModel (
      id: '008',
      title: 'football for all ages',
      stock: 15,
      price: 333,
      isFeatured: true,
      thumbnail: TImages.banner2,
      description: 'Green Nike sports shoe it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner3, name: 'Nike', productsCount: 222, isFeatured: true),
      images: [TImages.banner4, TImages.banner2, TImages.banner1, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '009',
      title: 'vvv T-shirt for all ages',
      stock: 15,
      price: 222,
      isFeatured: true,
      thumbnail: TImages.banner4,
      description: 'Red Nike sports shoe, it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner1, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 33,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '010',
      title: 'red T-shirt for all ages',
      stock: 15,
      price: 325,
      isFeatured: true,
      thumbnail: TImages.banner2,
      description: 'Gray Nike sports shoe it is good for every one you can choose the best, it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '011',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 55,
      isFeatured: true,
      thumbnail: TImages.banner3,
      description: 'yello Green Nike sports shoe,it is good for every one you can choose the best it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '012',
      title: 'Blue T-shirt for all ages',
      stock: 77,
      price: 77,
      isFeatured: true,
      thumbnail: TImages.banner3,
      description: 'Green Nike sports shoe for kids, it is good for every one you can choose the best, it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '3', image: TImages.promoBanner3, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner2, TImages.banner3, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 33,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),

    ProductModel (
      id: '013',
      title: ' ccc for all ages',
      stock: 15,
      price: 333,
      isFeatured: true,
      thumbnail: TImages.banner1,
      description: 'Red  Green Nike sports shoe, it is good for every one you can choose the best, it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner3, name: 'Nike', productsCount: 222, isFeatured: true),
      images: [TImages.banner6, TImages.banner2, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '014',
      title: 'iuiyh T-shirt for all ages',
      stock: 15,
      price: 222,
      isFeatured: true,
      thumbnail: TImages.banner7,
      description: 'Green Nike sports shoe it is good for every one you can choose the best it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '3', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 22,
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '015',
      title: '  tttt e T-shirt for all ages',
      stock: 15,
      price: 325,
      isFeatured: true,
      thumbnail: TImages.banner6,
      description: 'Gray Nike sports shoe it is good for every one you can choose the best it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '3', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '016',
      title: 'Yellow T-shirt for all ages',
      stock: 15,
      price: 55,
      isFeatured: true,
      thumbnail: TImages.banner5,
      description: 'Green Nike sports shoe, it is good for every one you can choose the best it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '017',
      title: 'Blue T-shirt for all ages',
      stock: 77,
      price: 999,
      isFeatured: true,
      thumbnail: TImages.banner1,
      description: 'Green Nike sports shoe for kids, it is good for every one you can choose the best it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '3', image: TImages.promoBanner3, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner2, TImages.banner3, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 88,
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),

    ProductModel (
      id: '018',
      title: ' xx T-shirt for all ages',
      stock: 15,
      price: 333,
      isFeatured: true,
      thumbnail: TImages.banner2,
      description: 'Green Nike sports shoe. it is good for every one you can choose the best it is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '4', image: TImages.promoBanner3, name: 'Nike', productsCount: 222, isFeatured: true),
      images: [TImages.banner1, TImages.banner2, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '019',
      title: 'red T-shirt for all ages',
      stock: 15,
      price: 222,
      isFeatured: true,
      thumbnail: TImages.banner3,
      description: 'Green Nike sports shoe',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '4', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 22,
      sku: 'ABR4568',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '020',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 325,
      isFeatured: true,
      thumbnail: TImages.banner5,
      description: 'Gray Nike sports shoe',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '3', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '019',
      title: 'uiyuiy Blue T-shirt for all ages',
      stock: 15,
      price: 55,
      isFeatured: true,
      thumbnail: TImages.banner5,
      description: 'Green Nike sports shoe it is good for every one you can choose the bestit is good for every one you can choose the best',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '2', image: TImages.promoBanner2, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner5, TImages.banner4, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel (
      id: '022',
      title: 'Blue T-shirt for all ages',
      stock: 76,
      price: 676,
      isFeatured: true,
      thumbnail: TImages.banner7,
      description: 'Green Nike sports shoe for kids',
      //brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      brand: BrandModel(id: '4', image: TImages.promoBanner3, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.banner2, TImages.banner2, TImages.banner3, TImages.banner3],
      //images: [TImages.productImagel, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 33,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel (name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),

      ],
      productVariations: [
        ProductVariationModel (
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.promoBanner2, //image: TImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green',   'Size': 'EU 34'}),

        ProductVariationModel (
          id:'2',
          stock: 15,
          price: 132,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 32'},

        ),
        ProductVariationModel (
          id:'3',
          stock: 0,
          price: 344,
          image: TImages.banner5, //image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'size': 'EU 34'},

        ),
        ProductVariationModel (
          id:'4',
          stock: 222,
          price: 232,
          image: TImages.banner2, //image: TImages.productImage23,
          attributeValues: {'Color': 'Green', 'size': 'EU 32'},

        ),

        // ProductModel
      ],
      productType: 'ProductType.variable',
    ),
  ];


}