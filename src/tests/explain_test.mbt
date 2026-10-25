// Tests for EXPLAIN statement parsing, printing and round-tripping.

///|
test {
  "EXPLAIN SELECT 1 FROM t" |> pass
}

///|
test {
  "EXPLAIN ANALYZE SELECT 1 FROM t" |> pass
}

///|
test {
  "EXPLAIN VERBOSE SELECT 1 FROM t" |> pass
}

///|
test {
  "EXPLAIN QUERY PLAN SELECT 1 FROM t" |> pass
}

///|
test {
  "EXPLAIN FORMAT = JSON SELECT 1 FROM t" |> pass
}

///|
test {
  "EXPLAIN FORMAT JSON SELECT 1 FROM t" |> pass
}

///|
test {
  "EXPLAIN ANALYZE FORMAT = TREE SELECT * FROM t1 JOIN t2 ON t1.a = t2.b"
  |> pass
}

///|
test "EXPLAIN ANALYZE FORMAT pretty print" {
  let sql = @sqlparser.parse_sql(
    "EXPLAIN ANALYZE FORMAT = TREE SELECT 1 FROM t",
  )
  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
  inspect(
    pretty,
    content="EXPLAIN ANALYZE FORMAT = tree SELECT\n  1\nFROM\n  t;",
  )
}

///|
test "EXPLAIN QUERY PLAN pretty print" {
  let sql = @sqlparser.parse_sql("EXPLAIN QUERY PLAN SELECT 1 FROM t")
  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
  inspect(pretty, content="EXPLAIN QUERY PLAN SELECT\n  1\nFROM\n  t;")
}

///|
test "EXPLAIN with PostgreSQL dialect" {
  let sql = @sqlparser.parse_sql(
    dialect=@sqlparser.Postgres::{ },
    "EXPLAIN ANALYZE VERBOSE SELECT 1 FROM t",
  )
  inspect(sql.stmts.length(), content="1")
}

///|
test "EXPLAIN roundtrips" {
  let inputs = [
    "EXPLAIN SELECT 1 FROM t", "EXPLAIN ANALYZE SELECT 1 FROM t", "EXPLAIN VERBOSE SELECT 1 FROM t",
    "EXPLAIN QUERY PLAN SELECT 1 FROM t", "EXPLAIN FORMAT = JSON SELECT 1 FROM t",
    "EXPLAIN ANALYZE FORMAT = JSON SELECT * FROM orders WHERE a > 12",
  ]
  for input in inputs {
    let stmts = @sqlparser.parse_sql(input)
    let printed = @sqlparser.pretty_print(stmts)
    let again = @sqlparser.parse_sql(printed)
    inspect(stmts == again, content="true")
  }
}

///|
test {
  "EXPLAIN" |> expect_parse_error
}

///|
test {
  "EXPLAIN QUERY" |> expect_parse_error
}

///|
test {
  "EXPLAIN FORMAT" |> expect_parse_error
}

///|
test "EXPLAIN words stay usable as identifiers" {
  for input in [
    "SELECT analyze FROM t;", "SELECT verbose FROM t;", "SELECT * FROM explain;",
    "SELECT * FROM t AS analyze;", "CREATE TABLE explain (analyze INT);",
  ] {
    let stmts = @sqlparser.parse_sql(input)
    inspect(stmts.stmts.length(), content="1")
  }
}

///|
test "EXPLAIN still parses after contextual matching" {
  for input in [
    "EXPLAIN SELECT 1 FROM t", "EXPLAIN ANALYZE SELECT 1 FROM t",
    "EXPLAIN VERBOSE SELECT 1 FROM t", "EXPLAIN QUERY PLAN SELECT 1 FROM t",
  ] {
    let stmts = @sqlparser.parse_sql(input)
    let again = @sqlparser.parse_sql(@sqlparser.pretty_print(stmts))
    inspect(stmts == again, content="true")
  }
}
