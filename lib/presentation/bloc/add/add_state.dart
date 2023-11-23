part of 'add_bloc.dart';

class AddState extends Equatable {
  const AddState({
    this.category = const Category.pure(),
    this.sku = const SKU.pure(),
    this.name = const Name.pure(),
    this.description = const Description.pure(),
    this.weight = const Weight.pure(),
    this.width = const Width.pure(),
    this.length = const Length.pure(),
    this.height = const Height.pure(),
    this.image = const Image.pure(),
    this.price = const Price.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  final Category category;
  final SKU sku;
  final Name name;
  final Description description;
  final Weight weight;
  final Width width;
  final Length length;
  final Height height;
  final Image image;
  final Price price;
  final bool isValid;
  final FormzSubmissionStatus status;

  @override
  List<Object> get props => [
    category,
    sku,
    name,
    description,
    weight,
    width,
    length,
    height,
    image,
    price,
    isValid,
    status
  ];

  AddState copyWith({
    Category? category,
    SKU? sku,
    Name? name,
    Description? description,
    Weight? weight,
    Width? width,
    Length? length,
    Height? height,
    Image? image,
    Price? price,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return AddState(
      category: category ?? this.category,
      sku: sku ?? this.sku,
      name: name ?? this.name,
      description: description ?? this.description,
      weight: weight ?? this.weight,
      width: width ?? this.width,
      length: length ?? this.length,
      height: height ?? this.height,
      image: image ?? this.image,
      price: price ?? this.price,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }
}