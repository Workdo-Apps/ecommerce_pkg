class ProductModel {
  int? count;
  int? maxPrice;
  int? status;
  String? message;
  ProductModelData? data;

  ProductModel({this.count, this.maxPrice, this.status, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    maxPrice = json['max_price'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ProductModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    data['max_price'] = this.maxPrice;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductModelData {
  int? currentPage;
  List<Product>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  ProductModelData(
      {this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.links, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  ProductModelData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? slug;
  String? tagId;
  int? maincategoryId;
  int? subcategoryId;
  String? taxId;
  String? taxStatus;
  int? shippingId;
  String? previewType;
  String? previewVideo;
  String? previewContent;
  int? trending;
  int? status;
  String? videoUrl;
  int? trackStock;
  String? stockOrderStatus;
  double? price;
  double? salePrice;
  int? productStock;
  int? lowStockThreshold;
  String? downloadableProduct;
  String? productWeight;
  String? coverImagePath;
  String? coverImageUrl;
  String? stockStatus;
  int? variantProduct;
  String? attributeId;
  String? productAttribute;
  int? customFieldStatus;
  String? customField;
  String? description;
  String? detail;
  String? specification;
  int? averageRating;
  String? themeId;
  int? storeId;
  String? categoryName;
  String? subCategoryName;
  bool? inCart;
  bool? inWhishlist;
  ProductData? productData;
  SubCategoryctData? subCategoryctData;

  Product(
      {this.id,
      this.name,
      this.slug,
      this.tagId,
      this.maincategoryId,
      this.subcategoryId,
      this.taxId,
      this.taxStatus,
      this.shippingId,
      this.previewType,
      this.previewVideo,
      this.previewContent,
      this.trending,
      this.status,
      this.videoUrl,
      this.trackStock,
      this.stockOrderStatus,
      this.price,
      this.salePrice,
      this.productStock,
      this.lowStockThreshold,
      this.downloadableProduct,
      this.productWeight,
      this.coverImagePath,
      this.coverImageUrl,
      this.stockStatus,
      this.variantProduct,
      this.attributeId,
      this.productAttribute,
      this.customFieldStatus,
      this.customField,
      this.description,
      this.detail,
      this.specification,
      this.averageRating,
      this.themeId,
      this.storeId,
      this.categoryName,
      this.subCategoryName,
      this.inCart,
      this.inWhishlist,
      this.productData,
      this.subCategoryctData});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    tagId = json['tag_id'];
    maincategoryId = json['maincategory_id'];
    subcategoryId = json['subcategory_id'];
    taxId = json['tax_id'];
    taxStatus = json['tax_status'];
    shippingId = json['shipping_id'];
    previewType = json['preview_type'];
    previewVideo = json['preview_video'];
    previewContent = json['preview_content'];
    trending = json['trending'];
    status = json['status'];
    videoUrl = json['video_url'];
    trackStock = json['track_stock'];
    stockOrderStatus = json['stock_order_status'];
    price = double.parse(json['price'].toString());
    salePrice = double.parse(json['sale_price'].toString());
    productStock = json['product_stock'];
    lowStockThreshold = json['low_stock_threshold'];
    downloadableProduct = json['downloadable_product'];
    productWeight = json['product_weight'].toString();
    coverImagePath = json['cover_image_path'];
    coverImageUrl = json['cover_image_url'];
    stockStatus = json['stock_status'];
    variantProduct = json['variant_product'];
    attributeId = json['attribute_id'];
    productAttribute = json['product_attribute'];
    customFieldStatus = json['custom_field_status'];
    customField = json['custom_field'];
    description = json['description'];
    detail = json['detail'];
    specification = json['specification'];
    averageRating = json['average_rating'];
    themeId = json['theme_id'];
    storeId = json['store_id'];
    categoryName = json['category_name'];
    subCategoryName = json['sub_category_name'];
    inCart = json['in_cart'];
    inWhishlist = json['in_whishlist'];
    productData = json['product_data'] != null ? ProductData.fromJson(json['product_data']) : null;
    subCategoryctData = json['sub_categoryct_data'] != null ? SubCategoryctData.fromJson(json['sub_categoryct_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['tag_id'] = this.tagId;
    data['maincategory_id'] = this.maincategoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['tax_id'] = this.taxId;
    data['tax_status'] = this.taxStatus;
    data['shipping_id'] = this.shippingId;
    data['preview_type'] = this.previewType;
    data['preview_video'] = this.previewVideo;
    data['preview_content'] = this.previewContent;
    data['trending'] = this.trending;
    data['status'] = this.status;
    data['video_url'] = this.videoUrl;
    data['track_stock'] = this.trackStock;
    data['stock_order_status'] = this.stockOrderStatus;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['product_stock'] = this.productStock;
    data['low_stock_threshold'] = this.lowStockThreshold;
    data['downloadable_product'] = this.downloadableProduct;
    data['product_weight'] = this.productWeight;
    data['cover_image_path'] = this.coverImagePath;
    data['cover_image_url'] = this.coverImageUrl;
    data['stock_status'] = this.stockStatus;
    data['variant_product'] = this.variantProduct;
    data['attribute_id'] = this.attributeId;
    data['product_attribute'] = this.productAttribute;
    data['custom_field_status'] = this.customFieldStatus;
    data['custom_field'] = this.customField;
    data['description'] = this.description;
    data['detail'] = this.detail;
    data['specification'] = this.specification;
    data['average_rating'] = this.averageRating;
    data['theme_id'] = this.themeId;
    data['store_id'] = this.storeId;
    data['category_name'] = this.categoryName;
    data['sub_category_name'] = this.subCategoryName;
    data['in_cart'] = this.inCart;
    data['in_whishlist'] = this.inWhishlist;
    if (this.productData != null) {
      data['product_data'] = this.productData!.toJson();
    }
    if (this.subCategoryctData != null) {
      data['sub_categoryct_data'] = this.subCategoryctData!.toJson();
    }
    return data;
  }
}

class ProductData {
  int? id;
  String? name;
  String? slug;
  String? imagePath;
  String? iconPath;
  int? trending;
  int? status;
  String? themeId;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  String? demoField;
  int? categoryItem;
  int? totalProduct;
  int? maincategoryId;
  String? imagePathFullUrl;
  String? iconPathFullUrl;

  ProductData(
      {this.id,
      this.name,
      this.slug,
      this.imagePath,
      this.iconPath,
      this.trending,
      this.status,
      this.themeId,
      this.storeId,
      this.createdAt,
      this.updatedAt,
      this.demoField,
      this.categoryItem,
      this.totalProduct,
      this.maincategoryId,
      this.imagePathFullUrl,
      this.iconPathFullUrl});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    imagePath = json['image_path'];
    iconPath = json['icon_path'];
    trending = json['trending'];
    status = json['status'];
    themeId = json['theme_id'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    demoField = json['demo_field'];
    categoryItem = json['category_item'];
    totalProduct = json['total_product'];
    maincategoryId = json['maincategory_id'];
    imagePathFullUrl = json['image_path_full_url'];
    iconPathFullUrl = json['icon_path_full_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image_path'] = this.imagePath;
    data['icon_path'] = this.iconPath;
    data['trending'] = this.trending;
    data['status'] = this.status;
    data['theme_id'] = this.themeId;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['demo_field'] = this.demoField;
    data['category_item'] = this.categoryItem;
    data['total_product'] = this.totalProduct;
    data['maincategory_id'] = this.maincategoryId;
    data['image_path_full_url'] = this.imagePathFullUrl;
    data['icon_path_full_url'] = this.iconPathFullUrl;
    return data;
  }
}

class SubCategoryctData {
  int? id;
  String? name;
  String? imageUrl;
  String? imagePath;
  String? iconPath;
  int? maincategoryId;
  int? status;
  String? themeId;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  String? iconImgPath;
  String? imagePathFullUrl;
  String? iconPathFullUrl;

  SubCategoryctData(
      {this.id,
      this.name,
      this.imageUrl,
      this.imagePath,
      this.iconPath,
      this.maincategoryId,
      this.status,
      this.themeId,
      this.storeId,
      this.createdAt,
      this.updatedAt,
      this.iconImgPath,
      this.imagePathFullUrl,
      this.iconPathFullUrl});

  SubCategoryctData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    imagePath = json['image_path'];
    iconPath = json['icon_path'];
    maincategoryId = json['maincategory_id'];
    status = json['status'];
    themeId = json['theme_id'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iconImgPath = json['icon_img_path'];
    imagePathFullUrl = json['image_path_full_url'];
    iconPathFullUrl = json['icon_path_full_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['image_path'] = this.imagePath;
    data['icon_path'] = this.iconPath;
    data['maincategory_id'] = this.maincategoryId;
    data['status'] = this.status;
    data['theme_id'] = this.themeId;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['icon_img_path'] = this.iconImgPath;
    data['image_path_full_url'] = this.imagePathFullUrl;
    data['icon_path_full_url'] = this.iconPathFullUrl;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
