# 🛒 E-Commerce Funnel & Revenue Leakage Analysis

## 📌 Project Overview

This project analyzes an e-commerce dataset (~100K+ orders) to understand **conversion efficiency, revenue leakage, and operational bottlenecks**. The goal is to identify where the business is losing revenue and provide actionable insights to improve performance.

---

## 🎯 Business Objectives

* Analyze **order funnel conversion** (Created → Payment → Delivered)
* Identify **drop-off points** in the customer journey
* Quantify **revenue loss due to cancellations and failures**
* Evaluate **regional and category-level performance**
* Assess **delivery efficiency and customer experience**

---

## Dataset Description

The dataset consists of multiple relational tables:

- `orders` – core table containing order lifecycle, timestamps, and status  
- `order_items` – item-level details including product ID, seller ID, and price  
- `order_payments` – payment transactions, payment type, and installments  
- `order_reviews` – customer review scores and comments  
- `customers` – customer unique IDs and geographic location  
- `products` – product details and category information  
- `sellers` – seller information and location  
- `geolocation` – zip code–level geographic data (lat/long, city, state)  
- `product_category_name_translation` – mapping of product categories (Portuguese → English)

---

## 🛠️ Tools & Technologies

* SQL (MySQL)
* DBeaver
* MS Excel (for Visualization)

---

## 🔍 Analytical Approach

### 1. Data Preparation

* Ensured **data integrity** (primary/foreign keys, null checks)
* Joined multiple tables to create a **master dataset** - Data Modaling

### 2. Funnel Analysis

* Defined funnel stages:

  * Order Created → Payment Completed → Order Delivered
* Calculated:

  * Conversion rates
  * Drop-off percentages

### 3. Revenue Analysis

* Computed total revenue and **lost revenue**
* Identified **revenue leakage sources**:

  * Cancellations
  * Product unavailability

### 4. Segmentation Analysis

* Regional performance (state-level)
* Product category performance
* Customer behavior (repeat vs new)

### 5. Delivery & Experience Analysis

* Delivery time calculation
* Correlation with customer review scores

---

## 📊 Key Findings

* ✅ **~97% Delivery Success Rate**
  Strong operational efficiency with most orders successfully fulfilled.

* 💳 **~100% Payment Conversion**
  Minimal drop-off during checkout, indicating a smooth payment experience.

* ⚠️ **~3% Post-Payment Drop-off**
  Failures occur after payment, pointing to logistics and inventory issues.

* 💸 **~1.7% Revenue Leakage (~₹2.7L)**
  Revenue loss driven primarily by cancellations and product unavailability.

* 🌍 **Regional Variations Exist**
  Certain states show lower delivery success and higher revenue loss.

* 🛒 **Category-Level Issues**
  Specific product categories contribute disproportionately to cancellations.

---

## 📈 Funnel Summary

| Stage             | Orders | Conversion Rate | Drop-off |
| ----------------- | ------ | --------------- | -------- |
| Order Created     | 99,441 | 100%            | —        |
| Payment Completed | 99,437 | 99.99%          | 0.01%    |
| Order Delivered   | 96,478 | 97.02%          | 2.98%    |

---

## 💡 Business Insights

* The **primary bottleneck lies in post-payment operations**, not customer acquisition or checkout.
* Improving **logistics and inventory management** can directly recover lost revenue.
* Regional and category-level inefficiencies highlight opportunities for **targeted optimization**.

---

## 🚀 Recommendations

* Optimize logistics in **low-performing regions**
* Improve inventory planning for **high-cancellation categories**
* Strengthen fulfillment processes to reduce post-payment failures
* Focus marketing efforts on **high-performing regions**
* Enhance customer experience to drive **repeat purchases**

---

## 📌 Conclusion

This project demonstrates how data analysis can uncover **hidden inefficiencies in operations**. While the business shows strong conversion and fulfillment rates, targeted improvements in logistics and inventory can further enhance revenue and customer satisfaction.

---

## 👤 Author

**Mukesh**
Data / Business Analyst
