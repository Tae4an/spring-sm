package edu.sm.service;

import edu.sm.dao.CategoryDao;
import edu.sm.dto.Address;
import edu.sm.dto.Category;
import edu.sm.frame.ConnectionPool;
import edu.sm.frame.Dao;
import edu.sm.frame.MService;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CategoryService implements MService<Integer, Category> {

    Dao<Integer, Category> dao;
    ConnectionPool cp;

    public CategoryService(Dao<Integer, Category> dao, ConnectionPool cp) {
        this.dao = dao;
        this.cp = cp;
    }

    @Override
    public Category add(Category category) throws Exception {
        Connection con = cp.getConnection();
        try {
            con.setAutoCommit(false);
            category = dao.insert(category, con);
            con.commit();
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return category;
    }

    @Override
    public Category modify(Category category) throws Exception {
        Connection con = cp.getConnection();
        try {
            con.setAutoCommit(false);
            category = dao.update(category, con);
            con.commit();
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return category;
    }

    @Override
    public Boolean remove(Integer integer) throws Exception {
        Connection con = cp.getConnection();
        Boolean result = false;
        try {
            con.setAutoCommit(false);
            result = dao.delete(integer, con);
            if (result) {
                con.commit();  // 성공 시 커밋
            } else {
                con.rollback();  // 실패 시 롤백
            }
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return result;
    }

    @Override
    public Category get(Integer id) throws Exception {
        Connection con = cp.getConnection();
        try {
            return dao.select(id, con);
        } finally {
            cp.releaseConnection(con);
        }
    }

    @Override
    public List<Category> get() throws Exception {
        Connection con = cp.getConnection();
        try {
            return dao.select(con);
        } finally {
            cp.releaseConnection(con);
        }
    }
}
