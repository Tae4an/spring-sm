package edu.sm.frame;

public class Sql {
    // 회원 관리 (MM)
    public static String insertCustomer = "INSERT INTO customer (username, pw, name, p_number, signup_date, role) VALUES (?, ?, ?, ?, ?, ?)";

    public static String searchMembers =
            "SELECT * FROM customer WHERE username LIKE ? OR name LIKE ? OR p_number LIKE ?";

    public static String listMembers =
            "SELECT * FROM customer LIMIT ? OFFSET ?";

    public static String viewMemberDetails =
            "SELECT * FROM customer WHERE cust_id = ?";

    public static String editMemberInfo =
            "UPDATE customer SET username = ?, pw = ?, name = ?, p_number = ? WHERE cust_id = ?";

    public static String deleteMember =
            "DELETE FROM customer WHERE cust_id = ?";


    // 상품 관리 (PM)
    public static String searchProducts =
            "SELECT * FROM product WHERE product_id = ?";

    public static String listProducts =
            "SELECT * FROM product LIMIT ? OFFSET ?";

    public static String registerProduct =
            "INSERT INTO product (category_id, name, price, reg_date, description, img1, img2, img3, img4, img5, count, is_public) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public static String editProduct =
            "UPDATE product SET category_id = ?, name = ?, price = ?, description = ?, " +
                    "img1 = ?, img2 = ?, img3 = ?, img4 = ?, img5 = ?, count = ?, is_public = ? " +
                    "WHERE product_id = ?";

    public static String changeProductStatus =
            "UPDATE product SET is_public = ? WHERE product_id = ?";

    public static String addCategory =
            "INSERT INTO category (name, category_id2) VALUES (?, ?)";

    public static String editCategory =
            "UPDATE category SET name = ?, category_id2 = ? WHERE category_id = ?";

    public static String deleteCategory =
            "DELETE FROM category WHERE category_id = ?";


    // 주문 관리 (OM)
    public static String insertOrder =
            "INSERT INTO `order` (cust_id, product_count, price, order_date, name, phone, " +
                    "address1, address2, zip_code, request, card, used_mileage) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public static String searchOrders =
            "SELECT * FROM `order` WHERE order_id = ?";

    public static String listOrders =
            "SELECT * FROM `order`";


    public static String listDelivery =
            "SELECT * FROM delivery";


    public static String editOrder =
            "UPDATE `order` SET product_count = ?, price = ?, name = ?, phone = ?, " +
                    "address1 = ?, address2 = ?, zip_code = ?, request = ?, card = ?, used_mileage = ? " +
                    "WHERE order_id = ?";


    public static String deleteOrder =
            "DELETE FROM `order` WHERE order_id = ?";

    public static String viewShippingStatus =
            "SELECT * FROM delivery WHERE order_id = ?";

    public static String editShippingInfo =
            "UPDATE delivery SET status = ?, tracking_number = ?, estimated_delivery = ?, actual_delivery = ? " +
                    "WHERE delivery_id = ?";
    public static String insertDelivery =
            "INSERT INTO delivery (order_id, status, tracking_number, estimated_delivery, actual_delivery) VALUES (?, ?, ?, ?, ?)";

    // OrderDetail 관련 쿼리
    public static String insertOrderDetail =
            "INSERT INTO order_detail (product_id, order_id, price, count) VALUES (?, ?, ?, ?)";

    public static String updateOrderDetail =
            "UPDATE order_detail SET price = ?, count = ? WHERE order_detail_id = ?";

    public static String deleteOrderDetail =
            "DELETE FROM order_detail WHERE order_detail_id = ?";

    public static String selectOrderDetail =
            "SELECT * FROM order_detail WHERE order_detail_id = ?";

    public static String selectAllOrderDetails =
            "SELECT * FROM order_detail";


    // 장바구니 (Cart) 관련 쿼리
    public static String insertCart =
            "INSERT INTO cart (cust_id, product_id, count, reg_date) VALUES (?, ?, ?, ?)";

    public static String updateCart =
            "UPDATE cart SET count = ? WHERE cart_id = ?";

