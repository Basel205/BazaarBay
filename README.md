E-Commerce Website (Flask + MySQL)

A full-stack e-commerce web application built using Flask, MySQL, and Jinja2, featuring customer authentication, product browsing, cart system, order management, and admin dashboard for product/category control.

Features
User Features

User registration and login

Browse all active products

Product details page

Add items to cart

Update quantity in cart

Checkout (creates order + order details)

View order history

Search by product name/description

Filter by category

Price-range filtering

Pagination for product listing

Admin Features

Admin login

Add, edit, delete products

Manage categories

Manage stock quantities

View customer orders

Update order status (Pending → Shipped → Delivered)

Admin-only session handling

Tech Stack

Backend: Flask (Python)
Database: MySQL
Frontend: HTML, CSS, Jinja2 Templates
Security: bcrypt password hashing
Architecture: Normalized relational database schema

How to Run the Project
1. Clone Repository
git clone <repository_url>
cd EcommerceWebsite

2. Create & Activate Virtual Environment
python -m venv venv
venv\Scripts\activate        # Windows
source venv/bin/activate     # Mac/Linux

3. Install Dependencies
pip install -r requirements.txt

4. Setup MySQL Database

Start MySQL server (XAMPP/MySQL Workbench/etc.)

Create a new database:

CREATE DATABASE ecommerce_normalized;


Import the provided .sql schema file

Update your credentials in config.py:

DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'your_password',
    'database': 'ecommerce_normalized'
}

5. Run the Application
python app.py

6. Access the Website
http://localhost:5000

Project Structure
EcommerceWebsite/
│
├── app.py                     # Main Flask application
├── config.py                  # Database configuration
├── requirements.txt           # Project dependencies
│
├── templates/                 # Frontend pages
│   ├── home.html
│   ├── product_details.html
│   ├── cart.html
│   ├── orders.html
│   ├── login.html
│   ├── register.html
│   ├── admin_dashboard.html
│   ├── admin_orders.html
│   └── other admin/user pages
│
├── static/
│   ├── css/styles.css         # Custom CSS
│   ├── js/                    # Optional JS
│   └── images/                # Product images
│
└── venv/                      # Virtual environment

Database Overview

Key tables:

Customer

Admin

Product

Category

Cart

Cart_Items

Orders

Order_Details

The schema is fully normalized with foreign-key relationships linking customers, products, carts, and orders.


Summary

This project demonstrates a complete e-commerce workflow with clean routing, relational data modeling, authentication logic, shopping cart functionality, and a full admin panel. Built entirely with open-source technologies, it is ideal for academic, portfolio, or internship use.