SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title) AS "Title",
	ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY "Title" DESC


SELECT DISTINCT ON (es.emp_no) es.emp_no,
	es.first_name,
	es.last_name,
	es.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as es
INNER JOIN dept_emp as de
ON es.emp_no = de.emp_no
INNER JOIN titles as ti
on es.emp_no = ti.emp_no
WHERE (es.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
