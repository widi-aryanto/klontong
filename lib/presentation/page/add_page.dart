import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klontong/presentation/bloc/add/add_bloc.dart';
import 'package:klontong/utils/navigation/navigation_helper.dart';
import 'package:klontong/utils/routes/route_helper.dart';
import 'package:klontong/widgets/filled_button.dart';
import 'package:klontong/widgets/text_field.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddState();
}

class _AddState extends State<AddPage> {
  final List<String> list = <String>['Category', 'Cemilan', 'Minuman', 'Pembersih', 'Alat Rumah Tangga'];
  final picker = ImagePicker();
  late Future<XFile?> pickedFile = Future.value(null);

  @override
  Widget build(BuildContext context) {
    final res = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(res.addData),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          BlocBuilder<AddBloc, AddState>(
            builder: (context, state) {
              final isValid = context.select((AddBloc bloc) => bloc.state.isValid);
              final state = context.select((AddBloc bloc) => bloc.state);
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            pickedFile = picker.pickImage(source: ImageSource.gallery).whenComplete(() => setState(() {}));
                          },
                          child: FutureBuilder<XFile?>(
                            future: pickedFile,
                            builder: (context, snap) {
                              if (snap.hasData) {
                                context.read<AddBloc>().add(ImageChanged(image: snap.data!.path));
                                return SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.file(
                                    File(snap.data!.path),
                                    fit: BoxFit.contain,
                                  ),
                                );
                              }
                              return const Icon(
                                Icons.image,
                                size: 150,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownMenu<String>(
                                initialSelection: list.first,
                                onSelected: (String? value) {
                                  setState(() {
                                    context.read<AddBloc>().add(CategoryChanged(category: value.toString()));
                                  });
                                },
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                                  return DropdownMenuEntry<String>(value: value, label: value);
                                }).toList(),
                              ),
                              const SizedBox(height: 16),
                              TextFieldWidget(
                                initial: state.sku.value,
                                label: res.sku,
                                inputType: TextInputType.text,
                                inputAction: TextInputAction.next,
                                secureText: false,
                                onChanged: (value) {
                                  context.read<AddBloc>().add(SKUChanged(sku: value));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFieldWidget(
                      initial: state.name.value,
                      label: res.name,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      secureText: false,
                      onChanged: (value) {
                        context.read<AddBloc>().add(NameChanged(name: value));
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFieldWidget(
                      initial: state.description.value,
                      label: res.description,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      secureText: false,
                      maxLines: 5,
                      onChanged: (value) {
                        context.read<AddBloc>().add(DescriptionChanged(description: value));
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Flexible(
                          child: TextFieldWidget(
                            initial: state.weight.value != null ? state.weight.toString() : '',
                            label: res.weight,
                            inputType: TextInputType.number,
                            inputAction: TextInputAction.next,
                            secureText: false,
                            onChanged: (value) {
                              context.read<AddBloc>().add(WeightChanged(weight: value));
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: TextFieldWidget(
                            initial: state.width.value != null ? state.width.toString() : '',
                            label: res.width,
                            inputType: TextInputType.number,
                            inputAction: TextInputAction.next,
                            secureText: false,
                            onChanged: (value) {
                              context.read<AddBloc>().add(WidthChanged(width: value));
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Flexible(
                          child: TextFieldWidget(
                            initial: state.length.value != null ? state.length.toString() : '',
                            label: res.length,
                            inputType: TextInputType.number,
                            inputAction: TextInputAction.next,
                            secureText: false,
                            onChanged: (value) {
                              context.read<AddBloc>().add(LengthChanged(length: value));
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: TextFieldWidget(
                            initial: state.height.value != null ? state.height.toString() : '',
                            label: res.height,
                            inputType: TextInputType.number,
                            inputAction: TextInputAction.next,
                            secureText: false,
                            onChanged: (value) {
                              context.read<AddBloc>().add(HeightChanged(height: value));
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFieldWidget(
                      initial: state.price.value != null ? state.price.toString() : '',
                      label: res.price,
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.done,
                      secureText: false,
                      onChanged: (value) {
                        context.read<AddBloc>().add(PriceChanged(price: value));
                      },
                    ),
                    const SizedBox(height: 32),
                    Align(
                      alignment: Alignment.topRight,
                      child: FilledButtonWidget(
                        title: res.saveData,
                        width: double.infinity,
                        onClick: () {
                          if (isValid) {
                            context.read<AddBloc>().add(FormSubmitted());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}