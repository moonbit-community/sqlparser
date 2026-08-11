///|
pub(all) struct SQLite {}

///|
pub impl Dialect for SQLite with fn supports_string_literal_backslash_escape(
  _self,
) {
  false
}

///|
pub impl Dialect for SQLite with fn supports_boolean_literals(_self) {
  true
}

///|
pub impl Dialect for SQLite with fn supports_filter_during_aggregation(_self) {
  false
}

///|
pub impl Dialect for SQLite with fn requires_column_types_in_create_table(_self) {
  false
}

///|
pub impl Dialect for SQLite with fn supports_if_not_exists(_self) {
  true
}

///|
pub impl Dialect for SQLite with fn supports_double_quoted_identifiers(_self) {
  true
}

///|
pub impl Dialect for SQLite with fn supports_within_after_array_aggregation(
  _self,
) {
  false
}

///|
pub impl Dialect for SQLite with fn parse_statement(
  _self : SQLite,
  _parser : Parser,
  _tokens : ArrayView[Token],
) -> ParserResult[Statement]? raise ParserError {
  None
}

///|
pub impl Dialect for SQLite with fn parse_expr(
  _self : SQLite,
  _tokens : ArrayView[Token],
) -> ParserResult[Expr]? raise ParserError {
  None
}
