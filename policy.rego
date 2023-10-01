package goast

# fmt.Printlnを禁止する
fail[res] {
    input.Kind == "ExprStmt"
    input.Node.X.Fun.X.Name == "fmt"
    input.Node.X.Fun.Sel.Name == "Println"

    res := {
        "msg": "fmt.Println is not allowed",
        "pos": input.Node.X.Fun.X.NamePos,
        "sev": "ERROR"
    }
}

# メソッドのレシーバ名は1文字とする


# handler pkg以外がechoやhttp pkgに依存することを禁止する
# entityがhandler/service/infrastructureに依存することを禁止する
# 環境変数にはINVASION_BUYERプレフィックスをつける
# パブリックな関数にはテストを必ず書く(handler pkgは除く)
# エラーメッセージのフォーマットは{package name}: {message}とする
# テストで、expectで全体を比較しない
