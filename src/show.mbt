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
pub impl Show for Statements with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Statement with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for QueryStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetExpr with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SelectStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetOperator with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Projection with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Expr with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Literal with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ArrayExpr with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AccessExpr with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Subscript with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Cte with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for BinaryOperator with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for UnaryOperator with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for OrderByExpr with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TableRef with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TableFactor with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TableAlias with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Join with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for JoinOperator with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for JoinConstraint with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for IntervalQualifier with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for PrimaryDatetimeField with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DatetimeUnit with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CaseExpr with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for WindowSpec with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for WindowFrameClause with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for WindowFrameUnits with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for WindowFrameBound with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateTableStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateTableDefinition with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ColumnDef with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DataType with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ColumnDefOption with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateViewStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ViewColumnDef with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateIndexStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for IndexMethod with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for IndexColumn with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateDatabaseStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateSchemaStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateFunctionStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for FunctionParameter with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ParameterMode with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateProcedureStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CreateSequenceStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SequenceLimit with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SequenceOwnedBy with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DropViewStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DuplicateTreatment with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TableConstraint with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ObjectName with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Top with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for InsertStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for InsertSource with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DeleteStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for UpdateStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Assignment with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeSource with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeWhenClause with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeMatchType with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for MergeAction with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for TruncateStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DropTableStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DropIndexStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AlterTableStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AlterTableOperation with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AlterIndexStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for AlterIndexOperation with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for IndexParameter with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ShowStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ShowType with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ShowFilter with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetScope with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SetAssignment with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for UseStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopySource with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyDirection with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyTarget with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyOption with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyFormat with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CopyForceQuote with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for OnInsert with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for OnConflictClause with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ConflictTarget with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ConflictAction with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SqliteOnConflict with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for BeginStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for CommitStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for RollbackStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SavepointStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ReleaseSavepointStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for GrantStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Privilege with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for RevokeStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for RevokeOption with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LoadDataStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LoadDataDuplicateHandling with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LoadDataFieldsOptions with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LoadDataLinesOptions with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for PrepareStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ExecuteStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for DeallocateStmt with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for SqlParserError with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Keyword with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for LexerError with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for Token with output(self, logger) {
  show_compact_debug(self, logger)
}

///|
pub impl Show for ParserError with output(self, logger) {
  show_compact_debug(self, logger)
}
