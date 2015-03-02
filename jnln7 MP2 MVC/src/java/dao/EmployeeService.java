/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.sql.DataSource;
import model.Departments;
import model.DeptManager;

/**
 *
 * @author Justin
 */
@Stateless
public class EmployeeService {

    @Resource(lookup = "jdbc/mp2DS")
    DataSource ds;
    
    private static final Logger LOG = Logger.getLogger(EmployeeService.class.getName());

    private Boolean recordUpdated = false;
    private Boolean recordCreated = false;
    private Boolean recordDeleted = false;
    private String failureReason;

    /**
     *
     * @return
     */
    public String getFailureReason() {
        return failureReason;
    }

    /**
     *
     * @param failureReason
     */
    public void setFailureReason(String failureReason) {
        this.failureReason = failureReason;
    }

    /**
     *
     * @return
     */
    public Boolean getRecordUpdated() {
        return recordUpdated;
    }

    /**
     *
     * @param recordUpdated
     */
    public void setRecordUpdated(Boolean recordUpdated) {
        this.recordUpdated = recordUpdated;
    }

    /**
     *
     * @return
     */
    public Boolean getRecordCreated() {
        return recordCreated;
    }

    /**
     *
     * @param recordCreated
     */
    public void setRecordCreated(Boolean recordCreated) {
        this.recordCreated = recordCreated;
    }

    /**
     *
     * @return
     */
    public Boolean getRecordDeleted() {
        return recordDeleted;
    }

    /**
     *
     * @param recordDeleted
     */
    public void setRecordDeleted(Boolean recordDeleted) {
        this.recordDeleted = recordDeleted;
    }

