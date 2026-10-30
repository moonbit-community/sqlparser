// Tests for numeric literal printing and round-tripping.

///|
test "double literals print in plain decimal notation" {
  // Magnitudes where Double::to_string would switch to scientific
  // notation, which the lexer cannot parse back.
  let cases = [
    ("SELECT 0.0000001 FROM t", "SELECT\n  0.0000001\nFROM\n  t;"),
    ("SELECT 0.00000001 FROM t", "SELECT\n  0.00000001\nFROM\n  t;"),
    (
      "SELECT 1234567890123456789012.0 FROM t", "SELECT\n  1234567890123456800000.0\nFROM\n  t;",
    ),
    ("SELECT 100.00 FROM t", "SELECT\n  100.0\nFROM\n  t;"),
  ]
  for case in cases {
    let (input, expected) = case
    let sql = @sqlparser.parse_sql(input)
    let pretty = sql.stmts[0] |> @sqlparser.pretty_print
    inspect(pretty, content=expected)
  }
}

///|
test "double literals round-trip across magnitudes" {
  let inputs = [
    "SELECT 1.5 FROM t", "SELECT 0.1 FROM t", "SELECT 0.000001 FROM t", "SELECT 0.0000001 FROM t",
    "SELECT 0.00000001 FROM t", "SELECT 1234567890123456789012.0 FROM t", "SELECT 100.00 FROM t",
    "SELECT 1.0 FROM t", "SELECT -0.5 FROM t",
  ]
  for input in inputs {
    let stmts = @sqlparser.parse_sql(input)
    let printed = @sqlparser.pretty_print(stmts)
    let again = @sqlparser.parse_sql(printed) catch {
      e => {
        println("\{input}: reparse failed: \{e} (printed: \{printed})")
        panic()
      }
    }
    if (stmts == again) == false {
      println("\{input}: printed \{printed} does not round-trip")
      panic()
    }
  }
}
