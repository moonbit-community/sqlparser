// EXPLAIN statement parsing.
//
// Covers the shapes that are valid across the supported dialects:
//   EXPLAIN <statement>                       (all dialects)
//   EXPLAIN QUERY PLAN <statement>            (SQLite; parsed contextually so
//                                              "query" and "plan" stay usable
//                                              as plain identifiers)
//   EXPLAIN [ANALYZE] [VERBOSE] <statement>   (PostgreSQL legacy bare form,
//                                              MySQL 8 EXPLAIN ANALYZE)
//   EXPLAIN [FORMAT [=] <name>] <statement>   (MySQL FORMAT = JSON)
//
// "explain", "analyze" and "verbose" are matched contextually (not global
// keywords) so they stay usable as plain identifiers, e.g. as column or
// table names.

///|
fn Parser::parse_explain_statement(
  self : Parser,
  tokens : ArrayView[Token],
) -> ParserResult[ExplainStmt] raise ParserError {
  let tokens = self.expect_token(tokens, Identifier("explain"))
  let mut query_plan = false
  let mut analyze = false
  let mut verbose = false
  let mut format : String? = None
  let tokens = for tokens = tokens {
    match tokens {
      [Identifier(word), .. tokens] if word.to_lower() == "analyze" => {
        analyze = true
        continue tokens
      }
      [Identifier(word), .. tokens] if word.to_lower() == "verbose" => {
        verbose = true
        continue tokens
      }
      [Identifier(word), Identifier(plan_word), .. tokens] if word.to_lower() ==
        "query" &&
        plan_word.to_lower() == "plan" => {
        query_plan = true
        continue tokens
      }
      [Keyword(Format), .. tokens] => {
        let tokens = match tokens {
          [Eq, .. tokens] => tokens
          tokens => tokens
        }
        let (name, tokens) = match tokens {
          [Identifier(name), .. tokens] => (name, tokens)
          [token, .. _tokens] =>
            raise UnexpectedTokenMessageError(token, "expected FORMAT name")
          [] => raise InternalBug("parse_explain_statement: end of tokens")
        }
        // Normalize the format name so that pretty-printed output
        // round-trips to an equal AST (identifiers print lowercased).
        format = Some(name.to_lower())
        continue tokens
      }
      tokens => break tokens
    }
  }
  let (statement, tokens) = self.parse_statement(tokens)
  ({ query_plan, analyze, verbose, format, statement, }, tokens)
}
