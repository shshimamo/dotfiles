## 1.Editor Action
|名前|key map|変更|説明| 
|---|---|---|---|
|Cut up to Line End|CTRL + K|CTRL + K削除|末尾まで切り取る|
|Right|→ , CTRL + F|CTRL + Fを削除|右へ|
|Left|←, CTRL + B|CTRL + Bを削除|左へ|
|Move Caret to Line Start|CTRL + A||行の先頭に移動|
|Move Caret to Line End|CTRL + E||行の末尾に移動|
|Coose Lookup Item and Insert Dot|CTRL + .||先頭の補完候補を選択して.も記入|
|Add or Remove Caret|alt + クリック|alt + shift + クリック(alt + クリックはJump to Sourceに割り当てる)|複数選択して同時編集とかできるみたいだけど使ったことないので削除
|Down|Ctrl + N|Ctrl + N 削除(Vimバインド使っていれば不要なため)|下に移動|
|UP|Ctrl + P|Ctrl + P 削除(Vimバインド使っていれば不要なため)|上に移動|

## 2. MainMenu

###View

|名前|key map|変更|説明| 
|---|---|---|---|
|Quick Definition|Opt + Space|CTRL + J & Space|ポップアップでソース参照| 
|Quick Documentation | F1 , CTRL + J |CTRL + J削除, CTRL + J & (CTRL) + D| ポップアップでドキュメント参照|
|Jump to Source|Command + ↓|(追加)alt + クリック|ソースに飛ぶ

###Navigate

|名前|key map|変更|説明| 
|---|---|---|---|
|Class...|Cmd + O|-|プロジェクト内のクラス名で検索|
|File...|Shift + Cmd + O|-|プロジェクト内でファイル名で検索|
|Symbol...|Opt + Cmd + O|-|プロジェクト内で変数名、メソッド名などで検索?|
|File Structure|Cmd + F12|CTRL + J & CTRL + J |クラスのメソッド、フィールドを見れる。さらにmodelではカラムも見れる|
|Type Hierarchy|CTRL + H|CTRL + J & (CTRL +) H , CTRL + H削除|タイプヒエラルキー|
|Back|Cmd + [|CTRL + J & CTRL + O|戻る|
|Forward|Cmd + ]|CTRL + J & CTRL + I|進む|
|Last Edit Location|Ctrl + Cmd Backspace|CTRL + J & O|最後の編集に戻る(CTRL + o は戻る。普通の o は最後の編集へ)|
|Next Edit Location|-|CTRL + J & I|最後の編集に戻る(CTRL + o は戻る。普通の o は最後の編集へ)|
|Declaration|Cmd + B|CTRL + J & (CTRL +) B|定義へジャンプ|
|Implementation(s)|Opt + Cmd + B|-|継承しているクラスへジャンプ|
|Toggle Bookmark|F3|Ctrl + J & (CTRL +)K)|ブックマークのつけはずし|
|Show Bookmarks|Cmd + F3|Ctrl + J & (CTRL +)L|ブックマークリスト|
|Related Symbol|Ctrl + Cmd + ↑|CTRL + K & CTRL + K|view,model,controller,testへジャンプ|


###Window

|名前|key map|変更|説明| 
|---|---|---|---|
|Select Next Tab|Shift + Cmd + ]|Ctrl + J & (Ctrl +) N|次のタブ|
|Select Previous Tab|Shift + Cmd + [|Ctrl + J & (Ctrl +) P|前のタブ|
|Move Down||Ctrl + J & (Ctrl +) S|下分割|
|Move Right||Ctrl + J & (Ctrl +) V|右分割|
|Move To Opposite Group||Ctrl + J & (Ctrl +[) |別のウインドウに移動|
|Close Others||Ctrl + J & Q|他のタブを閉じる|


###Edit

|名前|key map|変更|説明| 
|---|---|---|---|
|Add Selection for Next Occurrence|CTRL + G|CTRL + G 削除|検索時に次のヒットに進む|
|Copy Reference|Shift + Cmd + Option + C|Ctrl + J & C|相対パス + Lineナンバー コピー|

## 3.Tool Windows

|名前|Shortcut|変更|説明|
|---|---|---|
|Terminal||CTRL + J & T|ターミナル起動|


## 5. Version Control Systems
|名前|key map|変更|説明| 
|---|---|---|---|
|Show Local Changes|-|CTRL + G & (CTRL + )L|ローカルの変更を表示|
|Show History|-|CTRL + G & (CTRL + )H|ヒストリーを表示|
|Annotate|-|CTRL + G & (CTRL + )A|Git Blame的なやつ|
