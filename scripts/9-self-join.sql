# join z samym soba
# get a list of employees and their immediate managers:
# tutaj nie ma takich danych, ale cos takiego:

# select e.employee as employee, b.employee as boss
# from emptable e, emptable b
# where e.manager_id = b.empolyee_id

# or

# select e.employee as employee, b.employee as boss
# from emptable e
# join  emptable b e.manager_id = b.empolyee_id