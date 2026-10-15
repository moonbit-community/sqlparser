///|
pub extend Statements with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Statement with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend QueryStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend SelectStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend SetOperator with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Projection with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Expr with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Literal with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend ArrayExpr with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend AccessExpr with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Subscript with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Cte with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend BinaryOperator with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend UnaryOperator with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend OrderByExpr with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend TableRef with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend TableFactor with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend TableAlias with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Join with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend JoinOperator with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend JoinConstraint with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend IntervalQualifier with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend PrimaryDatetimeField with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend DatetimeUnit with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CaseExpr with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend WindowSpec with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend WindowFrameClause with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend WindowFrameBound with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend CreateTableStmt with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend CreateTableDefinition with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend ColumnDef with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend DataType with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend ColumnDefOption with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend CreateViewStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CreateIndexStmt with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend IndexMethod with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend IndexColumn with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend ViewColumnDef with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CreateDatabaseStmt with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend CreateSchemaStmt with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend CreateFunctionStmt with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend CreateProcedureStmt with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend CreateSequenceStmt with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend SequenceLimit with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend SequenceOwnedBy with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend FunctionParameter with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend ParameterMode with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend DropViewStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend DuplicateTreatment with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend TableConstraint with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend ObjectName with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Top with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend InsertStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend InsertSource with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend DeleteStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend UpdateStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Assignment with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend MergeStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend MergeSource with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend MergeWhenClause with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend MergeMatchType with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend MergeAction with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend TruncateStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend DropTableStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend DropIndexStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend AlterTableStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend AlterTableOperation with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend AlterIndexStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend AlterIndexOperation with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend IndexParameter with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend ShowStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend ShowType with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend ShowFilter with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend SetStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend SetAssignment with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend UseStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CopyStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CopySource with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CopyDirection with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CopyTarget with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CopyOption with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CopyFormat with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CopyForceQuote with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend OnInsert with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend OnConflictClause with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend ConflictTarget with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend ConflictAction with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend SqliteOnConflict with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend BeginStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend CommitStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend RollbackStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend SavepointStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend ReleaseSavepointStmt with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend GrantStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend Privilege with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend RevokeStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend RevokeOption with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend LoadDataStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend LoadDataDuplicateHandling with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend LoadDataFieldsOptions with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend LoadDataLinesOptions with @moonbit-community/prettyprinter.Pretty::{
  pretty,
}

///|
pub extend PrepareStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend ExecuteStmt with @moonbit-community/prettyprinter.Pretty::{pretty}

///|
pub extend DeallocateStmt with @moonbit-community/prettyprinter.Pretty::{pretty}
