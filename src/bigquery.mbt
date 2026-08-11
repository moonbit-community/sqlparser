///|
/// BigQuery dialect - supports Google BigQuery specific syntax
pub(all) struct BigQuery {}

///|
pub impl Dialect for BigQuery with fn supports_string_literal_backslash_escape(
  _self,
) {
  true
}

///|
pub impl Dialect for BigQuery with fn supports_boolean_literals(_self) {
  true
}

///|
pub impl Dialect for BigQuery with fn supports_filter_during_aggregation(_self) {
  false
}

///|
pub impl Dialect for BigQuery with fn supports_within_after_array_aggregation(
  _self,
) {
  false
}

///|
pub impl Dialect for BigQuery with fn requires_column_types_in_create_table(
  _self,
) {
  true
}

///|
pub impl Dialect for BigQuery with fn supports_if_not_exists(_self) {
  true
}

///|
pub impl Dialect for BigQuery with fn supports_double_quoted_identifiers(_self) {
  false
}

///|
pub impl Dialect for BigQuery with fn supports_named_parameters(_self) {
  true
}

///|
pub impl Dialect for BigQuery with fn parse_statement(
  _self : BigQuery,
  _parser : Parser,
  _tokens : ArrayView[Token],
) -> ParserResult[Statement]? raise ParserError {
  None
}

///|
pub impl Dialect for BigQuery with fn parse_expr(
  _self : BigQuery,
  _tokens : ArrayView[Token],
) -> ParserResult[Expr]? raise ParserError {
  None
}

///|
// BigQuery parameterized query tests

test "BigQuery named parameter" {
  let tokens = "SELECT * FROM users WHERE id = @user_id;"
  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = @user_id;
    ),
  )
}

///|
test "BigQuery positional parameter" {
  let tokens = "SELECT * FROM users WHERE id = ?;"
  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = ?;
    ),
  )
}

///|
test "BigQuery mixed parameters" {
  let tokens = "SELECT * FROM users WHERE id = @user_id AND age > ?;"
  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = @user_id 
      #|  AND age > ?;
    ),
  )
}

///|
test "BigQuery multiple named parameters" {
  let tokens = "SELECT @field FROM @table WHERE @condition = @value;"
  let stmt = parse_sql(dialect=BigQuery::{  }, tokens).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  @field
      #|FROM
      #|  @table
      #|WHERE
      #|  @condition = @value;
    ),
  )
}

///|
// Negative test: Named parameters should not work with other dialects

test "Named parameters treated as identifiers in MySQL" {
  let tokens = "SELECT @user_id FROM users;"
  let stmt = parse_sql(dialect=MySQL::{  }, tokens).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  @user_id
      #|FROM
      #|  users;
    ),
  )
}
