# E-Commerce Website (Flask + MySQL)

A full-stack e-commerce web application built using **Flask**, **MySQL**, and **Jinja2**, featuring complete product browsing, cart functionality, checkout system, order history, and an admin dashboard for product/category management.

---

## Features

### User Features

* User registration and login
* Browse all active products
* View product details
* Add items to cart
* Update quantities in cart
* Checkout (Orders + Order_Details created)
* View past orders
* Search products by name/description
* Category filters
* Price range filtering
* Pagination for product lists

### Admin Features

* Admin login
* Add, edit, delete products
* Manage categories
* Modify stock quantities
* View customer orders
* Update order status (Pending → Shipped → Delivered)
* Admin-only access control

---

## Tech Stack

* **Backend:** Flask (Python)
* **Database:** MySQL
* **Frontend:** HTML, CSS, Jinja2
* **Security:** bcrypt password hashing
* **Database Design:** Normalized relational schema

---

## How to Run the Project

### 1. Clone the Repository

```
git clone <repository_url>
cd EcommerceWebsite
```

### 2. Create & Activate Virtual Environment

```
python -m venv venv
venv/Scripts/activate     # Windows
source venv/bin/activate  # macOS/Linux
```

### 3. Install Dependencies

```
pip install -r requirements.txt
```

### 4. Configure the MySQL Database

Start MySQL and create a database:

```
CREATE DATABASE ecommerce_normalized;
```

Import your SQL schema file.

Update database credentials in `config.py`:

```
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'your_password',
    'database': 'ecommerce_normalized'
}
```

### 5. Run the Application

```
python app.py
```

### 6. Access in Browser

```
http://localhost:5000
```

---

## Project Structure

```
EcommerceWebsite/
│
├── app.py
├── config.py
├── requirements.txt
│
├── templates/
│   ├── home.html
│   ├── product_details.html
│   ├── cart.html
│   ├── orders.html
│   ├── login.html
│   ├── register.html
│   ├── admin_dashboard.html
│   ├── admin_orders.html
│   └── other templates...
│
├── static/
│   ├── css/
│   │   └── styles.css
│   ├── js/
│   └── images/
│
└── venv/
```

---

## Database Tables

* Customer
* Admin
* Product
* Category
* Cart
* Cart_Items
* Orders
* Order_Details

All tables follow a normalized schema and maintain proper foreign-key relationships.

---

## Summary

This project implements a complete e-commerce workflow including authentication, product catalog, cart logic, checkout, order management, and an admin dashboard. Built using open-source technologies, it is suitable for academic submissions, portfolios, and internship preparation.
