# Survey App

A web-based application for creating, sharing, and collecting surveys. Built with **Java EE**, **JSP**, and **Servlets**, this app allows users to design surveys, distribute them via link, code, or make them public, and gather responses in real time.

---

## Features

* **Survey Creation** – Users can create custom surveys with multiple questions and types.
* **Data Collection** – Collect responses from participants efficiently.
* **Public & Private Surveys** – Make surveys public or restrict access to selected users.
* **Sharing Options** – Share surveys via unique code, link, or set them as public for broader access.
* **Data Access** – Users can view and analyze survey responses easily.

---

## Tech Stack

* **Backend:** Java EE, Servlets
* **Frontend:** JSP, HTML, CSS, JavaScript
* **Database:** MySQL (or any JDBC-compatible database)
* **Server:** Apache Tomcat

---

## Project Structure

```
survey-app/
├─ src/                  # Java source files (Servlets, models, utils)
├─ WebContent/           # JSP pages, CSS, JS, images
├─ WEB-INF/              # web.xml and configuration
├─ database/             # SQL scripts for tables
└─ README.md
```

---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yanmyoaung2004/survey.git
cd survey-app
```

2. Set up the database:

* Create a MySQL database (e.g., `survey_db`)
* Run the provided SQL script in `database/` to create tables

3. Update database connection in `DBConnection.java` or configuration file with your credentials.

4. Build and deploy the project:

* Use **Apache Tomcat** as your servlet container
* Deploy the project WAR or use an IDE like **Eclipse / IntelliJ IDEA** for direct deployment

5. Access the app:

```
http://localhost:8080/survey-app
```

---

## Usage

1. Register or log in to the system.
2. Create a new survey with desired questions.
3. Choose sharing options: code, link, or make it public.
4. Participants can submit responses through the provided access method.
5. View and analyze collected data through the user dashboard.

---

## Security Highlights

* Role-based access to surveys (creator vs participant)
* Input validation for forms to prevent invalid submissions
* Option to make surveys private or public for controlled sharing

---

## Future Enhancements

* Export survey results (CSV/Excel/PDF)
* Advanced analytics and charts
* Email notifications for survey sharing
* Multi-language support

---

## License

MIT License

---