    public static String deleteCart =
            "DELETE FROM cart WHERE cart_id = ?";

    public static String selectCart =
            "SELECT * FROM cart WHERE cart_id = ?";

    public static String selectAllCarts =
            "SELECT * FROM cart";



    // 마이페이지 (MP)
    public static String listAddresses =
            "SELECT * FROM address";
    public static String listAddressesDetails =
            "SELECT * FROM address where address_key =  ?";
    public static String setDefaultAddress =
            "UPDATE address SET def = CASE WHEN address_key = ? THEN 'Y' ELSE 'N' END WHERE cust_id = ?";

    public static String addAddress =
            "INSERT INTO address (cust_id, name, phone, address, address_detail, zip_code, request, def) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    public static String editAddress =
            "UPDATE address SET name = ?, phone = ?, address = ?, address_detail = ?, zip_code = ?, request = ? " +
                    "WHERE address_key = ? AND cust_id = ?";

    public static String deleteAddress =
            "DELETE FROM address WHERE address_key = ?";


    // Board 관련 쿼리
    public static String insertBoard =
            "INSERT INTO board (cust_id, product_id, ntype, title, reg_date, content, img, rate) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    public static String updateBoard =
            "UPDATE board SET title = ?, content = ?, img = ?, rate = ? WHERE board_id = ?";

    public static String deleteBoard =
            "DELETE FROM board WHERE board_id = ?";

    public static String selectBoard =
            "SELECT * FROM board WHERE board_id = ?";

    public static String selectAllBoards =
            "SELECT * FROM board";

    // Payment 관련 쿼리
    public static String insertPayment =
            "INSERT INTO payment (order_id, price, method, pay_date) VALUES (?, ?, ?, ?)";

    public static String updatePayment =
            "UPDATE payment SET price = ?, method = ?, pay_date = ? WHERE payment_id = ?";

    public static String deletePayment =
            "DELETE FROM payment WHERE payment_id = ?";

    public static String selectPayment =
            "SELECT * FROM payment WHERE payment_id = ?";

    public static String selectAllPayments =
            "SELECT * FROM payment";


    // Mileage 관련 쿼리
    public static String insertMileage =
            "INSERT INTO mileage (cust_id, balance) VALUES (?, ?)";

    public static String updateMileage =
            "UPDATE mileage SET balance = ? WHERE mileage_id = ?";

    public static String deleteMileage =
            "DELETE FROM mileage WHERE mileage_id = ?";

    public static String selectMileage =
            "SELECT * FROM mileage WHERE mileage_id = ?";

    public static String selectAllMileages =
            "SELECT * FROM mileage";

    public static String selectMileageByCustId =
            "SELECT * FROM mileage WHERE cust_id = ?";

    // UsedMileage 관련 쿼리
    public static String insertUsedMileage =
            "INSERT INTO used_mileage (cust_id, used_date, amount) VALUES (?, ?, ?)";

    public static String updateUsedMileage =
            "UPDATE used_mileage SET cust_id = ?, used_date = ?, amount = ? WHERE used_mileage_id = ?";

    public static String deleteUsedMileage =
            "DELETE FROM used_mileage WHERE used_mileage_id = ?";

    public static String selectUsedMileage =
            "SELECT * FROM used_mileage WHERE used_mileage_id = ?";

    public static String selectAllUsedMileages =
            "SELECT * FROM used_mileage";
    // Wish 관련 쿼리
    public static String insertWish =
            "INSERT INTO wish (cust_id, product_id, reg_date) VALUES (?, ?, ?)";

    public static String updateWish =
            "UPDATE wish SET cust_id = ?, product_id = ?, reg_date = ? WHERE wish_id = ?";

    public static String deleteWish =
            "DELETE FROM wish WHERE wish_id = ?";

    public static String selectWish =
            "SELECT * FROM wish WHERE wish_id = ?";

    public static String selectAllWishes =
            "SELECT * FROM wish";

    public static String selectCategory = "SELECT category_id, name, category_id2 FROM category WHERE category_id = ?";
    public static String selectAllCategories = "SELECT category_id, name, category_id2 FROM category";

}