    /**
     *
     * @return
     */
    public List<DeptManager> getAllRecords() {
        List<DeptManager> deptManager = new ArrayList<>();

        try (Connection conn = ds.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from dept_manager order by dept_no");

            while (rs.next()) {
                deptManager.add(new DeptManager(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
                //LOG.info(rs.getInt(1));
                // LOG.info(rs.getString(2));
                //LOG.info(rs.getDate(3).toString());
            }
        } catch (SQLException ex) {
            LOG.log(Level.SEVERE, null, ex);
        }
        return deptManager;
    }
    
    /**
     *
     * @return
     */
    public List<Departments> getAllDeptRecords() {
        List<Departments> departments = new ArrayList<>();

        try (Connection conn = ds.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from departments order by dept_no");

            while (rs.next()) {
                departments.add(new Departments(rs.getString(1), rs.getString(2)));
                //LOG.info(rs.getInt(1));
                // LOG.info(rs.getString(2));
                //LOG.info(rs.getDate(3).toString());
            }
        } catch (SQLException ex) {
            LOG.log(Level.SEVERE, null, ex);
        }
        return departments;
    }

    /**
     *
     * @param deptNo
     * @param empNumber
     * @return
     */
    public DeptManager deleteDeptMgrRecord(String deptNo, String empNumber) {

        DeptManager deptManager = null;

        setRecordDeleted(false);
        try (Connection conn = ds.getConnection()) {

            PreparedStatement ps = conn.prepareStatement("delete from dept_manager where dept_no = ? and emp_no = ?");
            ps.setString(1, deptNo);
            ps.setString(2, empNumber);

            if (ps.executeUpdate() == 1) {
                setRecordDeleted(true);
            }

        } catch (SQLException ex) {
            setFailureReason(ex.getMessage());
            LOG.log(Level.SEVERE, null, ex);
        }
        return deptManager;
    }

    /**
     *
     * @param deptNo
     * @return
     */
    public Departments deleteDeptRecord(String deptNo) {

        Departments deptManager = null;

        setRecordDeleted(false);
        try (Connection conn = ds.getConnection()) {

            PreparedStatement ps = conn.prepareStatement("delete from departments where dept_no = ?");
            ps.setString(1, deptNo);

            if (ps.executeUpdate() == 1) {
                setRecordDeleted(true);
            }

        } catch (SQLException ex) {
            setFailureReason(ex.getMessage());
            LOG.log(Level.SEVERE, null, ex);
        }
    return deptManager;
    }

    /**
     *
     * @param deptManager
     * @return
     */
    public DeptManager editDeptMgrRecord(DeptManager deptManager) {
        //DeptManager deptManager = null;
        setRecordUpdated(false);
        try (Connection conn = ds.getConnection()) {

            PreparedStatement ps = conn.prepareStatement("update dept_manager set dept_no = ?, emp_no = ?,from_date = ?, to_date = ? where dept_no = ? and emp_no = ?");
            ps.setString(1, deptManager.getDeptNumber());
            ps.setString(2, deptManager.getEmpNumber());
            ps.setString(3, deptManager.getFromDate());
            ps.setString(4, deptManager.getToDate());
            ps.setString(5, deptManager.getDeptNumber());
            ps.setString(6, deptManager.getEmpNumber());

            if (ps.executeUpdate() == 1) {
                setRecordUpdated(true);
            }
        } catch (SQLException ex) {
            setFailureReason(ex.getMessage());
            LOG.log(Level.SEVERE, null, ex);
        }
        //LOG.info(country.toString());
        return deptManager;
    }
    
    /**
     *
     * @param dept
     * @return
     */
    public Departments editDeptRecord(Departments dept) {
        //DeptManager deptManager = null;
        setRecordUpdated(false);
        try (Connection conn = ds.getConnection()) {

            PreparedStatement ps = conn.prepareStatement("update departments set dept_no = ?, dept_name = ? where dept_no = ?");
            ps.setString(1, dept.getDeptNumber());
            ps.setString(2, dept.getDeptName());
            ps.setString(3, dept.getDeptNumber());
            
            if (ps.executeUpdate() == 1) {
                setRecordUpdated(true);
            }
        } catch (SQLException ex) {
            setFailureReason(ex.getMessage());
            LOG.log(Level.SEVERE, null, ex);
        }
        //LOG.info(country.toString());
        return dept;
    }

    /**
     *
     * @param deptManager
     * @return
     */
    public DeptManager createDeptMgrRecord(DeptManager deptManager) {
        //DeptManager deptManager = null;
        setRecordCreated(false);
        try (Connection conn = ds.getConnection()) {

            PreparedStatement ps = conn.prepareStatement("insert into dept_manager(dept_no, emp_no, from_date , to_date  )\n"
                    + " values (? , ? , ? , ?)");
           ps.setString(1, deptManager.getDeptNumber());
            ps.setString(2, deptManager.getEmpNumber());
            ps.setString(3, deptManager.getFromDate());
            ps.setString(4, deptManager.getToDate());

            if (ps.executeUpdate() == 1) {
                setRecordCreated(true);
            }
        } catch (SQLException ex) {
            setFailureReason(ex.getMessage());
            LOG.log(Level.SEVERE, null, ex);
        }
        return deptManager;
    }
    
    /**
     *
     * @param dept
     * @return
     */
    public Departments createDeptRecord(Departments dept) {
        //DeptManager deptManager = null;
        setRecordCreated(false);
        try (Connection conn = ds.getConnection()) {
            
            PreparedStatement ps = conn.prepareStatement("insert into departments(dept_no, dept_name  )\n"
                    + " values (? , ? )");
           ps.setString(1, dept.getDeptNumber());
           ps.setString(2, dept.getDeptName());
            
            if (ps.executeUpdate() == 1) {
                setRecordCreated(true);
            }
        } catch (SQLException ex) {
            setFailureReason(ex.getMessage());
            LOG.log(Level.SEVERE, null, ex);
        }
        return dept;
    }

    /**
     *
     * @param deptNumber
     * @param empNumber
     * @return
     */
    public DeptManager getRecord(String deptNumber, String empNumber) {

        DeptManager deptManager = null;

        try (Connection conn = ds.getConnection()) {

            PreparedStatement ps = conn.prepareStatement("select * from dept_manager where dept_no = ? and emp_no = ?");
            ps.setString(1, deptNumber);
            ps.setString(2, empNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.first()) {
                deptManager = new DeptManager(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }

        } catch (SQLException ex) {
            LOG.log(Level.SEVERE, null, ex);
        }
        return deptManager;
    }

    /**
     *
     * @param deptNumber
     * @return
     */
    public Departments getDeptRecord(String deptNumber) {

        Departments departments = null;

        try (Connection conn = ds.getConnection()) {

            PreparedStatement ps = conn.prepareStatement("select * from departments where dept_no = ?");
            ps.setString(1, deptNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.first()) {
                departments = new Departments(rs.getString(1), rs.getString(2));
            }

        } catch (SQLException ex) {
            LOG.log(Level.SEVERE, null, ex);
        }
        return departments;
    }
}
