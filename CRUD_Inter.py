import mysql.connector as mysql
import csv
from tkinter import *
from tkinter import ttk
import tkinter.messagebox as MessageBox


# connecting to mysql
# mydb = mysql.connect(
#     host="franciscoalcaraz.cikeys.com",
#     user="francis1_root",
#     password="MAealted8642@!",
#     database="francis1_pwa_database_project"
# )
# checking we connected, then conducting a query
# if mydb.is_connected():
#   print("Connected to MySQL database")
# else:
#   print("Failed to connect :(")
# mycursor = mydb.cursor()


# working with insertions using our stored procedures
# myparams = ('Robert','Machara', '905-345-0909', 1001, 200)
# mycursor.execute("CALL sp_add_emp(%s, %s, %s, %s, %s)", myparams)
# mydb.commit()

# queries results
# myresult = mycursor.fetchall()
# for row in myresult:
#   print(row)


# creating the interface
# root = Tk()
# root.geometry("600x300")
# root.title("Public Works Database")


# id = Label(root, text = 'Enter ID', font=('Arial', 18))
# id.place(x=20,y=30)

# root.mainloop()
# end of tkinter code


# mydb.close()