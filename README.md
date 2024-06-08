# QuickNotes - A Note-Taking Application

![Screenshot 2024-06-08 212204](https://github.com/vishalgit1810/QuickNotes/assets/130865513/d794382b-648d-42ba-8974-17660c656b1f)
![Screenshot 2024-06-08 212204](https://github.com/vishalgit1810/QuickNotes/assets/130865513/7a9ee52f-d62e-4041-b070-2457fa97631d)

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Tech Stack](#tech-stack)
4. [Installation](#installation)
5. [Usage](#usage)
6. [Screenshots](#screenshots)
7. [Contributing](#contributing)
8. [License](#license)
9. [Contact](#contact)

## Introduction

**QuickNotes** is a simple and user-friendly note-taking application built as a final year project. The application allows users to sign up, sign in, and manage their notes with ease. An admin feature is also included to oversee and manage user details. QuickNotes is designed to be efficient and intuitive, providing a seamless experience for managing personal notes.

## Features

- **User Authentication**: Users can sign up and log in to access their personal dashboard.
- **CRUD Operations on Notes**:
  - **Create**: Add new notes.
  - **Read**: View all existing notes.
  - **Update**: Edit existing notes.
  - **Delete**: Remove unwanted notes.
- **User Management**: Users can update their profile details.
- **Admin Dashboard**:
  - Manage user accounts.
  - View and edit all user details.
- **Responsive Design**: Built with Bootstrap for a responsive and attractive user interface.

## Tech Stack

- **Frontend**: HTML, CSS, Bootstrap
- **Backend**: Java, JSP, Servlet
- **Database**: MySQL
- **ORM**: Hibernate

### Prerequisites

Ensure you have the following installed:
- JDK 8 or higher
- MySQL
- Apache Tomcat
- Git

## Installation

To set up the QuickNotes application locally, follow these steps:

### 1. Clone the Repository:
   ```bash
   git clone https://github.com/yourusername/quicknotes.git
   cd quicknotes
```
### 2. Setup MySQL Database

1. **Create a new MySQL database** named `quicknotes_db`.

### 3. Configure Database Connection

1. Open `hibernate.cfg.xml` and update the database connection details:

   ```xml
   <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/quicknotes</property>
   <property name="hibernate.connection.username">your-username</property>
   <property name="hibernate.connection.password">your-password</property>


### 4. Build and Deploy the Application:

- Open the project in your preferred IDE (Eclipse, IntelliJ IDEA, etc.).
- Build the project to resolve all dependencies.
- Deploy the application on a servlet container like Apache Tomcat.
  - For Eclipse, you can right-click the project > Run As > Run on Server.

### 5. Usage
#### Access the Application
- Open your web browser and navigate to http://localhost:8080/QuickNotes.
#### Sign Up
- Click on the sign-up link and create a new account.
#### Add and Manage Notes
- After logging in, you can start adding notes.
- Use the dashboard to view, edit, or delete your notes.
#### Admin Access
- Log in with admin credentials to manage user accounts and their details.
## Screenshots

#### Login Page


#### User Dashboard


#### Note Management Interface

## Contributing
Contributions are welcome! To contribute to the project, follow these steps:

- Fork the repository.
- Create a feature branch (git checkout -b feature/YourFeature).
- Commit your changes (git commit -m 'Add some feature').
- Push to the branch (git push origin feature/YourFeature).
- Open a pull request.


## Contact
If you have any questions or need further assistance, feel free to contact:

- Your Name
- Email: [vishalrathore8008@gmail.com](vishalrathore8008@gmail.com)
- GitHub: [github.com/vishalgit1810](github.com/vishalgit1810)
