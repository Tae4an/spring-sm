package edu.sm.dao;

import edu.sm.dto.Product;
import edu.sm.frame.Dao;
import edu.sm.frame.Sql;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao implements Dao<Integer, Product> {

    @Override
    public Product insert(Product product, Connection conn) throws Exception {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(Sql.registerProduct, Statement.RETURN_GENERATED_KEYS);
            pstmt.setInt(1, product.getCategoryId());
            pstmt.setString(2, product.getName());
            pstmt.setInt(3, product.getPrice());
            pstmt.setTimestamp(4, new Timestamp(product.getRegDate().getTime()));
            pstmt.setString(5, product.getDescription());
            pstmt.setString(6, product.getImg1());
            pstmt.setString(7, product.getImg2());
            pstmt.setString(8, product.getImg3());
            pstmt.setString(9, product.getImg4());
            pstmt.setString(10, product.getImg5());
            pstmt.setInt(11, product.getCount());
            pstmt.setBoolean(12, product.isPublic());

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("상품 생성 실패, 영향받은 행이 없습니다.");
            }

            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                product.setProductId(rs.getInt(1));
            } else {
                throw new SQLException("상품 생성 실패, ID를 가져올 수 없습니다.");
            }
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        }
        return product;
    }

    @Override
    public Product update(Product product, Connection conn) throws Exception {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(Sql.editProduct);
            pstmt.setInt(1, product.getCategoryId());
            pstmt.setString(2, product.getName());
            pstmt.setInt(3, product.getPrice());
            pstmt.setString(4, product.getDescription());
            pstmt.setString(5, product.getImg1());
            pstmt.setString(6, product.getImg2());
            pstmt.setString(7, product.getImg3());
            pstmt.setString(8, product.getImg4());
            pstmt.setString(9, product.getImg5());
            pstmt.setInt(10, product.getCount());
            pstmt.setBoolean(11, product.isPublic());
            pstmt.setInt(12, product.getProductId());

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("상품 수정 실패, 해당 ID의 상품이 없습니다.");
            }
        } finally {
            if (pstmt != null) pstmt.close();
        }
        return product;
    }

    @Override
    public boolean delete(Integer id, Connection conn) throws Exception {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(Sql.deleteCategory);  // 상품 삭제 SQL이 없어 카테고리 삭제 SQL 사용
            pstmt.setInt(1, id);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } finally {
            if (pstmt != null) pstmt.close();
        }
    }

    @Override
    public Product select(Integer id, Connection conn) throws SQLException {
        String sql = Sql.searchProducts;  // "SELECT * FROM products WHERE product_id = ?"
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getInt("product_id"),
                            rs.getInt("category_id"),
                            rs.getString("name"),
                            rs.getInt("price"),
                            rs.getTimestamp("reg_date"),
                            rs.getString("description"),
                            rs.getString("img1"),
                            rs.getString("img2"),
                            rs.getString("img3"),
                            rs.getString("img4"),
                            rs.getString("img5"),
                            rs.getInt("count"),
                            rs.getBoolean("is_public")
                    );
                }
            }
        }
        return null;
    }

    @Override
    public List<Product> select(Connection conn) throws Exception {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Product> products = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(Sql.listProducts);
            pstmt.setInt(1, 20); // 예시로 10개씩 조회
            pstmt.setInt(2, 0);  // 첫 페이지
            rs = pstmt.executeQuery();
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("product_id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getTimestamp("reg_date"),
                        rs.getString("description"),
                        rs.getString("img1"),
                        rs.getString("img2"),
                        rs.getString("img3"),
                        rs.getString("img4"),
                        rs.getString("img5"),
                        rs.getInt("count"),
                        rs.getBoolean("is_public")
                ));
            }
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        }
        return products;
    }


    public boolean changeProductStatus(int productId, boolean isPublic, Connection conn) throws Exception {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(Sql.changeProductStatus);
            pstmt.setBoolean(1, isPublic);
            pstmt.setInt(2, productId);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } finally {
            if (pstmt != null) pstmt.close();
        }
    }
}
