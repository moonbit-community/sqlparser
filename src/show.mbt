///|
fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
  let input = @debug.to_string(obj)
  let buffer = StringBuilder::new()
  let mut in_string = false
  let mut escaped = false
  for rest = input[:] {
    match rest {
      [] => break
      ['{', ' ', .. next] if !in_string => {
        buffer.write_char('{')
        continue next
      }
      [' ', '}', .. next] if !in_string => {
        buffer.write_char('}')
        continue next
      }
      [ch, .. next] => {
        buffer.write_char(ch)
        if in_string {
          if escaped {
            escaped = false
          } else if ch == '\\' {
            escaped = true
          } else if ch == '"' {
            in_string = false
          }
        } else if ch == '"' {
          in_string = true
        }
        continue next
      }
    }
  }
  buffer.output(logger)
}

///|
pub impl Show for Statements with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Statement with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for QueryStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetExpr with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SelectStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetOperator with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Projection with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Expr with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Literal with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ArrayExpr with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AccessExpr with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Subscript with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Cte with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for BinaryOperator with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for UnaryOperator with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for OrderByExpr with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TableRef with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TableFactor with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TableAlias with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Join with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for JoinOperator with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for JoinConstraint with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for IntervalQualifier with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for PrimaryDatetimeField with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DatetimeUnit with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CaseExpr with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for WindowSpec with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for WindowFrameClause with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for WindowFrameUnits with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for WindowFrameBound with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateTableStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateTableDefinition with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ColumnDef with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DataType with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ColumnDefOption with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateViewStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ViewColumnDef with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateIndexStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for IndexMethod with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for IndexColumn with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateDatabaseStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateSchemaStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateFunctionStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for FunctionParameter with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ParameterMode with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateProcedureStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateSequenceStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SequenceLimit with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SequenceOwnedBy with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DropViewStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DuplicateTreatment with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TableConstraint with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ObjectName with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Top with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for InsertStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for InsertSource with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DeleteStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for UpdateStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Assignment with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeSource with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeWhenClause with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeMatchType with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeAction with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TruncateStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DropTableStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DropIndexStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AlterTableStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AlterTableOperation with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AlterIndexStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AlterIndexOperation with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for IndexParameter with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ShowStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ShowType with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ShowFilter with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetScope with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetAssignment with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for UseStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopySource with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyDirection with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyTarget with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyOption with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyFormat with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyForceQuote with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for OnInsert with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for OnConflictClause with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ConflictTarget with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ConflictAction with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SqliteOnConflict with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for BeginStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CommitStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for RollbackStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SavepointStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ReleaseSavepointStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for GrantStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Privilege with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for RevokeStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for RevokeOption with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LoadDataStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LoadDataDuplicateHandling with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LoadDataFieldsOptions with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LoadDataLinesOptions with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for PrepareStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ExecuteStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DeallocateStmt with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SqlParserError with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Keyword with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LexerError with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Token with fn output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ParserError with fn output(self, logger) {
  show_compact_debug(self, logger)
}
