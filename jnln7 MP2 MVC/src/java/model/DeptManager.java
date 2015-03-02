/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.Serializable;
import java.util.Date;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Justin
 */
public class DeptManager implements Serializable {
    
    @NotNull(message="Department Number cannot be null")
    private String deptNumber;
    @NotNull(message="Employee Number cannot be null")
    private String empNumber;
    @NotNull(message="From Date Number cannot be null")
    private String fromDate;
    @NotNull(message="To Date Number cannot be null")
    private String toDate;

    /**
     *
     * @return
     */
    public String getDeptNumber() {
        return deptNumber;
    }

    /**
     *
     * @param deptNumber
     */
    public void setDeptNumber(String deptNumber) {
        this.deptNumber = deptNumber;
    }

    /**
     *
     * @return
     */
    public String getEmpNumber() {
        return empNumber;
    }

    /**
     *
     * @param empNumber
     */
    public void setEmpNumber(String empNumber) {
        this.empNumber = empNumber;
    }

    /**
     *
     * @return
     */
    public String getFromDate() {
        return fromDate;
    }

    /**
     *
     * @param fromDate
     */
    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    /**
     *
     * @return
     */
    public String getToDate() {
        return toDate;
    }

    /**
     *
     * @param toDate
     */
    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    /**
     *
     * @param deptNumber
     * @param empNumber
     * @param fromDate
     * @param toDate
     */
    public DeptManager(String deptNumber, String empNumber, String fromDate, String toDate) {
        this.deptNumber = deptNumber;
        this.empNumber = empNumber;
        this.fromDate = fromDate;
        this.toDate = toDate;
    }

    /**
     *
     */
    public DeptManager() {
    }

    @Override
    public String toString() {
        return "DeptManager{" + "deptNumber=" + deptNumber + ", empNumber=" + empNumber + ", fromDate=" + fromDate + ", toDate=" + toDate + '}';
    }
    
    
}
