-- creating a database
create database librarydb;

-- using the database
use librarydb;

-- creating the publisher table
create table publisher(
            publisher_PublisherName varchar(250) primary key,
            publisher_PublisherAddress varchar(250),
            publisher_PublisherPhone varchar(50)
);

-- checking the table after importing
select * from publisher;


-- creating the books table
create table books(
			book_BookID int auto_increment primary key,
            book_Title varchar(200),
            book_PublisherName varchar(200),
            foreign key (book_PublisherName) references  publisher( publisher_PublisherName) on delete cascade on update cascade
);

-- checking the table after importing
select * from books;


-- creating the book author table
create table author(
			book_authors_BookID int,
			book_author_AuthorID int auto_increment primary key,
            book_authors_AuthorName varchar(250),
            foreign key (book_authors_BookID ) references books(book_BookID) on delete cascade on update cascade
);

-- checking the table after importing
select * from author;

-- creating the book copies
create table book_copies(
			book_copies_BookID int,
			book_copies_copiesID int auto_increment primary key,
            book_copies_BranchID int,
            book_copies_No_Of_Copies int,
            foreign key (book_copies_BookID) references books(book_BookID) on delete cascade on update cascade,
            foreign key (book_copies_BranchID) references libarary_branch(library_branch_branchID) on delete cascade on update cascade
);
   
-- checking the table after importing
select * from book_copies;

-- creating the borrower
create table borrower(
            borrower_CardNo int auto_increment primary key,
            borrower_BorrowerName varchar(200),
            borrower_BorrowerAddress varchar(200),
            borrower_BorrowerPhone varchar(200)
);

-- checking the table after importing
select * from borrower;

-- creating the book_loans
create table book_loans(
			book_loans_BookID int,
			book_loan_loansID int auto_increment primary key,
            book_loans_BranchID int,
            book_loans_CardNo int,
            book_loans_DateOut date,
            book_loans_DueDate date,
            foreign key (book_loans_BookID) references books(book_BookID) on delete cascade on update cascade,
            foreign key ( book_loans_BranchID) references libarary_branch(library_branch_branchID) on delete cascade on update cascade,
            foreign key ( book_loans_CardNo) references borrower(borrower_CardNo) on delete cascade on update cascade
);

-- checking the table after importing
select * from book_loans;

-- creating the libarary_branch
create table libarary_branch(
			library_branch_branchID int auto_increment primary key,
			library_branch_BranchName varchar(200),
            library_branch_BranchAddress varchar(200)
);


-- checking the table after importing
select * from libarary_branch;


-- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
select book_copies_No_Of_Copies 
from book_copies 
inner join books on book_copies_BookID = book_BookID 
inner join libarary_branch on book_copies_BranchID = library_branch_branchID 
where book_Title= 'The Lost Tribe' and library_branch_BranchName = 'Sharpstown';


-- How many copies of the book titled "The Lost Tribe" are owned by each library branch?
select library_branch_branchID,book_copies_No_Of_Copies
from book_copies 
inner join books on book_copies_BookID = book_BookID 
inner join libarary_branch on book_copies_BranchID = library_branch_branchID 
where book_Title= 'The Lost Tribe';


-- Retrieve the names of all borrowers who do not have any books checked out.
select borrower_BorrowerName 
from borrower 
left join book_loans on borrower_CardNo = book_loans_CardNo
where book_loan_loansID is null;


-- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address.
select book_Title,borrower_BorrowerName,borrower_BorrowerAddress
from  books
inner join book_loans on book_BookID = book_loans_BookID
left join borrower on book_loans_CardNo = borrower_CardNo
inner join libarary_branch on book_loans_BranchID = library_branch_branchID
where library_branch_BranchName = 'Sharpstown' and  book_loans_DueDate = '2018-02-03';


-- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
select library_branch_BranchName,count(book_loan_loansID)
from libarary_branch 
left join book_loans on book_loans_BranchID = library_branch_branchID
group by library_branch_BranchName;


-- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
select borrower_BorrowerName,borrower_BorrowerAddress,count(book_loans_BookID)
from borrower
left join book_loans on borrower_CardNo = book_loans_CardNo 
group by borrower_CardNo,borrower_BorrowerName,borrower_BorrowerAddress
having count(book_loans_BookID) > 5;


-- For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
select book_Title,book_copies_No_Of_Copies
from books
inner join book_copies on book_BookID = book_copies_BookID
inner join libarary_branch on book_copies_BranchID = library_branch_branchID
inner join author on book_authors_BookID = book_BookID
where book_authors_AuthorName = 'stephen king' and library_branch_BranchName = 'central';



