///|
pub extend Statements with Show::{to_string, output}

///|
pub extend Statement with Show::{to_string, output}

///|
pub extend QueryStmt with Show::{to_string, output}

///|
pub extend SetExpr with Show::{to_string, output}

///|
pub extend SelectStmt with Show::{to_string, output}

///|
pub extend SetOperator with Show::{to_string, output}

///|
pub extend Projection with Show::{to_string, output}

///|
pub extend Expr with Show::{to_string, output}

///|
pub extend Literal with Show::{to_string, output}

///|
pub extend ArrayExpr with Show::{to_string, output}

///|
pub extend AccessExpr with Show::{to_string, output}

///|
pub extend Subscript with Show::{to_string, output}

///|
pub extend Cte with Show::{to_string, output}

///|
pub extend BinaryOperator with Show::{to_string, output}

///|
pub extend UnaryOperator with Show::{to_string, output}

///|
pub extend OrderByExpr with Show::{to_string, output}

///|
pub extend TableRef with Show::{to_string, output}

///|
pub extend TableFactor with Show::{to_string, output}

///|
pub extend TableAlias with Show::{to_string, output}

///|
pub extend Join with Show::{to_string, output}

///|
pub extend JoinOperator with Show::{to_string, output}

///|
pub extend JoinConstraint with Show::{to_string, output}

///|
pub extend IntervalQualifier with Show::{to_string, output}

///|
pub extend PrimaryDatetimeField with Show::{to_string, output}

///|
pub extend DatetimeUnit with Show::{to_string, output}

///|
pub extend CaseExpr with Show::{to_string, output}

///|
pub extend WindowSpec with Show::{to_string, output}

///|
pub extend WindowFrameClause with Show::{to_string, output}

///|
pub extend WindowFrameUnits with Show::{to_string, output}

///|
pub extend WindowFrameBound with Show::{to_string, output}

///|
pub extend CreateTableStmt with Show::{to_string, output}

///|
pub extend CreateTableDefinition with Show::{to_string, output}

///|
pub extend ColumnDef with Show::{to_string, output}

///|
pub extend DataType with Show::{to_string, output}

///|
pub extend ColumnDefOption with Show::{to_string, output}

///|
pub extend CreateViewStmt with Show::{to_string, output}

///|
pub extend ViewColumnDef with Show::{to_string, output}

///|
pub extend CreateIndexStmt with Show::{to_string, output}

///|
pub extend IndexMethod with Show::{to_string, output}

///|
pub extend IndexColumn with Show::{to_string, output}

///|
pub extend CreateDatabaseStmt with Show::{to_string, output}

///|
pub extend CreateSchemaStmt with Show::{to_string, output}

///|
pub extend CreateFunctionStmt with Show::{to_string, output}

///|
pub extend FunctionParameter with Show::{to_string, output}

///|
pub extend ParameterMode with Show::{to_string, output}

///|
pub extend CreateProcedureStmt with Show::{to_string, output}

///|
pub extend CreateSequenceStmt with Show::{to_string, output}

///|
pub extend SequenceLimit with Show::{to_string, output}

///|
pub extend SequenceOwnedBy with Show::{to_string, output}

///|
pub extend DropViewStmt with Show::{to_string, output}

///|
pub extend DuplicateTreatment with Show::{to_string, output}

///|
pub extend TableConstraint with Show::{to_string, output}

///|
pub extend ObjectName with Show::{to_string, output}

///|
pub extend Top with Show::{to_string, output}

///|
pub extend InsertStmt with Show::{to_string, output}

///|
pub extend InsertSource with Show::{to_string, output}

///|
pub extend DeleteStmt with Show::{to_string, output}

///|
pub extend UpdateStmt with Show::{to_string, output}

///|
pub extend Assignment with Show::{to_string, output}

///|
pub extend MergeStmt with Show::{to_string, output}

///|
pub extend MergeSource with Show::{to_string, output}

///|
pub extend MergeWhenClause with Show::{to_string, output}

///|
pub extend MergeMatchType with Show::{to_string, output}

///|
pub extend MergeAction with Show::{to_string, output}

///|
pub extend TruncateStmt with Show::{to_string, output}

///|
pub extend DropTableStmt with Show::{to_string, output}

///|
pub extend DropIndexStmt with Show::{to_string, output}

///|
pub extend AlterTableStmt with Show::{to_string, output}

///|
pub extend AlterTableOperation with Show::{to_string, output}

///|
pub extend AlterIndexStmt with Show::{to_string, output}

///|
pub extend AlterIndexOperation with Show::{to_string, output}

///|
pub extend IndexParameter with Show::{to_string, output}

///|
pub extend ShowStmt with Show::{to_string, output}

///|
pub extend ShowType with Show::{to_string, output}

///|
pub extend ShowFilter with Show::{to_string, output}

///|
pub extend SetStmt with Show::{to_string, output}

///|
pub extend SetScope with Show::{to_string, output}

///|
pub extend SetAssignment with Show::{to_string, output}

///|
pub extend UseStmt with Show::{to_string, output}

///|
pub extend CopyStmt with Show::{to_string, output}

///|
pub extend CopySource with Show::{to_string, output}

///|
pub extend CopyDirection with Show::{to_string, output}

///|
pub extend CopyTarget with Show::{to_string, output}

///|
pub extend CopyOption with Show::{to_string, output}

///|
pub extend CopyFormat with Show::{to_string, output}

///|
pub extend CopyForceQuote with Show::{to_string, output}

///|
pub extend OnInsert with Show::{to_string, output}

///|
pub extend OnConflictClause with Show::{to_string, output}

///|
pub extend ConflictTarget with Show::{to_string, output}

///|
pub extend ConflictAction with Show::{to_string, output}

///|
pub extend SqliteOnConflict with Show::{to_string, output}

///|
pub extend BeginStmt with Show::{to_string, output}

///|
pub extend CommitStmt with Show::{to_string, output}

///|
pub extend RollbackStmt with Show::{to_string, output}

///|
pub extend SavepointStmt with Show::{to_string, output}

///|
pub extend ReleaseSavepointStmt with Show::{to_string, output}

///|
pub extend GrantStmt with Show::{to_string, output}

///|
pub extend Privilege with Show::{to_string, output}

///|
pub extend RevokeStmt with Show::{to_string, output}

///|
pub extend RevokeOption with Show::{to_string, output}

///|
pub extend LoadDataStmt with Show::{to_string, output}

///|
pub extend LoadDataDuplicateHandling with Show::{to_string, output}

///|
pub extend LoadDataFieldsOptions with Show::{to_string, output}

///|
pub extend LoadDataLinesOptions with Show::{to_string, output}

///|
pub extend PrepareStmt with Show::{to_string, output}

///|
pub extend ExecuteStmt with Show::{to_string, output}

///|
pub extend DeallocateStmt with Show::{to_string, output}

///|
pub extend SqlParserError with Show::{to_string, output}

///|
pub extend Keyword with Show::{to_string, output}

///|
pub extend LexerError with Show::{to_string, output}

///|
pub extend Token with Show::{to_string, output}

///|
pub extend ParserError with Show::{to_string, output}
