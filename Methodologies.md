## Data Cleaning & Preparation

We initiated the analysis by performing structured data cleaning and validation using core data integrity principles.

### 1. Entity Integrity (Primary Keys)
We verified that all primary keys, such as order_id in the Orders table and customer_id in the Customers table, are unique and non-null. Any anomalies or duplicates were identified and handled to ensure each record represents a distinct entity.

### 2. Referential Integrity
We validated relationships across tables by ensuring that all foreign keys correctly map to corresponding primary keys. For example, customer_id in the Orders table was cross-checked against the Customers table to identify and resolve any orphan records.

### 3. Data Type Validation
We reviewed and corrected data types across tables to ensure consistency and usability. Date fields were standardised into proper date time formats, and numeric fields such as price and freight values were validated as decimal types. For instance, date fields in the Reviews table initially stored as VARCHAR were converted into appropriate date formats.

### 4. Duplicate Detection
We performed duplicate checks across key tables such as Customers and Sellers to eliminate redundant records and maintain data accuracy.

### 5. Business Rule Consistency
We enforced logical business rules to ensure data reliability. Examples include:
- Every order must have a valid purchase timestamp  
- Payment values must be greater than zero  
- Delivered orders must have a delivery date  

---

## Data Understanding & Modelling

Following data cleaning, we conducted a detailed exploration of each table to understand its structure, attributes, and business significance.

The primary objective was to establish relationships across tables and design a logical data model. We identified key joins between entities such as Customers, Orders, Order Items, Payments, and Reviews.

Based on this, we structured the dataset into an order-centric analytical model, where each order serves as the central unit of analysis. This enabled seamless integration of customer behaviour, transaction details, product information, and delivery performance into a unified view.

This data modelling approach ensured efficient querying, improved analytical clarity, and supported downstream funnel and performance analysis.




---

## Creation of Final Analytical Table

We used the Orders table as the base, since it represents the core of all transactions. From there, we joined the Customers, Order Payments, and Order Items tables to bring in customer details, payment information, and product-level data.

Instead of joining everything at once, we kept the base table focused and only added other tables like Products, Reviews, Sellers, or Geolocation when needed for specific analyses. This helps keep the data easier to work with and avoids unnecessary complexity.

We observed that both the Order Items and Order Payments tables contain multiple records for the same order_id. This happens because a single order can include multiple products, and customers may also use multiple payment methods (e.g., instalments).

To avoid duplication and ensure accurate analysis, we aggregated these tables at the order level, summing up item prices and payment values. This allowed us to maintain a single row per order in the final dataset, ensuring consistency and preventing inflated metrics.
