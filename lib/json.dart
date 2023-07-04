// Copyright 2023 Manoj Prasad. All rights reserved.

import 'dart:convert';

class Document {
  Document({required documentJson}) : _json = jsonDecode(documentJson);

  final Map<String, Object?> _json;

  List<Block> getBlocks() {
    if (_json case {'blocks': List blocksJson}) {
      return [for (final blockJson in blocksJson) Block.fromJson(blockJson)];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}

sealed class Block {
  Block();

  factory Block.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {
        'type': 'title',
        'text': String text,
        'return': int ret,
      } =>
        TitleBlock(text, ret),
      {
        'type': 'body',
        'text': String text,
        'return': int ret,
      } =>
        BodyBlock(text, ret),
      {
        'type': 'link',
        'text': String text,
        'return': int ret,
      } =>
        LinkBlock(text, ret),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
}

class TitleBlock extends Block {
  final String text;
  final int ret;
  TitleBlock(this.text, this.ret);
}

class BodyBlock extends Block {
  final String text;
  final int ret;
  BodyBlock(this.text, this.ret);
}

class LinkBlock extends Block {
  final String text;
  final int ret;
  LinkBlock(this.text, this.ret);
}
