/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.Serializable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Justin
 */
public class Departments implements Serializable {
    
    @NotNull(message="Department Number cannot be null")
    private String deptNumber;
    @NotNull(message="Departmnet Name cannot be null")
    private String deptName;
    
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
     * @param deptNumber
     * @param deptName
     */
    public Departments(String deptNumber, String deptName) {
        this.deptNumber = deptNumber;
        this.deptName = deptName;
    }

    /**
     *
     */
    public Departments() {
    }

    /**
     *
     * @return
     */
    public String getDeptName() {
        return deptName;
    }

    /**
     *
     * @param deptName
     */
    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    @Override
    public String toString() {
        return "Departments{" + "deptNumber=" + deptNumber + ", deptName=" + deptName + '}';
    }

   
    
    
}
