## Dataset Description

This project uses the **Olist Brazilian E-commerce Public Dataset**, a real-world dataset that contains transactional data from a multi-vendor e-commerce platform in Brazil.

The dataset includes information on orders, customers, payments, products, and reviews, enabling end-to-end analysis of the e-commerce funnel.

This dataset simulates a real-world e-commerce data warehouse with normalized relational tables, similar to production analytics environments.

### Data Source

* Source: Kaggle (public dataset)
* Link: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
* Provider: Olist (Brazilian e-commerce marketplace)
* Time Period: 2016–2018


### Data Volume

* ~100k orders
* ~300k order items
* Multiple related tables joined using primary and foreign keys

## Dataset Overview

First we started exploring the data set and tried to understand the each field’s which will be help us in the analysis: It has the below table which has the following fields:

### 1. Orders Table (orders)
Stores core transaction-level data for each order. Tracks the full lifecycle of an order from purchase to delivery.

**Key Columns:**
- order_id (Primary Key)
- customer_id (Foreign Key → customers)
- order_status
- order_purchase_timestamp
- order_approved_at
- order_delivered_carrier_date
- order_delivered_customer_date
- order_estimated_delivery_date

---

### 2. Customers Table (customers)
Contains customer identity and location information. Stores user-level demographic and contact data.

**Key Columns:**
- customer_id (Primary Key)(One customer per order Instance)
- customer_unique_id (Real Customer IDs)
- customer_name / FirstName / LastName
- email
- phone_number
- address
- customer_city
- customer_state
- customer_zip_code_prefix

---

### 3. Order Payments (order_payments)
Contains payment-level details per order. Tracks how each order was paid (instalments, method, sequence).

**Key Columns:**
- order_id (Foreign Key → orders)
- payment_type
- payment_installments
- payment_sequential

---

### 4. Order Reviews (order_reviews)
Captures customer feedback after order completion. Measures customer satisfaction and experience.

**Key Columns:**
- review_id (Primary Key)
- order_id (Foreign Key → orders)
- review_score
- review_comment_title
- review_comment_message
- review_creation_date
- review_answer_timestamp

---

### 5. Order Items (order_items)
Represents item-level details within each order. Breaks down each order into individual products.

**Key Columns:**
- order_id (Foreign Key → orders)
- order_item_id
- product_id (Foreign Key → products)
- seller_id (Foreign Key → sellers)
- price
- freight_value (Shipping and logistic fee)
- shipping_limit_date

---

### 6. Products (products)
Contains product catalog information. Stores product-level attributes and metadata.

**Key Columns:**
- product_id (Primary Key)
- product_name
- category
- price
- rating
- stock_quantity
- supplier
- product_width_cm

---

### 7. Geolocation (geolocation)
Stores geographical mapping data. Enables location-based analysis (delivery, customer distribution).

**Key Columns:**
- geolocation_city
- geolocation_state
- geolocation_lat
- geolocation_lng

---

### 8. Product Category Translation (product_category_name_translation)
Maps category names to English. Standardises category names for analysis.

**Key Columns:**
- product_category_name
- product_category_name_english

---

### 9. Sellers (sellers)
Contains seller/vendor information. Tracks merchant-side data.

**Key Columns:**
- seller_id (Primary Key)
- seller_city
- seller_state
- seller_zip_code_prefix


This structured dataset enabled accurate analysis of customer behavior, funnel drop-offs, and retention metrics.
