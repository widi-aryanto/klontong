import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:klontong/data/model/language_model.dart';
import 'package:klontong/presentation/bloc/language/language_bloc.dart';

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.chooseLanguage),
            const SizedBox(height: 16.0),
            BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: Language.values.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        context.read<LanguageBloc>().add(ChangeLanguage(
                            selectedLanguage: Language.values[index]));
                        Future.delayed(const Duration(milliseconds: 300))
                            .then((value) => Navigator.of(context).pop());
                      },
                      title: Text(Language.values[index].text),
                      trailing:
                      Language.values[index] == state.selectedLanguage ? const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.deepPurple,
                      )
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: Language.values[index] == state.selectedLanguage
                            ? const BorderSide(color: Colors.deepPurple, width: 1.5)
                            : BorderSide(color: Colors.grey[300]!),
                      ),
                      tileColor:
                      Language.values[index] == state.selectedLanguage
                          ? Colors.deepPurple.withOpacity(0.05)
                          : null,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16.0);
                  },
                );
              },
            ),
          ],
        ),
      );
    },
  );
}