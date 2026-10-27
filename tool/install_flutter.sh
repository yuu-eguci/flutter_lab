#!/bin/sh
# Flutter を公式リポジトリのタグから取得します。Dockerfile と CI の両方で使います。
#   tool/install_flutter.sh <入れる場所>
# バージョンを上げるときは、ここの 2 つと README を更新します。
set -eu

FLUTTER_VERSION=3.47.8
FLUTTER_COMMIT=737ba8f885dc774b53b442759999a312c9461e4e

dest=$1
git clone --depth 1 --branch "$FLUTTER_VERSION" https://github.com/flutter/flutter.git "$dest"
actual=$(git -C "$dest" rev-parse HEAD)
if [ "$actual" != "$FLUTTER_COMMIT" ]; then
  echo "Flutter $FLUTTER_VERSION のはずが commit $actual だった ($FLUTTER_COMMIT のはず)" >&2
  exit 1
fi

"$dest/bin/flutter" --disable-analytics
"$dest/bin/flutter" --version
