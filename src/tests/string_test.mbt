// Tests for string literal printing and round-tripping.

///|
test "string literals with embedded quotes print escaped" {
  let sql = @sqlparser.parse_sql("SELECT 'it''s a \"test\"' FROM t")
  let pretty = sql.stmts[0] |> @sqlparser.pretty_print
  inspect(pretty, content="SELECT\n  'it''s a \"test\"'\nFROM\n  t;")
}

///|
test "string literals round-trip with MySQL dialect" {
  let inputs = [
    "SELECT 'it''s' FROM t", "SELECT 'say \"hi\"' FROM t", "SELECT '' FROM t", "SELECT 'a''b''c' FROM t",
  ]
  for input in inputs {
    let stmts = @sqlparser.parse_sql(input)
    let printed = @sqlparser.pretty_print(stmts)
    let again = @sqlparser.parse_sql(printed) catch {
      e => {
        println("\{input}: reparse failed: \{e}")
        panic()
      }
    }
    if (stmts == again) == false {
      println(
        "\{input}: pretty-printed SQL does not round-trip to an equal AST",
      )
      panic()
    }
  }
}

///|
test "string literals round-trip with PostgreSQL dialect" {
  let inputs = [
    "SELECT 'it''s' FROM t", "SELECT 'say \"hi\"' FROM t", "SELECT '' FROM t",
  ]
  for input in inputs {
    let stmts = @sqlparser.parse_sql(dialect=@sqlparser.Postgres::{ }, input)
    let printed = @sqlparser.pretty_print(stmts)
    let again = @sqlparser.parse_sql(dialect=@sqlparser.Postgres::{ }, printed) catch {
      e => {
        println("\{input}: reparse failed: \{e}")
        panic()
      }
    }
    if (stmts == again) == false {
      println(
        "\{input}: pretty-printed SQL does not round-trip to an equal AST",
      )
      panic()
    }
  }
}

///|
test "string literals round-trip with SQLite dialect" {
  let inputs = ["SELECT 'it''s' FROM t", "SELECT '' FROM t"]
  for input in inputs {
    let stmts = @sqlparser.parse_sql(dialect=@sqlparser.SQLite::{ }, input)
    let printed = @sqlparser.pretty_print(stmts)
    let again = @sqlparser.parse_sql(dialect=@sqlparser.SQLite::{ }, printed) catch {
      e => {
        println("\{input}: reparse failed: \{e}")
        panic()
      }
    }
    if (stmts == again) == false {
      println(
        "\{input}: pretty-printed SQL does not round-trip to an equal AST",
      )
      panic()
    }
  }
}
