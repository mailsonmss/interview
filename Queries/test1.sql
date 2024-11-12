-- We are given a table consisting of two columns, Name, and Profession. 
 We need to query all the names immediately followed by the first letter in the profession column enclosed in parenthesis.


Select  Distinct concat(name, '(', Left(Profession, 1), ')')
From    my_table





