// Copyright 2023 Manoj Prasad. All rights reserved.

enum MyPage {
  home(idx: 0),
  about(idx: 1),
  blog(idx: 2),
  contact(idx: 3);

  const MyPage({required this.idx});
  final int idx;
}
