package edu.sm.service;

import edu.sm.dao.ProductDao;
import edu.sm.dto.Address;
import edu.sm.dto.Product;
import edu.sm.frame.ConnectionPool;
import edu.sm.frame.Dao;
import edu.sm.frame.MService;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ProductService implements MService<Integer, Product> {

    Dao<Integer,Product> dao;
    ConnectionPool cp;

    public ProductService(Dao<Integer, Product> dao, ConnectionPool cp) {
        this.dao = dao;
        this.cp = cp;
    }

    @Override
    public Product add(Product product) throws Exception {
        Connection con = cp.getConnection();
        try {
            con.setAutoCommit(false);
            product = dao.insert(product, con);
            con.commit();
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return product;
    }

    @Override
    public Product modify(Product product) throws Exception {
        Connection con = cp.getConnection();
        try {
            con.setAutoCommit(false);
            product = dao.update(product, con);
            con.commit();
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return product;
    }

    @Override
    public Boolean remove(Integer id) throws Exception {
        Connection con = cp.getConnection();
        ProductDao dao = new ProductDao();
        Boolean result = false;
        try {
            con.setAutoCommit(false);
            result = dao.changeProductStatus(id, false, con);
            con.commit();
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return result;
    }

    @Override
    public Product get(Integer id) throws Exception {
        Connection con = cp.getConnection();
        Product result = null;
        try {
            result = dao.select(id, con);
        } catch (Exception e) {
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return result;
    }

    @Override
    public List<Product> get() throws Exception {
        Connection con = cp.getConnection();
        List<Product> result = null;
        try {
            result = dao.select(con);
        } catch (Exception e) {
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return result;
    }

    public Boolean toggleProductStatus(Integer id) throws Exception {
        Connection con = cp.getConnection();
        ProductDao dao = new ProductDao();
        Boolean result = false;
        try {
            con.setAutoCommit(false);
            Product product = dao.select(id, con);
            if (product != null) {
                result = dao.changeProductStatus(id, !product.isPublic(), con);
            }
            con.commit();
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return result;
    }

}