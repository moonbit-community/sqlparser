///|
/// Minimal runnable example: parse a query and pretty-print it back.
fn main {
  let sql = "SELECT name, age FROM users WHERE age > 18"
  let statements = @sqlparser.parse_sql(sql) catch {
    e => {
      println("failed to parse \{sql}: \{e}")
      return
    }
  }
  println(@sqlparser.pretty_print(statements))
}
