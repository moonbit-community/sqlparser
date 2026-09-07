///|
fn[T : Debug] show_compact_debug(obj : T, logger : &Logger) -> Unit {
  let input = @debug.to_string(obj)
  let buffer = StringBuilder()
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
  Show::output(buffer, logger)
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

///|
pub extend AccessExpr with Show::{to_string, output}

///|
pub extend AlterIndexOperation with Show::{to_string, output}

///|
pub extend AlterIndexStmt with Show::{to_string, output}

///|
pub extend AlterTableOperation with Show::{to_string, output}

///|
pub extend AlterTableStmt with Show::{to_string, output}

///|
pub extend ArrayExpr with Show::{to_string, output}

///|
pub extend Assignment with Show::{to_string, output}

///|
pub extend BeginStmt with Show::{to_string, output}

///|
pub extend BinaryOperator with Show::{to_string, output}

///|
pub extend CaseExpr with Show::{to_string, output}

///|
pub extend ColumnDef with Show::{to_string, output}

///|
pub extend ColumnDefOption with Show::{to_string, output}

///|
pub extend CommitStmt with Show::{to_string, output}

///|
pub extend ConflictAction with Show::{to_string, output}

///|
pub extend ConflictTarget with Show::{to_string, output}

///|
pub extend CopyDirection with Show::{to_string, output}

///|
pub extend CopyForceQuote with Show::{to_string, output}

///|
pub extend CopyFormat with Show::{to_string, output}

///|
pub extend CopyOption with Show::{to_string, output}

///|
pub extend CopySource with Show::{to_string, output}

///|
pub extend CopyStmt with Show::{to_string, output}

///|
pub extend CopyTarget with Show::{to_string, output}

///|
pub extend CreateDatabaseStmt with Show::{to_string, output}

///|
pub extend CreateFunctionStmt with Show::{to_string, output}

///|
pub extend CreateIndexStmt with Show::{to_string, output}

///|
pub extend CreateProcedureStmt with Show::{to_string, output}

///|
pub extend CreateSchemaStmt with Show::{to_string, output}

///|
pub extend CreateSequenceStmt with Show::{to_string, output}

///|
pub extend CreateTableDefinition with Show::{to_string, output}

///|
pub extend CreateTableStmt with Show::{to_string, output}

///|
pub extend CreateViewStmt with Show::{to_string, output}

///|
pub extend Cte with Show::{to_string, output}

///|
pub extend DataType with Show::{to_string, output}

///|
pub extend DatetimeUnit with Show::{to_string, output}

///|
pub extend DeallocateStmt with Show::{to_string, output}

///|
pub extend DeleteStmt with Show::{to_string, output}

///|
pub extend DropIndexStmt with Show::{to_string, output}

///|
pub extend DropTableStmt with Show::{to_string, output}

///|
pub extend DropViewStmt with Show::{to_string, output}

///|
pub extend DuplicateTreatment with Show::{to_string, output}

///|
pub extend ExecuteStmt with Show::{to_string, output}

///|
pub extend Expr with Show::{to_string, output}

///|
pub extend FunctionParameter with Show::{to_string, output}

///|
pub extend GrantStmt with Show::{to_string, output}

///|
pub extend IndexColumn with Show::{to_string, output}

///|
pub extend IndexMethod with Show::{to_string, output}

///|
pub extend IndexParameter with Show::{to_string, output}

///|
pub extend InsertSource with Show::{to_string, output}

///|
pub extend InsertStmt with Show::{to_string, output}

///|
pub extend IntervalQualifier with Show::{to_string, output}

///|
pub extend Join with Show::{to_string, output}

///|
pub extend JoinConstraint with Show::{to_string, output}

///|
pub extend JoinOperator with Show::{to_string, output}

///|
pub extend Keyword with Show::{to_string, output}

///|
pub extend LexerError with Show::{to_string, output}

///|
pub extend Literal with Show::{to_string, output}

///|
pub extend LoadDataDuplicateHandling with Show::{to_string, output}

///|
pub extend LoadDataFieldsOptions with Show::{to_string, output}

///|
pub extend LoadDataLinesOptions with Show::{to_string, output}

///|
pub extend LoadDataStmt with Show::{to_string, output}

///|
pub extend MergeAction with Show::{to_string, output}

///|
pub extend MergeMatchType with Show::{to_string, output}

///|
pub extend MergeSource with Show::{to_string, output}

///|
pub extend MergeStmt with Show::{to_string, output}

///|
pub extend MergeWhenClause with Show::{to_string, output}

///|
pub extend ObjectName with Show::{to_string, output}

///|
pub extend OnConflictClause with Show::{to_string, output}

///|
pub extend OnInsert with Show::{to_string, output}

///|
pub extend OrderByExpr with Show::{to_string, output}

///|
pub extend ParameterMode with Show::{to_string, output}

///|
pub extend ParserError with Show::{to_string, output}

///|
pub extend PrepareStmt with Show::{to_string, output}

///|
pub extend PrimaryDatetimeField with Show::{to_string, output}

///|
pub extend Privilege with Show::{to_string, output}

///|
pub extend Projection with Show::{to_string, output}

///|
pub extend QueryStmt with Show::{to_string, output}

///|
pub extend ReleaseSavepointStmt with Show::{to_string, output}

///|
pub extend RevokeOption with Show::{to_string, output}

///|
pub extend RevokeStmt with Show::{to_string, output}

///|
pub extend RollbackStmt with Show::{to_string, output}

///|
pub extend SavepointStmt with Show::{to_string, output}

///|
pub extend SelectStmt with Show::{to_string, output}

///|
pub extend SequenceLimit with Show::{to_string, output}

///|
pub extend SequenceOwnedBy with Show::{to_string, output}

///|
pub extend SetAssignment with Show::{to_string, output}

///|
pub extend SetExpr with Show::{to_string, output}

///|
pub extend SetOperator with Show::{to_string, output}

///|
pub extend SetScope with Show::{to_string, output}

///|
pub extend SetStmt with Show::{to_string, output}

///|
pub extend ShowFilter with Show::{to_string, output}

///|
pub extend ShowStmt with Show::{to_string, output}

///|
pub extend ShowType with Show::{to_string, output}

///|
pub extend SqlParserError with Show::{to_string, output}

///|
pub extend SqliteOnConflict with Show::{to_string, output}

///|
pub extend Statement with Show::{to_string, output}

///|
pub extend Statements with Show::{to_string, output}

///|
pub extend Subscript with Show::{to_string, output}

///|
pub extend TableAlias with Show::{to_string, output}

///|
pub extend TableConstraint with Show::{to_string, output}

///|
pub extend TableFactor with Show::{to_string, output}

///|
pub extend TableRef with Show::{to_string, output}

///|
pub extend Token with Show::{to_string, output}

///|
pub extend Top with Show::{to_string, output}

///|
pub extend TruncateStmt with Show::{to_string, output}

///|
pub extend UnaryOperator with Show::{to_string, output}

///|
pub extend UpdateStmt with Show::{to_string, output}

///|
pub extend UseStmt with Show::{to_string, output}

///|
pub extend ViewColumnDef with Show::{to_string, output}

///|
pub extend WindowFrameBound with Show::{to_string, output}

///|
pub extend WindowFrameClause with Show::{to_string, output}

///|
pub extend WindowFrameUnits with Show::{to_string, output}

///|
pub extend WindowSpec with Show::{to_string, output}
