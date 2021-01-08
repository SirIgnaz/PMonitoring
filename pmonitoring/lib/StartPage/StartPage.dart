import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:drag_and_drop_gridview/drag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPage createState() => _StartPageState();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DragAndDropGridView.horizontal(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 3 / 4.5,
          ),
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) => Card(elevation: 2, child: LayoutBuilder(builder: (context, costrains)
          {
            height = costrains.maxHeight;
            width = costrains.maxWidth;
            variableSet++;
          }
          return GridTile(
                  key: index == 4 ? Key("12") : null,
                  child: Image.network(
                    _imageUris[index],
                    fit: BoxFit.cover,
                    height: height,
                    width: width,
                  ),
                );
              }),
            ),
            itemCount: _imageUris.length,
            onWillAccept: (oldIndex, newIndex) => true,
            onReorder: (oldIndex, newIndex) {
              int indexOfFirstItem = _imageUris.indexOf(_imageUris[oldIndex]);
              int indexOfSecondItem = _imageUris.indexOf(_imageUris[newIndex]);
if (indexOfFirstItem > indexOfSecondItem) {
                for (int i = _imageUris.indexOf(_imageUris[oldIndex]);
                    i > _imageUris.indexOf(_imageUris[newIndex]);
                    i--) {
                  var tmp = _imageUris[i - 1];
                  _imageUris[i - 1] = _imageUris[i];
                  _imageUris[i] = tmp;
                }
              } else {
                for (int i = _imageUris.indexOf(_imageUris[oldIndex]);
                    i < _imageUris.indexOf(_imageUris[newIndex]);
                    i++) {
                  var tmp = _imageUris[i + 1];
                  _imageUris[i + 1] = _imageUris[i];
                  _imageUris[i] = tmp;
                }
              }
              setState(() {});
            },
          ),
        ),
      ),
  }
