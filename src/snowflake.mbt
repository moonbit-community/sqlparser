///|
/// Snowflake dialect - supports Snowflake specific syntax
pub(all) struct Snowflake {}

///|
pub impl Dialect for Snowflake with fn supports_string_literal_backslash_escape(
  _self,
) {
  true
}

///|
pub impl Dialect for Snowflake with fn supports_boolean_literals(_self) {
  true
}

///|
pub impl Dialect for Snowflake with fn supports_filter_during_aggregation(_self) {
  false
}

///|
pub impl Dialect for Snowflake with fn supports_within_after_array_aggregation(
  _self,
) {
  false
}

///|
pub impl Dialect for Snowflake with fn requires_column_types_in_create_table(
  _self,
) {
  true
}

///|
pub impl Dialect for Snowflake with fn supports_if_not_exists(_self) {
  true
}

///|
pub impl Dialect for Snowflake with fn supports_double_quoted_identifiers(_self) {
  true
}

///|
pub impl Dialect for Snowflake with fn parse_statement(
  _self : Snowflake,
  _parser : Parser,
  _tokens : ArrayView[Token],
) -> ParserResult[Statement]? raise ParserError {
  None
}

///|
pub impl Dialect for Snowflake with fn parse_expr(
  _self : Snowflake,
  _tokens : ArrayView[Token],
) -> ParserResult[Expr]? raise ParserError {
  None
}

///|
pub extend Snowflake with Dialect::{
  supports_filter_during_aggregation,
  parse_statement,
  supports_within_after_array_aggregation,
  requires_column_types_in_create_table,
  supports_boolean_literals,
  supports_string_literal_backslash_escape,
  supports_array_syntax,
  supports_double_quoted_identifiers,
  parse_expr,
  supports_named_parameters,
  supports_if_not_exists,
  read_keyword,
}
