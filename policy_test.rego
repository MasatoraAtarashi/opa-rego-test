package goast

test_policy {
    not _test_policy
}

_test_policy {
    testCases := [
        {
            "name": "レシーバがない",
            "wantErr": false,
            "data": {
                  "Path": "main.go",
                  "FileName": "main.go",
                  "DirName": ".",
                  "Node": {
                    "Doc": null,
                    "Recv": null,
                    "Name": {
                      "NamePos": 20,
                      "Name": "main",
                      "Obj": null
                    },
                    "Type": {
                      "Func": 15,
                      "TypeParams": null,
                      "Params": {
                        "Opening": 24,
                        "List": [],
                        "Closing": 25
                      },
                      "Results": null
                    },
                    "Body": {
                      "Lbrace": 27,
                      "List": [],
                      "Rbrace": 28
                    }
                  },
                  "Kind": "FuncDecl"
            }
        },
        {
            "name": "レシーバが1文字",
            "wantErr": false,
            "data": {
                  "Path": "main.go",
                  "FileName": "main.go",
                  "DirName": ".",
                  "Node": {
                    "Doc": null,
                    "Recv": {
                      "Opening": 56,
                      "List": [
                        {
                          "Doc": null,
                          "Names": [
                            {
                              "NamePos": 57,
                              "Name": "t",
                              "Obj": null
                            }
                          ],
                          "Type": {
                            "NamePos": 59,
                            "Name": "Test",
                            "Obj": null
                          },
                          "Tag": null,
                          "Comment": null
                        }
                      ],
                      "Closing": 63
                    },
                    "Name": {
                      "NamePos": 65,
                      "Name": "Valid",
                      "Obj": null
                    },
                    "Type": {
                      "Func": 51,
                      "TypeParams": null,
                      "Params": {
                        "Opening": 70,
                        "List": [],
                        "Closing": 71
                      },
                      "Results": null
                    },
                    "Body": {
                      "Lbrace": 73,
                      "List": [],
                      "Rbrace": 74
                    }
                  },
                  "Kind": "FuncDecl"
            }
        },
        {
            "name": "レシーバが2文字",
            "wantErr": true,
            "data": {
                  "Path": "main.go",
                  "FileName": "main.go",
                  "DirName": ".",
                  "Node": {
                    "Doc": null,
                    "Recv": {
                      "Opening": 106,
                      "List": [
                        {
                          "Doc": null,
                          "Names": [
                            {
                              "NamePos": 107,
                              "Name": "tt",
                              "Obj": null
                            }
                          ],
                          "Type": {
                            "NamePos": 110,
                            "Name": "Test",
                            "Obj": null
                          },
                          "Tag": null,
                          "Comment": null
                        }
                      ],
                      "Closing": 114
                    },
                    "Name": {
                      "NamePos": 116,
                      "Name": "Invalid",
                      "Obj": null
                    },
                    "Type": {
                      "Func": 101,
                      "TypeParams": null,
                      "Params": {
                        "Opening": 123,
                        "List": [],
                        "Closing": 124
                      },
                      "Results": null
                    },
                    "Body": {
                      "Lbrace": 126,
                      "List": [],
                      "Rbrace": 127
                    }
                  },
                  "Kind": "FuncDecl"
            }
        }
    ]

    tc := testCases[_]
    out := fail with input as tc.data
    tc.wantErr != (count(out) > 0)
}