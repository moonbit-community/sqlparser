///| Parameterized Query Support Tests

///|

///| Tests for prepared statement placeholders and parameterized queries.

///| Supports multiple placeholder formats:

///| - `?` - Anonymous placeholder (MySQL, SQLite)

///| - `$1`, `$2` - Numbered placeholders (PostgreSQL)

///| - `:name` - Named parameters (Oracle, PostgreSQL)

///| - `@name` - Variable parameters (SQL Server, MySQL)

///|
test "Question mark placeholder in WHERE clause" {
  let sql = "SELECT * FROM users WHERE id = ?;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = ?;
    ),
  )
}

///|
test "Multiple question mark placeholders" {
  let sql = "SELECT * FROM users WHERE age > ? AND name = ?;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  age > ? 
      #|  AND name = ?;
    ),
  )
}

///|
test "Question mark placeholder in INSERT" {
  let sql = "INSERT INTO users (name, age) VALUES (?, ?);"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|INSERT INTO users (name, age) VALUES (?, ?);
    ),
  )
}

///|
test "Question mark placeholder in UPDATE" {
  let sql = "UPDATE users SET name = ?, age = ? WHERE id = ?;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|UPDATE users
      #|SET name = ?, age = ?
      #|WHERE id = ?;
    ),
  )
}

///|
test "Question mark placeholder in LIMIT" {
  let sql = "SELECT * FROM users LIMIT ?;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|LIMIT
      #|  ?;
    ),
  )
}

///|
test "Question mark placeholder in LIMIT and OFFSET" {
  let sql = "SELECT * FROM users LIMIT ? OFFSET ?;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|LIMIT
      #|  ?
      #|OFFSET
      #|  ?;
    ),
  )
}

///|
test "PostgreSQL $1 numbered placeholder" {
  let sql = "SELECT * FROM users WHERE id = $1;"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = $1;
    ),
  )
}

///|
test "PostgreSQL multiple numbered placeholders" {
  let sql = "SELECT * FROM users WHERE age > $1 AND name = $2;"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  age > $1 
      #|  AND name = $2;
    ),
  )
}

///|
test "PostgreSQL numbered placeholders in INSERT" {
  let sql = "INSERT INTO users (name, age, email) VALUES ($1, $2, $3);"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content="INSERT INTO users (name, age, email) VALUES ($1, $2, $3);",
  )
}

///|
test "PostgreSQL numbered placeholders in LIMIT OFFSET" {
  let sql = "SELECT * FROM users LIMIT $1 OFFSET $2;"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|LIMIT
      #|  $1
      #|OFFSET
      #|  $2;
    ),
  )
}

///|
test "PostgreSQL numbered placeholders out of order" {
  let sql = "SELECT * FROM users WHERE id = $2 AND name = $1;"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = $2 
      #|  AND name = $1;
    ),
  )
}

///|
test "Colon named parameter" {
  let sql = "SELECT * FROM users WHERE name = :username;"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  name = :username;
    ),
  )
}

///|
test "Multiple colon named parameters" {
  let sql = "SELECT * FROM users WHERE age > :min_age AND city = :city_name;"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  age > :min_age 
      #|  AND city = :city_name;
    ),
  )
}

///|
test "Colon named parameters in INSERT" {
  let sql = "INSERT INTO users (name, age) VALUES (:name, :age);"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(stmt, content="INSERT INTO users (name, age) VALUES (:name, :age);")
}

///|
test "At-sign named parameter" {
  let sql = "SELECT * FROM users WHERE name = @username;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  name = @username;
    ),
  )
}

///|
test "Multiple at-sign named parameters" {
  let sql = "SELECT * FROM users WHERE age > @min_age AND city = @city_name;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  age > @min_age 
      #|  AND city = @city_name;
    ),
  )
}

///|
test "Placeholder in function call" {
  let sql = "SELECT UPPER(?) FROM users;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  upper(?)
      #|FROM
      #|  users;
    ),
  )
}

///|
test "Placeholder in expression" {
  let sql = "SELECT * FROM users WHERE age + ? > 100;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  age + ? > 100;
    ),
  )
}

///|
test "Placeholder in BETWEEN clause" {
  let sql = "SELECT * FROM users WHERE age BETWEEN ? AND ?;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  age BETWEEN ? AND ?;
    ),
  )
}

///|
test "Placeholder in IN list" {
  let sql = "SELECT * FROM users WHERE id IN (?, ?, ?);"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id IN (?, ?, ?);
    ),
  )
}

///|
test "PostgreSQL numbered placeholder in CASE expression" {
  let sql = "SELECT CASE WHEN age > $1 THEN 'old' ELSE 'young' END FROM users;"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  CASE
      #|    WHEN age > $1 THEN 'old'
      #|    ELSE 'young'
      #|  END
      #|FROM
      #|  users;
    ),
  )
}

///|
test "Named parameter in JOIN condition" {
  let sql = "SELECT * FROM users u JOIN orders o ON u.id = o.user_id WHERE o.total > :min_total;"
  let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users AS u JOIN orders AS o
      #|    ON u.id = o.user_id
      #|WHERE
      #|  o.total > :min_total;
    ),
  )
}

///|
test "Mixed placeholders should work independently" {
  // Note: This tests that each dialect supports its own placeholder style
  // In practice, mixing different styles in one query is usually not allowed
  let sql1 = "SELECT * FROM users WHERE id = ?;"
  let sql2 = "SELECT * FROM users WHERE id = $1;"
  let sql3 = "SELECT * FROM users WHERE id = :user_id;"
  let stmt1 = parse_sql(dialect=MySQL::{  }, sql1).stmts[0] |> pretty_print
  let stmt2 = parse_sql(dialect=Postgres::{  }, sql2).stmts[0] |> pretty_print
  let stmt3 = parse_sql(dialect=Postgres::{  }, sql3).stmts[0] |> pretty_print
  inspect(
    stmt1,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = ?;
    ),
  )
  inspect(
    stmt2,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = $1;
    ),
  )
  inspect(
    stmt3,
    content=(
      #|SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = :user_id;
    ),
  )
}

///|
test "Placeholder in DELETE statement" {
  let sql = "DELETE FROM users WHERE id = ?;"
  let stmt = parse_sql(dialect=MySQL::{  }, sql).stmts[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|DELETE FROM users
      #|WHERE id = ?;
    ),
  )
}

// RETURNING clause is not yet supported in the parser
// TODO: Re-enable this test when RETURNING is implemented
// ///|
// test "PostgreSQL placeholder in RETURNING clause" {
//   let sql = "INSERT INTO users (name, age) VALUES ($1, $2) RETURNING id;"
//   let stmt = parse_sql(dialect=Postgres::{  }, sql).stmts[0] |> pretty_print
//   inspect(
//     stmt,
//     content=(
//       #|INSERT INTO users (name, age)
//       #|VALUES
//       #|  ($1, $2)
//       #|RETURNING
//       #|  id;
//     ),
//   )
// }
