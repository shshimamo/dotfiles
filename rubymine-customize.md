# Keymap
- Keymapの構成

|No|大項目| 
|---|---|
|1|Editor Actions|
|2|Main menu|
|3|Tool Windows|
|4|External Tools|
|5|Version Control Systems|
|6|Rake|
|7|Generators|
|8|Remote External Tools|
|9|Macros|
|10|Quick Lists|
|11|Plug-ins|
|12|Other|

- キーマップ基本ルール
    - Rails系キーマップは、フォーストストローク：「CTRL + K」  で集約。
    - その他覚えづらいキーマップは、ファーストストローク：「CTRL + J」で集約。
    - 打ちやすいようにセカンドストロークは、CTRLありなし両方割り当てている。
        - 例えば、 `CTRL+J & (CTRL+)H` の場合 `CTRL+J & CTRL+H`と`CTRL+J & H` の２つをわりあてているということ

## 1.Editor Action
|名前|key map|変更|説明| 
|---|---|---|---|
|Cut up to Line End|CTRL + K|CTRL + K削除|末尾まで切り取る|
|Right|→ , CTRL + F|CTRL + Fを削除|右へ|
|Left|←, CTRL + B|CTRL + Bを削除|左へ|
|Move Caret to Code Block Start|Opt + Cmd + [|CTRL + [|ブロックのスタートにジャンプ|
|Move Caret to Code Block End|Opt + Cmd + [|CTRL + ]|ブロックのエンドにジャンプ|
|Move Caret to Line Start|CTRL + A||行の先頭に移動|
|Move Caret to Line End|CTRL + E||行の末尾に移動|
|Coose Lookup Item and Insert Dot|CTRL + .||先頭の補完候補を選択して.も記入|
|Add or Remove Caret|alt + クリック|alt + shift + クリック(alt + クリックはJump to Sourceに割り当てる)|複数選択して同時編集とかできるみたいだけど使ったことないので削除
|Down|Ctrl + N|削除(Vimバインド使っていれば不要なため)|下に移動|
|UP|Ctrl + P|削除(Vimバインド使っていれば不要なため)|上に移動|

## 2.Main menu
###Run
|名前|key map|変更|説明| 
|---|---|---|---|
|Debug|CTRL + D|なし|デバッグ実行|
###Help
|名前|key map|変更|説明| 
|---|---|---|---|
|Find Action|Shift + Cmd + A||全てのアクション検索|
###View
|名前|key map|変更|説明| 
|---|---|---|---|
|Quick Definition|Opt + Space|CTRL + J & Space|ポップアップでソース参照| 
| Quick Documentation | F1 , CTRL + J |CTRL + J削除, CTRL + J & (CTRL) + D| ポップアップでドキュメント参照|
|Jump to Source|Command + ↓|(追加)alt + クリック|ソースに飛ぶ
###Navigate
|名前|key map|変更|説明| 
|---|---|---|---|
|Class...|Cmd + O||プロジェクト内のクラス名で検索|
|File...|Shift + Cmd + O||プロジェクト内でファイル名で検索|
|Symbol...|Opt + Cmd + O||プロジェクト内で変数名、メソッド名などで検索?|
|Test|Shift + Cmd + T|CTRL + K & T|テストにジャンプ|
|File Structure|Cmd + F12|CTRL + J & CTRL + J |クラスのメソッド、フィールドを見れる。さらにmodelではカラムも見れる|
|Type Hierarchy|CTRL + H|CTRL + J & (CTRL +) H , CTRL + H削除|タイプヒエラルキー|
|Back|Cmd + [|CTRL + J & (CTRL +) O|戻る|
|Foard|Cmd + ]|CTRL + J & (CTRL +) I|進む|
|Last Edit Location|Ctrl + Cmd Backspace|CTRL + J & CTRL + Shift + O|最後の編集に戻る|
|Declaration|Cmd + B|CTRL + J & (CTRL +) B|定義へジャンプ|
|Implementation(s)|Opt + Cmd + B||継承しているクラスへジャンプ|
|Toggle Bookmark|F3|Ctrl + J & (CTRL +)K)|ブックマークのつけはずし|
|Show Bookmarks|Cmd + F3|Ctrl + J & L|ブックマークリスト|
|Related Symbol|Ctrl + Cmd + ↑|CTRL + K & CTRL + K|view,model,controller,testへジャンプ|
###Code
|名前|key map|変更|説明| 
|---|---|---|---|
|Reformat Code| Opt + Cmd + L||フォーマットをきれいにする|
|Fold Selection|Cmd + .||コードをおりたたむ|
|Comment with Line Comment|Cmd + /||#でコメントにする|
|Comment with Block Comment|Opt + Cmd + /||=begin =end でコメントにする|
###Window
|名前|key map|変更|説明| 
|---|---|---|---|
|Select Next Tab|Shift + Cmd + ]|Ctrl + J & (Ctrl +) N|次のタブ|
|Select Previous Tab|Shift + Cmd + [|Ctrl + J & (Ctrl +) P|前のタブ|
|Move Down||Ctrl + J & (Ctrl +) S|下分割|
|Move Right||Ctrl + J & (Ctrl +) V|右分割|
|Move To Opposite Group||Ctrl + J & (Ctrl +)[ |別のウインドウに移動|
|Close Others||Ctrl + J & Q|他のタブを閉じる|
###Edit
|名前|key map|変更|説明| 
|---|---|---|---|
|Find Usage|Opt + F7|Ctrl + J & U|使われている箇所を表示|
|Show Usage|Opt + Cmd + F7|Ctrl + J & Ctrl + U|使われている箇所をポップアップで表示|
|Add Selection for Next Occurrence|CTRL + G|CTRL + G 削除|検索時に次のヒットに進む|
|Copy Paths|Shift + Cmd + C||フルパスコピー|
|Copy Reference|Shift + Cmd + Option + C|Ctrl + J & C|相対パス + Lineナンバー コピー|
###Refactor
|名前|key map|変更|説明| 
|---|---|---|---|
|Refactor this|Ctrl + T|-|リファクタメニューを表示|
###Tools 
|名前|key map|変更|説明| 
|---|---|---|---|
|Run Rake Task|Opt + R|CTRL + K & (CTRL +) R|rake task実行|
|Run Rails Generator|Opt + Cmd + G|CTRL + K & (CTRL +) G|migrate実行|
###VCS > Git 
|名前|key map|変更|説明| 
|---|---|---|---|
|compare with Branch...|-|(CTRL + G) & C|Branchと比較|



## 3.Tool Windows
|名前|Shortcut|変更|説明|
|---|---|---|
|Version Control|Cmd + 9||gitのlocalchangesやlogを確認できる|
|Terminal||CTRL + J & T|ターミナル起動|

## 5. Version Control Systems
|名前|key map|変更|説明| 
|---|---|---|---|
|Show Local Changes|-|CTRL + G & (CTRL + )L|ローカルの変更を表示|
|Show History|-|CTRL + G & (CTRL + )H|ヒストリーを表示|
|Annotate|-|CTRL + G & (CTRL + )A|Git Blame的なやつ|

## 12.Other
|名前|key map|変更|説明| 
|---|---|---|---|
|Search Everywhere|Shift ２回||色々検索|
|Open source in new window||CTRL + J & (CTRL) + W|新しいwindowで開く|
|Terminal||CTRL + J & (CTRL) + T|Terminalを開く|
|Database Console||CTRL + J & (CTRL) + M|データベースコンソールを開く|
|Switch to Controller||CTRL + K & (CTRL +) C| Controllerへジャンプ|
|Switch to Model||CTRL + K & (CTRL + )M| Modelへジャンプ|
|Switch to View||CTRL + K & (CTRL +) V| Viewへジャンプ|

# Editor
## 1. General

|設定箇所|説明|
|---|---|
|Editor > Generl > Use original line's indent for wrapped parts|折り返しの時にインデントする|
|Editor > General > Ensure line feed at file end on Save|保存時にファイルの最終行に改行を入れる|
|Editor > General > Change font size with Command+Mouse Wheel|マウスで拡大する|
|Show quick documentation on mouse move|マウスオーバーでドキュメント表示|

### General > Appearance
|名前|初期設定|変更|説明| 
|---|---|---|---|
|Show method separators|チェックなし|チェック|メソッド毎に線を表示|

### General > Code Completion
コード補完に関する設定はここ


## 2. Color Scheme
マテリアルテーマプラグイン
https://plugins.jetbrains.com/plugin/8006-material-theme-ui
を入れ、テーマを複製して微調整する

調整内容

|設定内容|設定箇所|元の色|変更後の色|
|---|---|---|---|
|デフォルト文字色|Editor > Color Scheme > General > Default text > Foreground|EEFFFF|FFFFFF|
|背景色|Editor > Color Scheme > General > Default text > Background|212121|000000|
|選択時の背景色|Editor > Color Scheme > General > Selection background|353535|0A5E63|
|メソッドの引数|Editor > ColorSchema > Ruby > Parameter||BBB941|
|ローカル変数|Editor > ColorSchema > Ruby > Local Variable||E8A2B0|
|ローカル変数|Editor > ColorSchema > CoffeeScript > Local Variable||E8A2B0|
|{}/()/[]|Editor > ColorSchema > Language Defaults > (Braces/Parentheses/Brackets)||E5F1F3|
|検索ヒット|Editor > ColorSchema > General > Search Results > Search result||56E8E5|
|検索ヒット|Editor > ColorSchema > General > Search Results > Search result(write access)||56E8E5|
|検索ヒット|Editor > ColorSchema > General > Search Results > Text search result||56E8E5|
|LineNumber|Editor > ColorSchema > General > Code > Line number|||
|背景色|Editor > Color Scheme > General > Text > Default text > Background||181B22|
|文字色|Editor > Color Scheme > General > Text > Default text > Foreground||CFD6E3|
|縦線|Editor > Color Schema > General > Guides > Editor > Hard Wrap guide|||
|インデント縦線|Editor > Color Schema > General > Guides > Editor >　　Indent guide||606060|
|インデント縦線選択中|Editor > Color Schema > General > Guides > Editor >　　Indent guide selected||E7E7E7|
|メソッド横線|Editor > Color Schema > General > Code >　　Method separator color||606060|
|Current row|Editor > Color Schema > General > Editor > Caret row|181818|282828|
|ドット|Editor > Color Schema > Ruby >　　Dot||E5F1F3|
|カンマ(Ruby)|Editor > Color Schema > Ruby > Comma||E5F1F3|
|インスタンス変数|Editor > Color Scheme > Ruby||D0D0FF|

## 3. Vim Emulation(ideaVimとRubymineの競合)
|Shortcut|IDE Action|Handler|変更|
|---|---|---|---|
|CTRL + A|Move Caret to Line Start|Vim||
|CTRL + E|Move Caret to Line End|Vim||
|CTRL + H|Type Hierarchy|Vim|IDE|
|CTRL + N|Down|Vim|IDE|
|CTRL + P|Up|Vim|IDE|
|CTRL + T|Refactor This|Vim|IDE|

# Plugins
自分が入れているプラグイン
- ideavim
    - ※.ideavimrcに`set clipboard=unnamed` を入れておくとclipboard共有できて便利
- Railways
- Material Theme UI
- Rainbow Brackets

# 設定画面以外の設定や使い方メモ
## Projectペイン

|名前|key map|変更|説明| 
|---|---|---|---|
|Autoscroll from Source|off|on|今開いているファイルに応じてソースツリーを開いてくれる|

## メニューバー
### 1. Run
#### debug
##### edit configuration で debug設定を行う

- Bundlerタブの「Run the script in context of the bundle(bundle exec)」にチェック
- ConfigurationタブのRun browser 「http://0.0.0.0:3000」
  「start Javascript debugger automatically when debugging」にチェック
- DefaultのJavaScript Debug の
　URLを「http://localhost:3000」
　Browser「Default」
    - （参考）http://bashalog.c-brains.jp/13/10/03-234403.php
- 「JetBrains IDE Support」をChromeに入れる
　https://www.jetbrains.com/ruby/help/using-jetbrains-chrome-extension.html

##### debugの手順
- Run > Debug... > Development:プロジェクト名  を押下
    - 自動で0.0.0.0:3000がブラウザで立ち上がる)
- RubymineのDebugタグに、Rails用タブ(Development:プロジェクト名)と、JS用タブ(Development:プロジェクト名 javaScript) が立ち上がる
    - JS用タブが立ち上がるのは、 「start Javascript debugger automatically when debugging」にチェックを入れた場合
- ブレイクポイントのつけ方
    - Railsはソースに直接ブレイクポイント打てばok
    - JSはJS用タブ内の 「Scripts」タブの中に「http://localhost:3000/assets」 があるのでそこからファイルを選択し、ブレイクポイントを打つ(app/assets/javascripts内のJSファイルにブレイクポイント打ってもダメ)


##検索範囲対象外とする
除外するフォルダで右クリック→Mark Directory As→Excluded
preferences(cmd + ,)→Project StructureにあるExcluded Folderに除外ファイルが表記されている。
×をクリックすれば除外を解除できる。

##スクラッチ
メモ？？
Cmd + Shift + N

![image.png](https://qiita-image-store.s3.amazonaws.com/0/32875/bbd6d948-447b-4311-5060-54ed2f287593.png)


##Github
|内容|使い方|
|---|---|
|Githubで開く|ファイルで右クリック > Open On Github |

## Terminal等のウィンドウを閉じる
- Shift + ESC
- Command + W


