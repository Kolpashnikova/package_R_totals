library(totals)
library(rjson)
library(jsonlite)

data <- fromJSON('{"1":35.59,
              "2":2.84,
              "3":10.36,
              "4":1.27,
              "5":2.61,
              "6":9.29,
              "7":2.23,
              "8":13,
              "9":4.46,
              "10":12.7,
              "11": 12,
              "12": 3.34
              }')

act = c("Sleep", "Personal Care", "Housework", "Childcare", "Family Care", "Work",
        "Shopping", "TV Watching", "Eating", "Leisure", "Travel", "Random")

totals(toJSON(data), toJSON(act))

colors = fromJSON('[["#1b3a71", "#52a11a", "#a6e072"],
            ["#4e52e9", "#f9cb94", "#0f57f5"],
            ["#1e59cd", "#2fa2a4", "#9bbf5d"],
            ["#c0217a", "#b4051d", "#13c94b"],
            ["#f55bfa", "#f3476c", "#10741c"],
            ["#50724c", "#bdbdba", "#8e501a"],
            ["#6085e3", "#2f3cc6", "#eefa23"],
            ["#d01554", "#13ab07", "#b1bfe5"],
            ["#b8bd4e", "#4aa25f", "#57324b"],
            ["#460feb", "#14407e", "#f6ee7a"],
            ["#56995a", "#166fb3", "#9f7ed4"]]')

totals(toJSON(data), toJSON(act), toJSON(colors))
