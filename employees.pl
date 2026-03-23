% ============================================
% Employee Management System in Prolog
% ============================================

% ----------- FACTS ---------------------------
% employee(Name, Position, Department, Salary)

employee(john, manager, sales, 70000).
employee(susan, engineer, it, 85000).
employee(mike, technician, it, 60000).
employee(lisa, manager, hr, 75000).
employee(paul, engineer, sales, 90000).

% ----------- RULES ---------------------------

% 1. higher_salary(X, Y)
% True if employee X earns more than employee Y
higher_salary(X, Y) :-
    employee(X, _, _, SalaryX),
    employee(Y, _, _, SalaryY),
    SalaryX > SalaryY.

% 2. same_department(X, Y)
% True if X and Y work in the same department and are not the same person
same_department(X, Y) :-
    employee(X, _, Dept, _),
    employee(Y, _, Dept, _),
    X \= Y.

% 3. manager(X)
% True if X is a manager
manager(X) :-
    employee(X, manager, _, _).

% 4. it_employee(X)
% True if X works in IT department
it_employee(X) :-
    employee(X, _, it, _).

% ----------- FILTER PREDICATE ----------------

% high_earners(Amount, List)
% Returns a list of employees earning more than Amount
high_earners(Amount, List) :-
    findall(Name,
        (employee(Name, _, _, Salary), Salary > Amount),
        List).


