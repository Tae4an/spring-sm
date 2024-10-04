package edu.sm.service;

import edu.sm.dao.UsedMileageDao;
import edu.sm.dto.UsedMileage;
import edu.sm.frame.ConnectionPool;
import edu.sm.frame.Dao;
import edu.sm.frame.MService;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class UsedMileageService implements MService<Integer, UsedMileage> {

    Dao<Integer, UsedMileage> dao;
    ConnectionPool cp;

    public UsedMileageService(Dao<Integer, UsedMileage> dao, ConnectionPool cp) {
        this.dao = dao;
        this.cp = cp;
    }

    @Override
    public UsedMileage add(UsedMileage usedMileage) throws Exception {
        Connection con = cp.getConnection();
        try {
            con.setAutoCommit(false);
            usedMileage = dao.insert(usedMileage, con);
            System.out.println("New used mileage record created with ID: " + usedMileage.getUsedMileageId());
            con.commit();
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return usedMileage;
    }

    @Override
    public UsedMileage modify(UsedMileage usedMileage) throws Exception {
        Connection con = cp.getConnection();
        try {
            usedMileage = dao.update(usedMileage, con);
            System.out.println("Used mileage record updated: " + usedMileage.getUsedMileageId());
        } catch (Exception e) {
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return usedMileage;
    }

    @Override
    public Boolean remove(Integer id) throws Exception {
        Connection con = cp.getConnection();
        Boolean result = false;
        try {
            result = dao.delete(id, con);
            System.out.println("Used mileage record removed: " + id);
        } catch (Exception e) {
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return result;
    }

    @Override
    public UsedMileage get(Integer id) throws Exception {
        Connection con = cp.getConnection();
        UsedMileage result = null;
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
    public List<UsedMileage> get() throws Exception {
        Connection con = cp.getConnection();
        List<UsedMileage> result = null;
        try {
            result = dao.select(con);
        } catch (Exception e) {
            throw e;
        } finally {
            cp.releaseConnection(con);
        }
        return result;
    }
}