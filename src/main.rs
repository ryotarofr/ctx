// ■作るもの
// python 用のデータ操作ライブラリ
// とりあえずほしいの
//
// python関数を拡張するためのチェーンユーティリティを rust で書きたい
// ■なぜつくるのか
//  lambda 関数でデータ効率を担保しつつ、python コードの美しさをたもつ。
//
//
// 可能なら db 操作からデータを直接ライブラリに取り込み内部関数のみでデータ操作振る舞うようにしたい
// ネストされた構造をサポートするのは難しそう




// def sum(a: int,b: int):
//     return a + b
//
// sum(1, 2)
//
//
// def get_data(params):
//    sql = "SELECT * FROM my_table WHERE id = %s;"
//    return db.SELECT(sql, params, is_all=True);
//
// res = get_data(tuple(100,))
// if not res:
//    raise ValueError("No data found") 
// 
// ↑ これを
// get_data(tuple(100,)).is.None("No data found") → top_level_function に Exeption を伝番
// get_data(tuple(100,)).is.False("is False")
// 
// 
// データコンテキストライブラリを作ろうと思ったらプログラミング言語を作ることになった件
// これは純粋関数です。
// lambda 関数のような小さいコードを簡潔に書く
// ネストした関数内で任意のデータをトップ関数に伝番できます。
// 
// getData||.isNone||.

pub struct CTX {

}

