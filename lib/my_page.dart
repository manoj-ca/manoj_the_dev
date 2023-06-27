// Copyright 2023 Manoj Prasad. All rights reserved.

enum MyPage {
  home(idx: 0),
  blog(idx: 1),
  contact(idx: 2);

  const MyPage({required this.idx});
  final int idx;
}
