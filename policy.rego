package goast

# fmt.Printlnを禁止する
#fail[res] {
#    input.Kind == "ExprStmt"
#    input.Node.X.Fun.X.Name == "fmt"
#    input.Node.X.Fun.Sel.Name == "Println"
#
#    res := {
#        "msg": "fmt.Println is not allowed",
#        "pos": input.Node.X.Fun.X.NamePos,
#        "sev": "ERROR"
#    }
#}

# メソッドのレシーバ名は1文字とする
#fail[res] {
#    input.Kind == "FuncDecl"
#    input.Node.Recv != null
#    count(input.Node.Recv.List[x].Names[y].Name) != 1
#
#    res := {
#        "msg": "method receiver name should be 1 character",
#        "pos": input.Node.Recv.List[x].Names[y].NamePos,
#        "sev": "ERROR"
#    }
#}

# Publicな関数にはコメントをつける
#fail[res] {
#    input.Kind == "FuncDecl"
#    is_uppercase(substring(input.Node.Name.Name, 0, 1))
#    input.Node.Doc == null
#
#    res := {
#        "msg": "public function should have comment",
#        "pos": input.Node.Name.NamePos,
#        "sev": "ERROR"
#    }
#}

#is_uppercase(str) {
#    str == upper(str)
#}

# handler pkg以外がhttp pkgに依存することを禁止する
fail[res] {
    input.Kind == "File"
    input.DirName != "internal/handler"
    input.Node.Imports[x].Path.Value == "\"net/http\""

    res := {
        "msg": "handler pkg should not depend on http pkg",
        "pos": input.Node.Imports[x].Path.ValuePos,
        "sev": "ERROR"
    }
}


# handler pkg以外がechoやhttp pkgに依存することを禁止する
# entityがhandler/service/infrastructureに依存することを禁止する
# 環境変数には特定のプレフィックスをつける
# パブリックな関数にはテストを必ず書く(handler pkgは除く)
# エラーメッセージのフォーマットは{package name}: {message}とする
# テストで、expectで構造体全体を比較しない
# dbのレイヤーの関数のテストはモックを使わず、実際にDBを立ててテストする
# データベース操作の関数名はCreate/Update/Get/BatchGet/List/Deleteのどれか
# 真偽値変数は、名詞の場合はis接頭辞を、動詞の場合は過去分詞形
# 標準のjsonライブラリでjsonの変換をしない(easyjson等を使用する)