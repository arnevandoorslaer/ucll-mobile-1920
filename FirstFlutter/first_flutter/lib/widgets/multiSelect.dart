library multiselect_formfield;

import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_dialog.dart';

class MultiSelect extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function change;
  final Function open;
  final Function close;
  final Widget leading;
  final Widget trailing;
  final String okButtonLabel;
  final String cancelButtonLabel;

  MultiSelect(
      {FormFieldSetter<dynamic> onSaved,
        FormFieldValidator<dynamic> validator,
        int initialValue,
        bool autovalidate = false,
        this.titleText = 'Title',
        this.hintText = 'Klik om te selecteren',
        this.required = false,
        this.errorText = 'Gelieve een of meerdere opties aan te duiden',
        this.value,
        this.leading,
        this.dataSource,
        this.textField,
        this.valueField,
        this.change,
        this.open,
        this.close,
        this.okButtonLabel = 'OK',
        this.cancelButtonLabel = 'CANCEL',
        this.trailing})
      : super(
    onSaved: onSaved,
    validator: validator,
    initialValue: initialValue,
    autovalidate: autovalidate,
    builder: (FormFieldState<dynamic> state) {
      List<Widget> _buildSelectedOptions(dynamic values, state) {
        List<Widget> selectedOptions = [];

        if (values != null) {
          values.forEach((item) {
            var existingItem = dataSource.singleWhere((itm) => itm[valueField] == item, orElse: () => null);
            selectedOptions.add(Chip(
              label: Text(existingItem[textField], overflow: TextOverflow.ellipsis),
            ));
          });
        }

        return selectedOptions;
      }

      return InkWell(
        onTap: () async {
          List initialSelected = value;
          if (initialSelected == null) {
            initialSelected = List();
          }

          final items = List<MultiSelectDialogItem<dynamic>>();
          dataSource.forEach((item) {
            items.add(MultiSelectDialogItem(item[valueField], item[textField]));
          });

          List selectedValues = await showDialog<List>(
            context: state.context,
            builder: (BuildContext context) {
              return MultiSelectDialog(
                title: titleText,
                okButtonLabel: okButtonLabel,
                cancelButtonLabel: cancelButtonLabel,
                items: items,
                initialSelectedValues: initialSelected,
              );
            },
          );

          if (selectedValues != null) {
            state.didChange(selectedValues);
            state.save();
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            errorText: state.hasError ? state.errorText : null,
            errorMaxLines: 4,
          ),
          isEmpty: state.value == null || state.value == '',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          titleText,
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        )),
                    required
                        ? Padding(padding:EdgeInsets.only(top:5, right: 5), child: Text(
                      ' *',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 17.0,
                      ),
                    ),
                    )
                        : Container(),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ],
                ),
              ),
              value != null && value.length > 0
                  ? Wrap(
                spacing: 8.0,
                runSpacing: 0.0,
                children: _buildSelectedOptions(value, state),
              )
                  : new Container(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  hintText,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade500,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
