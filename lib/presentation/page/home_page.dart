import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong/domain/entity/detail_page_argument.dart';
import 'package:klontong/presentation/bloc/home/home_bloc.dart';
import 'package:klontong/utils/currency_utils.dart';
import 'package:klontong/utils/navigation/navigation_helper.dart';
import 'package:klontong/utils/routes/route_helper.dart';
import 'package:klontong/widgets/bottomsheet_language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    Future.microtask(
      () => context.read<HomeBloc>().add(const LoadData()),
    );
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Klontong'),
        actions: [
          IconButton(
            onPressed: () {
              showLanguageBottomSheet(context);
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            setState(() {
              context.read<HomeBloc>().add(const LoadData());
            });
          }
          return true;
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _controller.value.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  _controller.clear();
                                  context
                                      .read<HomeBloc>()
                                      .add(const LoadData());
                                },
                                icon: const Icon(Icons.clear),
                              )
                            : const SizedBox(),
                        labelText: res.search,
                        hintText: res.search,
                        border: const OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          context.read<HomeBloc>().add(HomeSearch(data: value));
                        }
                      },
                    ),
                  ),
                  Flexible(
                    child: ListView.separated(
                      itemCount: state.listData.length + 1,
                      itemBuilder: (context, index) {
                        if (index < state.listData.length) {
                          final item = state.listData[index];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text("${index + 1}"),
                            ),
                            title: Text(item.name),
                            subtitle: Text(convertToIdr(item.price.toDouble())),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right,
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                detailRoute,
                                arguments: DetailPageArgument(id: item.id),
                              );
                            },
                          );
                        } else {
                          if (state.listData.length < 10) {
                            return const SizedBox();
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  ),
                ],
              );
            } else if (state is HomeError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Text("");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationHelper.navigateTo(addRoute),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
