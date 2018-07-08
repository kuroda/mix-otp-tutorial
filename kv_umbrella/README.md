# KvUmbrella

See https://elixir-lang.org/getting-started/mix-otp/dependencies-and-umbrella-projects.html.

## 起動方法

2つのホスト `oiax` と `xaio` において、それぞれ次のコマンドを実行する。

```console
$ PORT=4040 elixir --sname foo -S mix run --no-halt
$ PORT=4040 elixir --sname bar -S mix run --no-halt
```

## 動作確認

```console
$ telnet oiax 4040
Trying 127.0.1.1...
Connected to xaio.
Escape character is '^]'.
CREATE shopping
OK
PUT shopping eggs 4
OK
GET shopping eggs
4
OK
```

```console
$ telnet xaio 4040
Trying 127.0.1.1...
Connected to xaio.
Escape character is '^]'.
GET shopping eggs
4
OK
CREATE books
OK
PUT books ruby 9
OK
```
