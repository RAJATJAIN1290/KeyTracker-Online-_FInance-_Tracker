

# An online finance tracker web application built using Servlet, JSP, and Hibernate to manage personal expenses. The app allows users to register, log in, and perform CRUD operations on their expenses.

#                                                     Features

   #               User Management:

        Register and log in functionality.
        Secure session management with logout.
   #              Expense Management:

        Add, view, update, and delete expenses.
        Project Structure
        Folders and Files

# 1. Servlet
    Contains the core logic for the application. Includes the following classes:

    DeleteExpense.java
    LoginServlet.java
    Logout.java
    Register.java
    SaveExpense.java
    UpdateExpense.java
    
# 2. Entity Package
    Defines the data models for the application:

    Expense.java
    User.java
# 3. DAO Package
    Handles database operations using Hibernate:

    ExpenseDAO.java
    UserDAO.java
# 4. DB Package
    Utility class for Hibernate configuration:

    HibernateUtil.java
# 5. Web App
    User Folder:

    add_expense.jsp
    edit_expense.jsp
    home.jsp
    view_expense.jsp
#                     Main file
    index.jsp
    login.jsp
    register.jsp
#         Prerequisites
    Java Development Kit (JDK) - Version 8 or later.
    Apache Tomcat Server - Version 9 or later.
    MySQL Database - For backend data storage.
    ![main1](https://github.com/user-attachments/assets/7bf20abf-a119-46a4-b444-5be22983670a)
![main2](https://github.com/user-attachments/assets/400f7efc-36df-44f0-8fe1-6a2b66db9989)
![main3](https://github.com/user-attachments/assets/e0b5a062-e2ee-40d2-8780-69ae9307fe48)
![main4](https://github.com/user-attachments/assets/69f8fa9f-03fb-4400-b844-55b807bd70a9)
Hibernate Framework - Version 5 or later.
#         ADDED EXTRA FUNCTIONALITY

  # This feature allows users to export their expense data to a CSV file, making it easy to download and view the data offline or import it into other applications like Excel.

      -> How It Works
      User Login: Upon logging in, the user's ID is retrieved from the session.
      Export Expenses: The user can click the "Export to CSV" button on the "Export Expenses" page. This triggers a request to the ExportCSVServlet, which fetches the user's expenses from the database.
      CSV File Generation: The servlet generates a CSV file containing the expense data, including:
      Expense Title
     
![add1](https://github.com/user-attachments/assets/9a00b6da-01a9-4490-bfa7-9c48fb1e37f3)

![add2](https://github.com/user-attachments/assets/0fae0b50-9dad-474b-83b4-ee2358223982)


# ER Diagram





![er](https://github.com/user-attachments/assets/784bcaec-6ead-4c33-9069-fead93ac6050)


