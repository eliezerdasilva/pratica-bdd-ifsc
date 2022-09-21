INSERT INTO employees(
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    commission_pct,
    manager_id,
    department_id
)
values (
    10,
    'bruna',
    'russi',
    'bruna.russi@ifsc.edu.br',
    '13513513',
    CURDATE(),
    'AC_ACCOUNT',
    2000,
    null,
    null,
    90
)