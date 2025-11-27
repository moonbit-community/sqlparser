///|
/// Test cases for PREPARE/EXECUTE/DEALLOCATE statements

///|
test "PREPARE simple SELECT" {
  let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = ?"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE stmt AS SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = ?;


    ),
  )
}

///|
test "PREPARE with data types" {
  let sql = "PREPARE stmt (INTEGER, VARCHAR(50)) AS SELECT * FROM users WHERE id = ? AND name = ?"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE stmt (INTEGER, VARCHAR(50)) AS SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = ? 
      #|  AND name = ?;


    ),
  )
}

///|
test "PREPARE INSERT statement" {
  let sql = "PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?)"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      "PREPARE insert_user AS INSERT INTO users (name, email) VALUES (?, ?);"
    ),
  )
}

///|
test "PREPARE UPDATE statement" {
  let sql = "PREPARE update_user AS UPDATE users SET name = ? WHERE id = ?"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE update_user AS UPDATE users
      #|SET name = ?
      #|WHERE id = ?;


    ),
  )
}

///|
test "PREPARE DELETE statement" {
  let sql = "PREPARE delete_user AS DELETE FROM users WHERE id = ?"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE delete_user AS DELETE FROM users
      #|WHERE id = ?;


    ),
  )
}

///|
test "PREPARE with PostgreSQL numbered placeholders" {
  let sql = "PREPARE stmt (INTEGER, TEXT) AS SELECT * FROM users WHERE id = $1 AND name = $2"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE stmt (INTEGER, TEXT) AS SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = $1 
      #|  AND name = $2;


    ),
  )
}

///|
test "PREPARE with named parameters" {
  let sql = "PREPARE stmt AS SELECT * FROM users WHERE id = :id AND name = :name"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE stmt AS SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = :id 
      #|  AND name = :name;


    ),
  )
}

///|
test "PREPARE with complex query" {
  let sql = "PREPARE complex_query AS SELECT u.id, u.name, COUNT(o.id) as order_count FROM users u LEFT JOIN orders o ON u.id = o.user_id WHERE u.is_active = ? GROUP BY u.id, u.name HAVING COUNT(o.id) > ?"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE complex_query AS SELECT
      #|  u.id,
      #|  u.name,
      #|  count(o.id) AS order_count
      #|FROM
      #|  users AS u LEFT JOIN orders AS o
      #|    ON u.id = o.user_id
      #|WHERE
      #|  u.is_active = ?
      #|GROUP BY
      #|  u.id,
      #|  u.name
      #|HAVING
      #|  count(o.id) > ?;


    ),
  )
}

///|
test "PREPARE with subquery" {
  let sql = "PREPARE subquery_stmt AS SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE amount > ?)"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE subquery_stmt AS SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id IN (
      #|    SELECT
      #|      user_id
      #|    FROM
      #|      orders
      #|    WHERE
      #|      amount > ?
      #|  );


    ),
  )
}

///|
test "PREPARE with window function" {
  let sql = "PREPARE window_stmt AS SELECT name, salary, RANK() OVER (ORDER BY salary DESC) as rank FROM employees WHERE department = ?"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE window_stmt AS SELECT
      #|  name,
      #|  salary,
      #|  rank() OVER (ORDER BY salary DESC) AS rank
      #|FROM
      #|  employees
      #|WHERE
      #|  department = ?;


    ),
  )
}

///|
test "PREPARE with CTE" {
  let sql = "PREPARE cte_stmt AS WITH recent_orders AS (SELECT * FROM orders WHERE created_at > ?) SELECT * FROM recent_orders WHERE status = ?"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE cte_stmt AS WITH recent_orders AS (
      #|  SELECT
      #|    *
      #|  FROM
      #|    orders
      #|  WHERE
      #|    created_at > ?
      #|)
      #|SELECT
      #|  *
      #|FROM
      #|  recent_orders
      #|WHERE
      #|  status = ?;


    ),
  )
}

///|
test "EXECUTE simple" {
  let sql = "EXECUTE stmt"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|EXECUTE stmt;
    ),
  )
}

///|
test "EXECUTE with parenthesized parameters" {
  let sql = "EXECUTE stmt(1, 'John')"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|EXECUTE stmt(1, 'John');
    ),
  )
}

///|
test "EXECUTE with USING clause" {
  let sql = "EXECUTE stmt USING 1, 'John'"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|EXECUTE stmt USING 1, 'John';
    ),
  )
}

///|
test "EXECUTE with complex expressions" {
  let sql = "EXECUTE stmt USING 1 + 2, CONCAT('Hello', ' World')"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      "EXECUTE stmt USING 1 + 2, concat('Hello', ' World');"
    ),
  )
}

///|
test "EXECUTE IMMEDIATE" {
  let sql = "EXECUTE IMMEDIATE"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|EXECUTE IMMEDIATE;
    ),
  )
}

///|
test "EXECUTE IMMEDIATE with INTO" {
  let sql = "EXECUTE IMMEDIATE INTO v_result"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|EXECUTE IMMEDIATE INTO v_result;
    ),
  )
}

///|
test "EXECUTE IMMEDIATE with INTO and USING" {
  let sql = "EXECUTE IMMEDIATE INTO v_result USING 1, 'test'"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|EXECUTE IMMEDIATE INTO v_result USING 1, 'test';
    ),
  )
}

///|
test "EXECUTE with multiple INTO variables" {
  let sql = "EXECUTE IMMEDIATE INTO v_name, v_email, v_age"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|EXECUTE IMMEDIATE INTO v_name, v_email, v_age;
    ),
  )
}

///|
test "DEALLOCATE simple" {
  let sql = "DEALLOCATE stmt"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|DEALLOCATE stmt;
    ),
  )
}

///|
test "DEALLOCATE with PREPARE keyword" {
  let sql = "DEALLOCATE PREPARE stmt"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|DEALLOCATE PREPARE stmt;
    ),
  )
}

///|
test "PREPARE and EXECUTE separately" {
  let sql1 = "PREPARE user_query AS SELECT * FROM users WHERE id = ?"
  let sql2 = "EXECUTE user_query(123)"
  let stmt1 = parse_sql(sql1)[0] |> pretty_print
  let stmt2 = parse_sql(sql2)[0] |> pretty_print
  inspect(
    stmt1,
    content=(
      #|PREPARE user_query AS SELECT
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
      #|EXECUTE user_query(123);
    ),
  )
}

///|
test "PREPARE with multiple data types" {
  let sql = "PREPARE stmt (INTEGER, VARCHAR(100), DOUBLE) AS SELECT * FROM users WHERE id = ?"
  let stmt = parse_sql(sql)[0] |> pretty_print
  inspect(
    stmt,
    content=(
      #|PREPARE stmt (INTEGER, VARCHAR(100), DOUBLE) AS SELECT
      #|  *
      #|FROM
      #|  users
      #|WHERE
      #|  id = ?;


    ),
  )
}
