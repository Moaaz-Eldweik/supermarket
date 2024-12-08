from flask import Flask, render_template, request, redirect, url_for, jsonify

app = Flask(__name__)

users = {"admin": "password"} 
products = []  
low_stock_threshold = 5  

@app.route("/", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        if username in users and users[username] == password:
            return redirect(url_for("dashboard"))
        else:
            return render_template("index.html", error="Incorrect username or password")
    return render_template("index.html")

@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        confirm_password = request.form.get("confirm_password")

        if password != confirm_password:
            return render_template("register.html", error="Passwords do not match")
        if username in users:
            return render_template("register.html", error="Username already exists")

        users[username] = password
        return redirect(url_for("login"))

    return render_template("register.html")

@app.route("/dashboard")
def dashboard():
    return render_template("dashboard.html", products=products, low_stock_threshold=low_stock_threshold)

@app.route("/add_product", methods=["POST"])
def add_product():
    product_name = request.form.get("product_name")
    quantity = int(request.form.get("quantity"))

    for product in products:
        if product["name"] == product_name:
            product["quantity"] += quantity
            break
    else:
        products.append({"name": product_name, "quantity": quantity})
    return redirect(url_for("dashboard"))

@app.route("/delete_product/<product_name>", methods=["POST"])
def delete_product(product_name):
    global products
    products = [product for product in products if product["name"] != product_name]
    return redirect(url_for("dashboard"))

@app.route("/print_invoice", methods=["POST"])
def print_invoice():
    return render_template("invoice.html", products=products)

if __name__ == "__main__":
    app.run(debug=True)