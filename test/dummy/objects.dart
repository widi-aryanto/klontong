import 'package:klontong/data/model/data_model.dart';
import 'package:klontong/data/model/detail_model.dart';
import 'package:klontong/data/model/list_model.dart';

const testDataList = ListModel(
  status: "success",
  message: "list successfully viewed",
  data: [
    testData,
  ],
);

const testDataDetail = DetailModel(
  status: "success",
  message: "data successfully viewed",
  data: testData,
);

const testListDataDetail = <DetailModel>[
  testDataDetail,
];

const testData = DataModel(
  id: 86,
  categoryId: 14,
  categoryName: "Cemilan",
  sku: "MHZVTK",
  name: "Ciki ciki",
  description: "Ciki ciki yang super enak, hanya di toko klontong kami",
  weight: 500,
  width: 5,
  length: 5,
  height: 5,
  image: "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
  price: 30000,
);