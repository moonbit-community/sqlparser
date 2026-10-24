// Regression tests for moonbit-community/sqlparser#7: statements that end
// right after an identifier used to abort with index_out_of_bounds instead
// of parsing, because tokenize only produced a trailing Eof for inputs that
// ended with whitespace.

///|
fn expect_parse_error(input : String) -> Unit {
  try {
    @sqlparser.parse_sql(input) |> ignore
    panic()
  } catch {
    ParserError(_) => ()
    LexerError(_) => panic()
  }
}

///|
test {
  let stmts = @sqlparser.parse_sql("SELECT 1 FROM t")
  inspect(stmts.stmts.length(), content="1")
}

///|
test {
  @sqlparser.parse_sql("SELECT 1 FROM t;") |> ignore
}

///|
test {
  @sqlparser.parse_sql("SELECT 1 FROM t ") |> ignore
}

///|
test {
  "SELECT 1 FROM t UNION SELECT 2 FROM u" |> pass
}

///|
test {
  "SELECT * FROM t1 JOIN t2 ON t1.a = t2.b" |> pass
}

///|
test {
  "SELECT" |> expect_parse_error
}

///|
test {
  "SELECT 1 FROM t JOIN" |> expect_parse_error
}

///|
test {
  "SELECT * FROM t WHERE" |> expect_parse_error
}
