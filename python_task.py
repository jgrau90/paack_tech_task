#1. Can you sort a numerical list in Python?

lst = ["5", "8", "1", "2", "10"]
lst = [int(i) for i in lst]
lst.sort()
print(lst)

#Write a code to count the number of capital letters in the “drivers_table.csv” file.

with open('drivers_summary.csv') as countletter:
    count = 0
    text = countletter.read()
    for character in text:
        if character.isupper():
            count += 1
print(count) 

#Write a function that lists the files in a path with a specific file extension.

def path_files(path, file_extension):
    import os
    text_files = [f for f in os.listdir(path) if f.endswith(file_extension)]
    return text_files
  
#Could you provide a code that executes the query you have created previously
#in question 6 of SQL and export the result to a CSV?
I don't know how to integrate a query in python and export a query into a CSV

#Can you write a code that executes a query in one database and insert the data
#in a different database?
I know there's the import sqlite to establish the connection to a sql database but i don't know how to do it. I could copy paste it but it wouldn't be real.
