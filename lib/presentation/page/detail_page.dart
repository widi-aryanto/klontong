import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong/domain/entity/detail_page_argument.dart';
import 'package:klontong/presentation/bloc/detail/detail_bloc.dart';
import 'package:klontong/utils/currency_utils.dart';
import 'package:klontong/utils/routes/route_observer_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailPage extends StatefulWidget {
  final DetailPageArgument argument;
  const DetailPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailState();
}

class _DetailState extends State<DetailPage> with RouteAware {
  @override
  void initState() {
    Future.microtask(() {
      context.read<DetailBloc>().add(
        DetailData(widget.argument.id),
      );
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  Widget _info(String text, String data) {
    return Row(
      children: [
        Text(
          '$text : ',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          data,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final res = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(res.detailProduct),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                          imageUrl: state.data.image,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.data.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              state.data.sku,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              state.data.categoryName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              convertToIdr(state.data.price.toDouble()),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.data.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _info(res.weight, state.data.weight.toString()),
                  _info(res.width, state.data.width.toString()),
                  _info(res.length, state.data.length.toString()),
                  _info(res.height, state.data.height.toString()),
                ],
              ),
            );
          } else if (state is DetailError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Text("");
          }
        },
      ),
    );
  }
}