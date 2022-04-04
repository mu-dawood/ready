library ready_validation;

import 'package:flutter/material.dart';

export 'src/config.dart';
export 'src/context_extension.dart';
export 'src/messages/messages.dart';

Widget x() {
  return AutofillGroup(
      child: Column(
    children: const [
      TextField(
        autofillHints: [
          AutofillHints.email,
          AutofillHints.username,
        ],
      ),
    ],
  ));
}
