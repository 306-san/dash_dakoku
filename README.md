# dash_dakoku
AmazonDashで打刻するプログラム  
端末から通知を飛ばす関係上、macOSでしか動きません  
仕組みとしてはボタンを押したらslackにslashコマンドを実行しようとします  
## 前処理
必要なものを書き換え
- [slackのuser_name](https://github.com/306-san/dash_dakoku/blob/8ee58164bb2f8753adff625eeb08d4a4860700b9/recive.rb#L5)
- [slackのlegacytoken](https://github.com/306-san/dash_dakoku/blob/8ee58164bb2f8753adff625eeb08d4a4860700b9/recive.rb#L8)
- [dashボタンのmacアドレス](https://github.com/306-san/dash_dakoku/blob/8ee58164bb2f8753adff625eeb08d4a4860700b9/recive.rb#L17)
- [slackのURL](https://github.com/306-san/dash_dakoku/blob/8ee58164bb2f8753adff625eeb08d4a4860700b9/recive.rb#L24)

## 実行方法
macの場合パケットキャプチャーしないといけないので、sudo権限が必要です
```bash
bundle install --path=./vendor/assets/
sudo bundle exec ruby receive.rb
```
linuxの場合は通知をするGemと通知する部分をコメントアウトしていただければ・・・
