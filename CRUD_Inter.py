# Francisco Alcaraz
# Alberto Acevedo
# COMP 420

import mysql.connector as mysql
import csv
from tkinter import *
from tkinter import ttk
import tkinter.messagebox as MessageBox

# connecting to mysql
mydb = mysql.connect(
    host="franciscoalcaraz.cikeys.com",
    user="francis1_root",
    password="MAealted8642@!",
    database="francis1_pwa_database_project"
)
# checking we connected, then conducting a query
if mydb.is_connected():
  print("Connected to MySQL database")
else:
  print("Failed to connect :(")


# creating the interface
root = Tk()
root.geometry("1800x600")
root.title("Public Works Database")


# Function to insert a new record
def add_employee():
    fname = e_fname.get()
    lname = e_lname.get()
    ephone = e_phone.get()
    etitleid = e_titleid.get()
    edepid = e_depid.get()

    # working with insertions using our stored procedures
    mycursor = mydb.cursor()
    myparams = (fname, lname, ephone, etitleid, edepid)
    mycursor.execute("CALL sp_add_emp(%s, %s, %s, %s, %s)", myparams)
    mydb.commit()

    # clearing the input fields
    e_fname.delete(0, END)
    e_lname.delete(0, END)
    e_phone.delete(0, END)
    e_titleid.delete(0, END)
    e_depid.delete(0, END)
    mycursor.close()


# to delete an employee record
def delete_employee():
    etitleid = e_rmEif.get()

    # using cursor and using delete statement
    cursor = mydb.cursor()
    cursor.execute("DELETE FROM employee WHERE e_employeeID = %s", (etitleid,))
    mydb.commit()
    cursor.close()
    e_rmEif.delete(0, END)


# to search en employee record
def search_employee():
    # get user input from GUI
    emp_id = e_sEid.get()

    # greate cursor and execute SELECT statement to retrieve employee record from database
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM employee WHERE e_employeeID = %s", (emp_id,))
    employee = cursor.fetchone()
    cursor.close()

    # gisplay employee record in GUI
    if employee:
        fname_entry.delete(0, END)
        fname_entry.insert(0, employee[1])
        lname_entry.delete(0, END)
        lname_entry.insert(0, employee[2])
        phone_entry.delete(0, END)
        phone_entry.insert(0, employee[3])
        job_title_id_entry.delete(0, END)
        job_title_id_entry.insert(0, employee[4])
        department_id_entry.delete(0, END)
        department_id_entry.insert(0, employee[5])
    else:
        MessageBox.showerror("Error", "Employee not found.")


# function to update an employee phone
def update_employee():
    # getting the user input
    empID = e_uEid.get()
    empPhone = e_uEphone.get()

    # sql stuff
    cursor = mydb.cursor()
    cursor.execute("UPDATE employee SET e_phonenumber = %s WHERE e_employeeid = %s", (empPhone, empID))
    mydb.commit()
    cursor.close()

    MessageBox.showinfo("Success, Employee Phone Updated.")


# CODE TO INSERT AN EMPLOYEE
# for the first name
l_fname = Label(root, text = 'Enter First Name', font=('Arial', 11))
l_fname.place(x=20, y=30)

e_fname = Entry()
e_fname.place(x=230, y=30)

# for the last name
l_lname = Label(root, text = 'Enter Last Name', font=('Arial', 11))
l_lname.place(x=20, y=60)

e_lname = Entry()
e_lname.place(x=230, y=60)

# for the phone number
l_phone = Label(root, text = 'Enter Phone in XXX-XXX-XXXX', font=('Arial', 11))
l_phone.place(x=20, y=90)

e_phone = Entry()
e_phone.place(x=230, y=90)

# for the title id
l_titleid = Label(root, text = 'Enter Job Title ID', font=('Arial', 11))
l_titleid.place(x=20, y=120)

e_titleid = Entry()
e_titleid.place(x=230, y=120)

# for the department id
l_depid = Label(root, text = 'Enter Department ID', font=('Arial', 11))
l_depid.place(x=20, y=150)

e_depid = Entry()
e_depid.place(x=230, y=150)

myButton = Button(root, text = "Add Employee", command=add_employee)
myButton.grid(row=5, columnspan=20)


# CODE TO REMOVE AND EMPLOYEE
l_rmEid = Label(root, text= 'Enter Employee ID', font=('Arial', 11))
l_rmEid.place(x=400, y=30)

e_rmEif = Entry()
e_rmEif.place(x=550, y=30)

myButton2 = Button(root, text="Remove Employee", command=delete_employee)
myButton2.place(x=400, y=0)


# CODE TO SEARCH AN EMPLOYEE
# input fields
l_sEid = Label(root, text='Search Employee ID', font=('Arial', 11))
l_sEid.place(x=700, y=30)

e_sEid = Entry()
e_sEid.place(x=850, y=30)


# output fields
fname_entry = Entry()
fname_entry.place(x=1000, y=30)

lname_entry = Entry()
lname_entry.place(x=1000, y=60)

phone_entry = Entry()
phone_entry.place(x=1000, y=90)

job_title_id_entry = Entry()
job_title_id_entry.place(x=1000, y=120)

department_id_entry = Entry()
department_id_entry.place(x=1000, y=150)

myButton3 = Button(root, text="Search Employee", command=search_employee)
myButton3.place(x=700, y=0)


# CODE TO UPDATE AN EMPLOYEE PHONE NUMBER
l_uEid = Label(root, text='Enter ID', font=('Arial', 11))
l_uEid.place(x=1200, y=30)

e_uEid = Entry()
e_uEid.place(x=1380, y=30)

# entering phone
l_uEphone = Label(root, text='Enter New Phone', font=('Arial', 11))
l_uEphone.place(x=1200, y=60)

e_uEphone = Entry()
e_uEphone.place(x=1380, y=60)

myButton4 = Button(root, text='Update Employee Phone', command=update_employee)
myButton4.place(x=1200, y=0)

root.mainloop()
# end of tkinter code


# mydb.close()