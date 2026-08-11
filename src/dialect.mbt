///|
pub trait Dialect {
  /// Whether this dialect supports using backslash as escape character in string literals
  fn supports_string_literal_backslash_escape(Self) -> Bool = _

  /// Whether this dialect supports boolean literals (TRUE/FALSE)
  fn supports_boolean_literals(Self) -> Bool = _

  /// Whether this dialect supports FILTER during aggregation (PostgreSQL style)
  fn supports_filter_during_aggregation(Self) -> Bool = _

  /// Whether this dialect supports WITHIN after array aggregation functions
  fn supports_within_after_array_aggregation(Self) -> Bool = _

  /// Whether this dialect requires specifying column types in CREATE TABLE
  fn requires_column_types_in_create_table(Self) -> Bool = _

  /// Whether this dialect supports IF NOT EXISTS in CREATE TABLE
  fn supports_if_not_exists(Self) -> Bool = _

  /// Whether this dialect supports double quotes for identifiers  
  fn supports_double_quoted_identifiers(Self) -> Bool = _

  /// Whether this dialect supports array syntax (ARRAY[...] and [...])
  fn supports_array_syntax(Self) -> Bool = _

  /// Whether this dialect supports named parameters (@param_name)
  fn supports_named_parameters(Self) -> Bool = _

  /// Custom expression parsing for dialect-specific syntax
  fn parse_expr(Self, tokens : ArrayView[Token]) -> ParserResult[Expr]? raise ParserError = _

  /// Custom statement parsing for dialect-specific syntax
  fn parse_statement(Self, parser : Parser, tokens : ArrayView[Token]) -> ParserResult[
    Statement,
  ]? raise ParserError = _

  /// Dialect-specific keyword recognition from string
  fn read_keyword(Self, word : String) -> Keyword? = _
}

///|
impl Dialect with fn supports_string_literal_backslash_escape(_self) {
  false
}

///|
impl Dialect with fn supports_boolean_literals(_self) {
  true
}

///|
impl Dialect with fn supports_filter_during_aggregation(_self) {
  false
}

///|
impl Dialect with fn supports_within_after_array_aggregation(_self) {
  false
}

///|
impl Dialect with fn requires_column_types_in_create_table(_self) {
  true
}

///|
impl Dialect with fn supports_if_not_exists(_self) {
  true
}

///|
impl Dialect with fn supports_double_quoted_identifiers(_self) {
  false
}

///|
impl Dialect with fn supports_array_syntax(_self) {
  false
}

///|
impl Dialect with fn supports_named_parameters(_self) {
  false
}

///|
impl Dialect with fn parse_expr(_self : Self, _tokens : ArrayView[Token]) -> ParserResult[
  Expr,
]? raise ParserError {
  None
}

///|
impl Dialect with fn parse_statement(
  _self : Self,
  _parser : Parser,
  _tokens : ArrayView[Token],
) -> ParserResult[Statement]? raise ParserError {
  // Debug: If this is being called instead of dialect-specific implementation,
  // we'll know there's a dispatch issue
  None
}

///|
impl Dialect with fn read_keyword(_self : Self, _word : String) -> Keyword? {
  // By default, no dialect-specific keywords
  None
}
