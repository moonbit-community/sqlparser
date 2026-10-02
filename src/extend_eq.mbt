///|
pub extend Statements with Eq::{not_equal, equal}

///|
pub extend Statement with Eq::{not_equal, equal}

///|
pub extend QueryStmt with Eq::{not_equal, equal}

///|
pub extend SetExpr with Eq::{not_equal, equal}

///|
pub extend SelectStmt with Eq::{not_equal, equal}

///|
pub extend SetOperator with Eq::{not_equal, equal}

///|
pub extend Projection with Eq::{not_equal, equal}

///|
pub extend Expr with Eq::{not_equal, equal}

///|
pub extend Literal with Eq::{not_equal, equal}

///|
pub extend ArrayExpr with Eq::{not_equal, equal}

///|
pub extend AccessExpr with Eq::{not_equal, equal}

///|
pub extend Subscript with Eq::{not_equal, equal}

///|
pub extend Cte with Eq::{not_equal, equal}

///|
pub extend BinaryOperator with Eq::{not_equal, equal}

///|
pub extend UnaryOperator with Eq::{not_equal, equal}

///|
pub extend OrderByExpr with Eq::{not_equal, equal}

///|
pub extend TableRef with Eq::{not_equal, equal}

///|
pub extend TableFactor with Eq::{not_equal, equal}

///|
pub extend TableAlias with Eq::{not_equal, equal}

///|
pub extend Join with Eq::{not_equal, equal}

///|
pub extend JoinOperator with Eq::{not_equal, equal}

///|
pub extend JoinConstraint with Eq::{not_equal, equal}

///|
pub extend IntervalQualifier with Eq::{not_equal, equal}

///|
pub extend PrimaryDatetimeField with Eq::{not_equal, equal}

///|
pub extend DatetimeUnit with Eq::{not_equal, equal}

///|
pub extend CaseExpr with Eq::{not_equal, equal}

///|
pub extend WindowSpec with Eq::{not_equal, equal}

///|
pub extend WindowFrameClause with Eq::{not_equal, equal}

///|
pub extend WindowFrameUnits with Eq::{not_equal, equal}

///|
pub extend WindowFrameBound with Eq::{not_equal, equal}

///|
pub extend CreateTableStmt with Eq::{not_equal, equal}

///|
pub extend CreateTableDefinition with Eq::{not_equal, equal}

///|
pub extend ColumnDef with Eq::{not_equal, equal}

///|
pub extend DataType with Eq::{not_equal, equal}

///|
pub extend ColumnDefOption with Eq::{not_equal, equal}

///|
pub extend CreateViewStmt with Eq::{not_equal, equal}

///|
pub extend ViewColumnDef with Eq::{not_equal, equal}

///|
pub extend CreateIndexStmt with Eq::{not_equal, equal}

///|
pub extend IndexMethod with Eq::{not_equal, equal}

///|
pub extend IndexColumn with Eq::{not_equal, equal}

///|
pub extend CreateDatabaseStmt with Eq::{not_equal, equal}

///|
pub extend CreateSchemaStmt with Eq::{not_equal, equal}

///|
pub extend CreateFunctionStmt with Eq::{not_equal, equal}

///|
pub extend FunctionParameter with Eq::{not_equal, equal}

///|
pub extend ParameterMode with Eq::{not_equal, equal}

///|
pub extend CreateProcedureStmt with Eq::{not_equal, equal}

///|
pub extend CreateSequenceStmt with Eq::{not_equal, equal}

///|
pub extend SequenceLimit with Eq::{not_equal, equal}

///|
pub extend SequenceOwnedBy with Eq::{not_equal, equal}

///|
pub extend DropViewStmt with Eq::{not_equal, equal}

///|
pub extend DuplicateTreatment with Eq::{not_equal, equal}

///|
pub extend TableConstraint with Eq::{not_equal, equal}

///|
pub extend ObjectName with Eq::{not_equal, equal}

///|
pub extend Top with Eq::{not_equal, equal}

