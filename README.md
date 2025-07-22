


# 📚 Library Management System using SQL

A complete, SQL-based **Library Management System** designed to simulate real-world operations in a library — such as tracking books, issuing and returning, managing members, and monitoring availability. Ideal for students, database learners, and backend developers looking to practice relational database design and querying.

---

## 🎯 What This Project Will Do

This project will help you:

* ✅ Create a structured relational database from scratch
* ✅ Perform **CRUD operations** on books and members
* ✅ **Issue and return books**, track due dates
* ✅ Calculate fines for late returns (optional)
* ✅ Build analytical queries like available books, active members, etc.
* ✅ Understand how normalized databases work in real systems
* ✅ Prepare for SQL interviews using realistic datasets and operations

---

## 📌 Key Features

### 📘 Book Management

* Add new books with details (title, author, category, total & available copies)
* Update book information
* Delete books
* View/search books by title, author, or category

### 👥 Member Management

* Add new library members (name, contact info)
* Update or delete member records
* View all active members

### 🔄 Book Issue & Return

* Record book issues (who took what and when)
* Track return dates
* Update availability of books after issue/return

### 🕒 Due Date & Fine System (Optional)

* Store due dates when issuing books
* Record actual return dates
* Calculate fine if book is returned late

### 📊 Reports & Queries

* Total books, issued books, available books
* Most issued books
* Members with pending returns
* Late submissions and fines

---

## 🗂️ Database Schema Overview

| Table Name      | Description                                  |
| --------------- | -------------------------------------------- |
| `Books`         | Stores all book details and available copies |
| `Members`       | Registered users of the library              |
| `Issued_Books`  | Tracks book issue date and due date          |
| `Returns`       | Tracks when the book was returned            |
| `Fines` *(opt)* | Holds fine details based on return delays    |

---

## 🚀 Step-by-Step Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/library-management-sql.git
   cd library-management-sql
   ```

2. **Set Up Your Database**

   * Use **MySQL**, **PostgreSQL**, or **SQLite** (based on preference)
   * Create a new database (e.g., `library_db`)
   * Import `library_schema.sql` into your DB to create all tables

3. **Insert Demo Records**

   * Run `sample_data.sql` to add demo books and members

4. **Run Core Operations**

   * Use `operations.sql` to test issuing books, returning, checking availability, etc.

5. **(Optional) Fine System**

   * Use `fines.sql` (if available) to handle fine tracking on late returns

---

## 💻 Example SQL Operations

```sql
-- Add a new book
INSERT INTO Books (title, author, category, total_copies, available_copies)
VALUES ('Atomic Habits', 'James Clear', 'Self-help', 5, 5);

-- Issue a book
INSERT INTO Issued_Books (book_id, member_id, issue_date, due_date)
VALUES (101, 1, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY));

-- Return a book
INSERT INTO Returns (book_id, member_id, return_date)
VALUES (101, 1, CURRENT_DATE);

-- Update availability after return
UPDATE Books SET available_copies = available_copies + 1 WHERE book_id = 101;
```

---

## 🧩 Use Cases

* 📚 **Academic DBMS Projects**
* 🧠 **SQL Interview Preparation**
* 🛠 **Back-end System for Full-Stack Apps**
* 🎓 **Database Design Practice**

---

## 📁 Folder Structure

```
├── library_schema.sql     # Database schema (CREATE TABLE statements)
├── sample_data.sql        # Sample data for testing
├── operations.sql         # Example SQL queries (issue/return/search)
├── fines.sql              # (Optional) Fine calculation logic
└── README.md              # Project documentation
```

---


