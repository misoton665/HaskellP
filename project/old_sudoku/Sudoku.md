# 数独ゲーム仕様
## ルール
数独-Wikipedia https://ja.wikipedia.org/wiki/%E6%95%B0%E7%8B%AC
## テーブル
<pre>
    1       2       3       4       5       6       7       8       9
 -------------------------------------------------------------------------
 |                       |                       |                       |
1|   1       2       3   |   4       5       6   |   7       8       9   |
 |                       |                       |                       |
 |                       |                       |                       |
2|   4      (5)      6   |   7       8       9   |   1       2       3   |
 |                       |                       |                       |
 |                       |                       |                       |
3|   7       8       9   |   1       2       3   |   4       5       6   |
 |_______________________________________________________________________|
 |                       |                       |                       |
4|   3       1       2   |   6       4       5   |   9       7       8   |
 |                       |                       |                       |
 |                       |                       |                       |
5|   6       4       5   |   9      (.)      8   |   3       1       2   |
 |                       |                       |                       |
 |                       |                       |                       |
6|   9       7       8   |   3       1       2   |   6       4       5   |
 |_______________________________________________________________________|
 |                       |                       |                       |
7|   2       3       1   |   5       6       4   |   8       9       7   |
 |                       |                       |                       |
 |                       |                       |                       |
8|   5       6       4   |   8       9       7   |   2       3       1   |
 |                       |                       |                       |
 |                       |                       |        [1,2,3]        |
9|   8       9       7   |   2       3       1   |   5      (.)      4   |
 |                       |                       |                       |
 -------------------------------------------------------------------------
</pre>

* (.) - 入力前のマス
* (n) - 入力後のマス
* [n] - 保留中の数字

 ※nは1~9の数字, 数字の保留は3つまで。

## 入力
　入力の方法は二つ段階を設けて開発する

### 一段階目
####コマンド
<pre>
[command] [x] [y] ([number])
</pre>

*[command]* - put | rm | hold | rmhold

* put 
	- numberを入力する。
	- 既に入力されていれば置き換える。
* rm
	- 入力された数字を削除する。
	- putで入力された数字がなければ無視する。
* hold
	- 保留スペースにnumberを追加する。
	- numberがputで入力されていても保留に追加する。
	- 既にnumberが保留スペースにある場合は無視する。
* rmhold
	- 保留スペースのnumberを削除する。
	- 保留スペースにnumberがない場合は無視する。

*[x]* *[y]*
*command*の対象にする(1~9, 1~9)の座標。範囲外ならば無視する。

*[number]*
*command*に使用する1~9の数字。範囲外の場合は無視する。

**例**
<pre>
put 1 2 3
rm 1 2
hold 4 5 6
rmhold 4 5 6
</pre>

### 二段階目
入力はコンスタントに受け取り、テーブル上の入力カーソルを移動させて操作対象のマスを決める。

#### カーソル
<pre>
[1,2,3]
  (4)
   ^
</pre>

#### コマンド
<pre>h | j | k | l | [number] | h[number] | r[number]</pre>
*h | j | k | l*
左上下右へカーソルを移動する。

*[number]*
numberを入力(put)する。0を指定すると削除(rm)を行う。

*h[number]*
numberを保留(hold)する。

*r[number]*
保留されているnumberを削除(rmhold)する。

## 段階的な目標
1. テーブルを表示する。
2. 乱数で生成した数独テーブルを作成する。
3. 穴あきの数独テーブルを作成する。
4. 入力インターフェイスを作成する。
5. 一段階目の入力方法でゲームができるようにする。
6. コンスタントに入力を受け入れるようにする。
7. カーソルを表示して移動できるようにする。
8. 二段階目の入力方法でゲームができるようにする。