///|
pub extend InsertStmt with Eq::{not_equal, equal}

///|
pub extend InsertSource with Eq::{not_equal, equal}

///|
pub extend DeleteStmt with Eq::{not_equal, equal}

///|
pub extend UpdateStmt with Eq::{not_equal, equal}

///|
pub extend Assignment with Eq::{not_equal, equal}

///|
pub extend MergeStmt with Eq::{not_equal, equal}

///|
pub extend MergeSource with Eq::{not_equal, equal}

///|
pub extend MergeWhenClause with Eq::{not_equal, equal}

///|
pub extend MergeMatchType with Eq::{not_equal, equal}

///|
pub extend MergeAction with Eq::{not_equal, equal}

///|
pub extend TruncateStmt with Eq::{not_equal, equal}

///|
pub extend DropTableStmt with Eq::{not_equal, equal}

///|
pub extend DropIndexStmt with Eq::{not_equal, equal}

///|
pub extend AlterTableStmt with Eq::{not_equal, equal}

///|
pub extend AlterTableOperation with Eq::{not_equal, equal}

///|
pub extend AlterIndexStmt with Eq::{not_equal, equal}

///|
pub extend AlterIndexOperation with Eq::{not_equal, equal}

///|
pub extend IndexParameter with Eq::{not_equal, equal}

///|
pub extend ShowStmt with Eq::{not_equal, equal}

///|
pub extend ShowType with Eq::{not_equal, equal}

///|
pub extend ShowFilter with Eq::{not_equal, equal}

///|
pub extend SetStmt with Eq::{not_equal, equal}

///|
pub extend SetScope with Eq::{not_equal, equal}

///|
pub extend SetAssignment with Eq::{not_equal, equal}

///|
pub extend UseStmt with Eq::{not_equal, equal}

///|
pub extend CopyStmt with Eq::{not_equal, equal}

///|
pub extend CopySource with Eq::{not_equal, equal}

///|
pub extend CopyDirection with Eq::{not_equal, equal}

///|
pub extend CopyTarget with Eq::{not_equal, equal}

///|
pub extend CopyOption with Eq::{not_equal, equal}

///|
pub extend CopyFormat with Eq::{not_equal, equal}

///|
pub extend CopyForceQuote with Eq::{not_equal, equal}

///|
pub extend OnInsert with Eq::{not_equal, equal}

///|
pub extend OnConflictClause with Eq::{not_equal, equal}

///|
pub extend ConflictTarget with Eq::{not_equal, equal}

///|
pub extend ConflictAction with Eq::{not_equal, equal}

///|
pub extend SqliteOnConflict with Eq::{not_equal, equal}

///|
pub extend BeginStmt with Eq::{not_equal, equal}

///|
pub extend CommitStmt with Eq::{not_equal, equal}

///|
pub extend RollbackStmt with Eq::{not_equal, equal}

///|
pub extend SavepointStmt with Eq::{not_equal, equal}

///|
pub extend ReleaseSavepointStmt with Eq::{not_equal, equal}

///|
pub extend GrantStmt with Eq::{not_equal, equal}

///|
pub extend Privilege with Eq::{not_equal, equal}

///|
pub extend RevokeStmt with Eq::{not_equal, equal}

///|
pub extend RevokeOption with Eq::{not_equal, equal}

///|
pub extend LoadDataStmt with Eq::{not_equal, equal}

///|
pub extend LoadDataDuplicateHandling with Eq::{not_equal, equal}

///|
pub extend LoadDataFieldsOptions with Eq::{not_equal, equal}

///|
pub extend LoadDataLinesOptions with Eq::{not_equal, equal}

///|
pub extend PrepareStmt with Eq::{not_equal, equal}

///|
pub extend ExecuteStmt with Eq::{not_equal, equal}

///|
pub extend DeallocateStmt with Eq::{not_equal, equal}

///|
pub extend Keyword with Eq::{not_equal, equal}

///|
pub extend Token with Eq::{not_equal, equal}
