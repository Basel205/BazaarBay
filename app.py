# app.py
from flask import Flask, render_template, request, redirect, url_for, session, flash
import mysql.connector
from config import DB_CONFIG
from flask_bcrypt import Bcrypt

app = Flask(__name__)
app.secret_key = 'your_secret_key'
bcrypt = Bcrypt(app)


# ---------------- Admin Login ----------------
@app.route('/admin/login', methods=['GET', 'POST'])
def admin_login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Admin WHERE Email=%s", (email,))
        admin = cursor.fetchone()
        cursor.close()
        conn.close()

        if admin:
            session['admin_id'] = admin['Admin_ID']
            session['admin_name'] = admin['Name']
            flash("Admin login successful!", "success")
            return redirect(url_for('admin_dashboard'))
        else:
            flash("Invalid credentials", "danger")
            return redirect(url_for('admin_login'))
    return render_template('admin_login.html')

# ---------------- Admin Logout ----------------
@app.route('/admin/logout')
def admin_logout():
    session.pop('admin_id', None)
    session.pop('admin_name', None)
    flash("Admin logged out", "success")
    return redirect(url_for('home'))

# ---------------- Admin Dashboard ----------------
@app.route('/admin')
def admin_dashboard():
    if 'admin_id' not in session:
        flash("Please login as admin first.", "warning")
        return redirect(url_for('admin_login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Product")
    products = cursor.fetchall()
    cursor.execute("SELECT * FROM Category")
    categories = cursor.fetchall()
    cursor.close()
    conn.close()

    return render_template('admin_dashboard.html', products=products, categories=categories)

@app.route('/admin/product/add', methods=['GET','POST'])
def add_product():
    if 'admin_id' not in session:
        flash("Admin login required", "warning")
        return redirect(url_for('admin_login'))

    if request.method == 'POST':
        name = request.form['name']
        description = request.form['description']
        price = request.form['price']
        stock = request.form['stock']
        category_id = request.form['category_id']
        sku = request.form['sku']

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO Product (Name, Description, Price, Stock_Quantity, Category_ID, SKU)
            VALUES (%s,%s,%s,%s,%s,%s)
        """, (name, description, price, stock, category_id, sku))
        conn.commit()
        cursor.close()
        conn.close()
        flash("Product added successfully", "success")
        return redirect(url_for('admin_dashboard'))

    # GET request - show add form
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Category")
    categories = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('admin_add_product.html', categories=categories)

@app.route('/admin/product/edit/<int:product_id>', methods=['GET','POST'])
def edit_product(product_id):
    if 'admin_id' not in session:
        flash("Admin login required", "warning")
        return redirect(url_for('admin_login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    if request.method == 'POST':
        name = request.form['name']
        description = request.form['description']
        price = request.form['price']
        stock = request.form['stock']
        category_id = request.form['category_id']
        sku = request.form['sku']

        cursor.execute("""
            UPDATE Product SET Name=%s, Description=%s, Price=%s, Stock_Quantity=%s,
            Category_ID=%s, SKU=%s WHERE Product_ID=%s
        """, (name, description, price, stock, category_id, sku, product_id))
        conn.commit()
        flash("Product updated successfully", "success")
        return redirect(url_for('admin_dashboard'))

    cursor.execute("SELECT * FROM Product WHERE Product_ID=%s", (product_id,))
    product = cursor.fetchone()
    cursor.execute("SELECT * FROM Category")
    categories = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('admin_edit_product.html', product=product, categories=categories)

# ---------------- Delete Product ----------------
@app.route('/admin/product/delete/<int:product_id>')
def delete_product(product_id):
    if 'admin_id' not in session:
        flash("Admin login required", "warning")
        return redirect(url_for('admin_login'))

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Product WHERE Product_ID=%s", (product_id,))
    conn.commit()
    cursor.close()
    conn.close()
    flash("Product deleted successfully", "success")
    return redirect(url_for('admin_dashboard'))

@app.route('/admin/category/add', methods=['GET','POST'])
def add_category():
    if 'admin_id' not in session:
        flash("Admin login required", "warning")
        return redirect(url_for('admin_login'))

    if request.method == 'POST':
        name = request.form['name']
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Category (Name) VALUES (%s)", (name,))
        conn.commit()
        cursor.close()
        conn.close()
        flash("Category added successfully", "success")
        return redirect(url_for('admin_dashboard'))
    return render_template('admin_add_category.html')

@app.route('/admin/category/edit/<int:category_id>', methods=['GET','POST'])
def edit_category(category_id):
    if 'admin_id' not in session:
        flash("Admin login required", "warning")
        return redirect(url_for('admin_login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    if request.method == 'POST':
        name = request.form['name']
        cursor.execute("UPDATE Category SET Name=%s WHERE Category_ID=%s", (name, category_id))
        conn.commit()
        cursor.close()
        conn.close()
        flash("Category updated successfully", "success")
        return redirect(url_for('admin_dashboard'))

    cursor.execute("SELECT * FROM Category WHERE Category_ID=%s", (category_id,))
    category = cursor.fetchone()
    cursor.close()
    conn.close()
    return render_template('admin_edit_category.html', category=category)

@app.route('/admin/category/delete/<int:category_id>')
def delete_category(category_id):
    if 'admin_id' not in session:
        flash("Admin login required", "warning")
        return redirect(url_for('admin_login'))

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Category WHERE Category_ID=%s", (category_id,))
    conn.commit()
    cursor.close()
    conn.close()
    flash("Category deleted successfully", "success")
    return redirect(url_for('admin_dashboard'))

@app.route('/admin/orders')
def admin_orders():
    if 'admin_id' not in session:
        flash("Admin login required", "warning")
        return redirect(url_for('admin_login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT o.Order_ID, o.Customer_ID, o.Total_Amount, o.Status, o.Created_At,
               c.Name AS Customer_Name
        FROM Orders o
        JOIN Customer c ON o.Customer_ID = c.Customer_ID
        ORDER BY o.Created_At DESC
    """)
    orders = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('admin_orders.html', orders=orders)

@app.route('/admin/order/update/<int:order_id>', methods=['POST'])
def update_order_status(order_id):
    if 'admin_id' not in session:
        flash("Admin login required", "warning")
        return redirect(url_for('admin_login'))

    status = request.form['status']  # e.g., "Shipped", "Delivered"
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE Orders SET Status=%s WHERE Order_ID=%s", (status, order_id))
    conn.commit()
    cursor.close()
    conn.close()
    flash("Order status updated", "success")
    return redirect(url_for('admin_orders'))




# ---------------- Database Connection ----------------
def get_db_connection():
    conn = mysql.connector.connect(
        host=DB_CONFIG['host'],
        user=DB_CONFIG['user'],
        password=DB_CONFIG['password'],
        database=DB_CONFIG['database']
    )
    return conn

# ---------------- Home Page ----------------
@app.route('/')
def home():
    search_query = request.args.get('q', '')
    category_id = request.args.get('category', '')
    min_price = request.args.get('min_price', '')
    max_price = request.args.get('max_price', '')
    page = int(request.args.get('page', 1))
    per_page = 12  # products per page

    sql = "SELECT * FROM Product WHERE Status='active'"
    params = []

    if search_query:
        sql += " AND (Name LIKE %s OR Description LIKE %s)"
        like_query = '%' + search_query + '%'
        params.extend([like_query, like_query])

    if category_id:
        sql += " AND Category_ID=%s"
        params.append(category_id)

    if min_price:
        sql += " AND Price >= %s"
        params.append(min_price)

    if max_price:
        sql += " AND Price <= %s"
        params.append(max_price)

    # Pagination
    offset = (page - 1) * per_page
    sql_paginated = sql + " LIMIT %s OFFSET %s"
    params.extend([per_page, offset])

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(sql_paginated, params)
    products = cursor.fetchall()

    # Get total count for pagination
    cursor.execute("SELECT COUNT(*) as count FROM Product WHERE Status='active'")
    total_products = cursor.fetchone()['count']
    total_pages = (total_products + per_page - 1) // per_page

    # Fetch categories for filter dropdown
    cursor.execute("SELECT * FROM Category")
    categories = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('home.html', products=products, categories=categories,
                           search_query=search_query, category_id=category_id,
                           min_price=min_price, max_price=max_price,
                           page=page, total_pages=total_pages)



# ---------------- Product Details + Reviews ----------------
@app.route('/product/<int:product_id>', methods=['GET', 'POST'])
def product_details(product_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Handle Review Submission
    if request.method == 'POST':
        if 'user_id' not in session:
            flash("Please log in to submit a review.", "warning")
            return redirect(url_for('login'))
        
        rating = int(request.form['rating'])
        comment = request.form['comment']
        customer_id = session['user_id']

        # Insert review
        cursor.execute("""
            INSERT INTO Review (Customer_ID, Product_ID, Rating, Comment)
            VALUES (%s, %s, %s, %s)
        """, (customer_id, product_id, rating, comment))
        conn.commit()
        flash("Review submitted successfully!", "success")
        return redirect(url_for('product_details', product_id=product_id))

    # Fetch product info
    cursor.execute("SELECT * FROM Product WHERE Product_ID=%s", (product_id,))
    product = cursor.fetchone()

    # Fetch reviews
    cursor.execute("""
        SELECT r.*, c.Name AS Customer_Name 
        FROM Review r 
        JOIN Customer c ON r.Customer_ID = c.Customer_ID
        WHERE r.Product_ID=%s
        ORDER BY r.Review_Date DESC
    """, (product_id,))
    reviews = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('product_details.html', product=product, reviews=reviews)


# ---------------- Register ----------------
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        mob_no = request.form['mob_no']
        password = bcrypt.generate_password_hash(request.form['password']).decode('utf-8')

        conn = get_db_connection()
        cursor = conn.cursor()
        try:
            cursor.execute("INSERT INTO Customer (Name, Email, Mob_No, Password_Hash) VALUES (%s, %s, %s, %s)",
                           (name, email, mob_no, password))
            conn.commit()
            flash("Registration successful. Please login.", "success")
            return redirect(url_for('login'))
        except mysql.connector.IntegrityError:
            flash("Email or Mobile number already exists.", "danger")
            return redirect(url_for('register'))
        finally:
            cursor.close()
            conn.close()
    return render_template('register.html')

# ---------------- Login ----------------
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Customer WHERE Email=%s", (email,))
        user = cursor.fetchone()
        cursor.close()
        conn.close()

        if user and bcrypt.check_password_hash(user['Password_Hash'], password):
            session['user_id'] = user['Customer_ID']
            session['user_name'] = user['Name']
            flash("Login successful!", "success")
            return redirect(url_for('home'))
        else:
            flash("Invalid credentials", "danger")
            return redirect(url_for('login'))
    return render_template('login.html')

# ---------------- Logout ----------------
@app.route('/logout')
def logout():
    session.clear()
    flash("Logged out successfully", "success")
    return redirect(url_for('home'))

# ---------------- Cart ----------------
@app.route('/cart')
def cart():
    if 'user_id' not in session:
        flash("Please login first.", "warning")
        return redirect(url_for('login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Fetch user's cart and items
    cursor.execute("""
        SELECT ci.Cart_Item_ID, ci.Quantity, p.Name AS Product_Name, p.Price AS Unit_Price, (ci.Quantity*p.Price) AS Subtotal
        FROM Cart_Items ci
        JOIN Cart c ON ci.Cart_ID = c.Cart_ID
        JOIN Product p ON ci.Product_ID = p.Product_ID
        WHERE c.Customer_ID=%s
    """, (session['user_id'],))
    cart_items = cursor.fetchall()

    total_amount = sum(item['Subtotal'] for item in cart_items) if cart_items else 0

    cursor.close()
    conn.close()
    return render_template('cart.html', cart_items=cart_items, total_amount=total_amount)

# ---------------- Add to Cart ----------------
@app.route('/add_to_cart/<int:product_id>', methods=['POST'])
def add_to_cart(product_id):
    if 'user_id' not in session:
        flash("Please login first.", "warning")
        return redirect(url_for('login'))

    quantity = int(request.form.get('quantity', 1))

    conn = get_db_connection()
    cursor = conn.cursor()

    # Check available stock
    cursor.execute("SELECT Stock_Quantity FROM Product WHERE Product_ID=%s", (product_id,))
    stock = cursor.fetchone()[0]
    if quantity > stock:
        flash(f"Only {stock} item(s) available in stock.", "warning")
        cursor.close()
        conn.close()
        return redirect(url_for('cart'))

    # Get Cart ID for user
    cursor.execute("SELECT Cart_ID FROM Cart WHERE Customer_ID=%s", (session['user_id'],))
    cart = cursor.fetchone()

    if cart:
        cart_id = cart[0]
    else:
        cursor.execute("INSERT INTO Cart (Customer_ID) VALUES (%s)", (session['user_id'],))
        conn.commit()
        cart_id = cursor.lastrowid

    # Add or update item
    cursor.execute("SELECT Quantity FROM Cart_Items WHERE Cart_ID=%s AND Product_ID=%s", (cart_id, product_id))
    existing = cursor.fetchone()
    if existing:
        new_quantity = existing[0] + quantity
        if new_quantity > stock:
            flash(f"Cannot add more than {stock} item(s) for this product.", "warning")
            cursor.close()
            conn.close()
            return redirect(url_for('cart'))
        cursor.execute("UPDATE Cart_Items SET Quantity=%s WHERE Cart_ID=%s AND Product_ID=%s",
                       (new_quantity, cart_id, product_id))
    else:
        cursor.execute("INSERT INTO Cart_Items (Cart_ID, Product_ID, Quantity) VALUES (%s, %s, %s)",
                       (cart_id, product_id, quantity))

    conn.commit()
    cursor.close()
    conn.close()
    flash("Product added to cart", "success")
    return redirect(url_for('cart'))


# ---------------- Checkout ----------------
@app.route('/checkout', methods=['GET', 'POST'])
def checkout():
    if 'user_id' not in session:
        flash("Please log in to continue.", "warning")
        return redirect(url_for('login'))

    user_id = session['user_id']
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    if request.method == 'GET':
        # Fetch all addresses for user
        cursor.execute("SELECT * FROM Address WHERE Customer_ID = %s", (user_id,))
        addresses = cursor.fetchall()

        # Fetch items from cart
        cursor.execute("""
            SELECT c.Cart_ID, ci.Cart_Item_ID, ci.Product_ID, p.Name AS Product_Name, p.Price, ci.Quantity
            FROM Cart c
            JOIN Cart_Items ci ON c.Cart_ID = ci.Cart_ID
            JOIN Product p ON ci.Product_ID = p.Product_ID
            WHERE c.Customer_ID = %s
        """, (user_id,))
        cart_items = cursor.fetchall()

        cursor.close()
        conn.close()

        if not cart_items:
            flash("Your cart is empty. Add items before checkout.", "danger")
            return redirect(url_for('cart'))

        return render_template('checkout.html', addresses=addresses, cart_items=cart_items)

    # POST request → Place order
    if request.method == 'POST':
        selected_address = request.form.get('address_id')

        if not selected_address:
            flash("Please select a delivery address.", "danger")
            cursor.close()
            conn.close()
            return redirect(url_for('checkout'))

        # Fetch cart items again
        cursor.execute("""
            SELECT ci.Product_ID, ci.Quantity, p.Price
            FROM Cart_Items ci
            JOIN Cart c ON ci.Cart_ID = c.Cart_ID
            JOIN Product p ON ci.Product_ID = p.Product_ID
            WHERE c.Customer_ID = %s
        """, (user_id,))
        cart_items = cursor.fetchall()

        if not cart_items:
            flash("Your cart is empty.", "danger")
            cursor.close()
            conn.close()
            return redirect(url_for('cart'))

        # Create new order
        total_amount = sum(item['Quantity'] * item['Price'] for item in cart_items)
        cursor.execute("""
            INSERT INTO Orders (Customer_ID, Shipping_Address_ID, Total_Amount, Order_Date, Status)
            VALUES (%s, %s, %s, NOW(), 'pending')
        """, (user_id, selected_address, total_amount))
        order_id = cursor.lastrowid

        # Insert order details and update inventory
        for item in cart_items:
            cursor.execute("""
                INSERT INTO Order_Details (Order_ID, Product_ID, Quantity, Unit_Price, Subtotal)
                VALUES (%s, %s, %s, %s, %s)
            """, (
                order_id,
                item['Product_ID'],
                item['Quantity'],
                item['Price'],
                item['Quantity'] * item['Price']
            ))

            cursor.execute("""
                UPDATE Product
                SET Stock_Quantity = Stock_Quantity - %s
                WHERE Product_ID = %s
            """, (item['Quantity'], item['Product_ID']))

        # Clear user's cart
        cursor.execute("""
            DELETE ci FROM Cart_Items ci
            JOIN Cart c ON ci.Cart_ID = c.Cart_ID
            WHERE c.Customer_ID = %s
        """, (user_id,))

        conn.commit()
        cursor.close()
        conn.close()

        flash("Order placed successfully!", "success")
        return redirect(url_for('orders'))






# ---------------- Orders ----------------
@app.route('/orders')
def orders():
    if 'user_id' not in session:
        flash("Please login first.", "warning")
        return redirect(url_for('login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT o.Order_ID, od.Order_Detail_ID, p.Name AS Product_Name, od.Quantity, od.Unit_Price, od.Subtotal,
               o.Total_Amount, o.Status, o.Created_At
        FROM Orders o
        JOIN Order_Details od ON o.Order_ID = od.Order_ID
        JOIN Product p ON od.Product_ID = p.Product_ID
        WHERE o.Customer_ID = %s
        ORDER BY o.Created_At DESC, o.Order_ID, od.Order_Detail_ID
    """, (session['user_id'],))
    order_items = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('orders.html', order_items=order_items)

# ---------------- Address Management ----------------
@app.route('/address', methods=['GET', 'POST'])
def manage_address():
    if 'user_id' not in session:
        flash("Please login first.", "warning")
        return redirect(url_for('login'))

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    if request.method == 'POST':
        street = request.form['street']
        city = request.form['city']
        state = request.form['state']
        postal = request.form['postal']
        country = request.form['country']
        addr_type = request.form['type']
        is_default = 'is_default' in request.form

        if is_default:
            cursor.execute("UPDATE Address SET Is_Default=FALSE WHERE Customer_ID=%s", (session['user_id'],))

        cursor.execute("""
            INSERT INTO Address (Customer_ID, Street, City, State, Postal_Code, Country, Type, Is_Default, created_at)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s,NOW())
        """, (session['user_id'], street, city, state, postal, country, addr_type, is_default))
        conn.commit()
        flash("Address added successfully.", "success")

    cursor.execute("SELECT * FROM Address WHERE Customer_ID=%s", (session['user_id'],))
    addresses = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('address.html', addresses=addresses)


# ---------------- Run App ----------------
if __name__ == '__main__':
    app.run(debug=True)
