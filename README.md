# Data cleaning project (VBA)
## 🗺️ Context
I was provided with an Excel file containing client data. This file has two columns: the first column contains the client ID according to our database, and the second column contains the names of the clients, with their contact information listed below. Some clients have no contact information, so the row below their name contains the name of the next client. Other clients have between 1 and 4 rows of contact information below their name.

This is an example of how data was structured:

| Client IDs | Client Names and Contact Info |
|------------|-------------------------------|
| ID1        | Name1                         |
| ID2        | Name2                         |
|            | Contact2.1                    |
|            | Contact2.2                    |
|            | Contact2.3                    |
| ID3        | Name3                         |
|            | Contact3.1                    |
|            | Contact3.2                    |


## 🎯 Objectives
The main goal of the project is to separate column 2 so it only contains client names and create additional columns to store the contact information of those clients (one column per contact).

This is an example of how the data should look:

| Client IDs | Client Names | Contact Info 1 | Contact Info 2 | Contact Info 3 | Contact Info 4 |
|------------|--------------|----------------|----------------|----------------|----------------|
| ID1        | Name1        |                |                |                |                |
| ID2        | Name2        | Contact2.1     | Contact2.2     | Contact2.3     |                |
| ID3        | Name3        | Contact3.1     | Contact3.2     |                |                |


## ✅ Solution steps
I needed to write some code to:

- Iterate through each row in column 1 and check if the cell is empty.
- If the cell is empty, copy the value from column 2 in that same row.
- Paste that value to the right and above, the same number of times as the distance from the last non-empty row in column 1 to the current cell.
- After completing the above process, delete the rows with empty values in column 1.

The code to solve this project can be found [HERE](https://github.com/Pablojox/data-cleaning-vba/blob/main/data-cleaning-vba.bas)
