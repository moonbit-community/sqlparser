// The parsed statement tree must be destructurable from downstream
// packages. SetExpr/SelectStmt and friends were opaque types in the
// published interface while the rest of the AST (Statement, QueryStmt,
// Expr, ...) was pub(all); these tests run from a downstream package
// and break if the visibility regresses.

///|
test "select body is destructurable from a downstream package" {
  let program = @sqlparser.parse_sql(
    "SELECT a, b AS x FROM t WHERE a > 1 GROUP BY a HAVING count(*) > 2;",
  )
  let stmt = program.stmts[0]
  let query = match stmt {
    @sqlparser.Statement::Query(query) => query
    _ => fail("expected a query statement")
  }
  let select = match query.body {
    @sqlparser.SetExpr::Select(select) => select
    _ => fail("expected a plain select body")
  }
  inspect(select.projections.length(), content="2")
  inspect(select.from.length(), content="1")
  inspect(select.group_by.length(), content="1")
  assert_true(select.where_clause is Some(_))
  assert_true(select.having is Some(_))
  assert_false(select.distinct)
}

///|
test "set operations are destructurable from a downstream package" {
  let program = @sqlparser.parse_sql("SELECT a FROM t UNION SELECT b FROM u;")
  let query = match program.stmts[0] {
    @sqlparser.Statement::Query(query) => query
    _ => fail("expected a query statement")
  }
  match query.body {
    @sqlparser.SetExpr::SetOperation(@sqlparser.Union, _, _) => ()
    _ => fail("expected a UNION set operation")
  }
}

///|
test "extract's datetime field is destructurable from a downstream package" {
  let program = @sqlparser.parse_sql("SELECT EXTRACT(YEAR FROM d) FROM t;")
  let query = match program.stmts[0] {
    @sqlparser.Statement::Query(query) => query
    _ => fail("expected a query statement")
  }
  let select = match query.body {
    @sqlparser.SetExpr::Select(select) => select
    _ => fail("expected a plain select body")
  }
  let expr = match select.projections[0] {
    @sqlparser.Projection::UnamedExpr(expr) => expr
    _ => fail("expected an unnamed expression projection")
  }
  match expr {
    @sqlparser.Expr::Extract(field, _) =>
      inspect(field.field.to_string(), content="Year")
    _ => fail("expected EXTRACT")
  }
}

///|
test "create view payload is destructurable from a downstream package" {
  let program = @sqlparser.parse_sql("CREATE VIEW v AS SELECT a FROM t;")
  match program.stmts[0] {
    @sqlparser.Statement::CreateView(view) => inspect(view.name, content="v")
    _ => fail("expected a create view statement")
  }
}
