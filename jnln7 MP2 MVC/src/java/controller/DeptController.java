/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.EmployeeService;
import java.io.IOException;
import java.util.HashMap;
import java.util.Set;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import model.Departments;
import model.DeptManager;

/**
 *
 * @author Justin
 */
@WebServlet(name = "DeptController", urlPatterns = {"/DeptController", "/readRecords", "/deleteRecords", 
    "/edit_create", "/update", "/newRecord",
            "/readRecordsDept" , "/deleteRecords_departments" , "/edit_create_departments", "/updateDept", "/newDeptRecord"})
public class DeptController extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(DeptController.class.getName());

    @EJB
    private EmployeeService employeeService;

    @Resource
    Validator validator;

    private boolean isEmpty(String param) {
        if ((param == null) || (param.trim().equals(""))) {
            return true;
        } else {
            return false;
        }
    }

    private String trimValue(String param) {
        if (isEmpty(param)) {
            return null;
        } else {
            return param.trim();
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HashMap<String, String> mapMessages = new HashMap<>();
        request.setAttribute("messages", mapMessages);

        switch (request.getServletPath()) {
            case "/newRecord":
                request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                //request.setAttribute("country", countryService.find(request.getParameter("countryCode")));
                //request.getRequestDispatcher("/WEB-INF/employees/showRecords.jsp").forward(request, response);
                LOG.info(employeeService.getRecordCreated().toString());
                break;
            case "/readRecords":
                //LOG.info("Inside read records of controller!!");
                request.setAttribute("readDeptMngr", employeeService.getAllRecords());
                request.getRequestDispatcher("/WEB-INF/employees/showRecords.jsp").forward(request, response);
                break;
            case "/readRecordsDept":
                request.setAttribute("readRecordsDept", employeeService.getAllDeptRecords());
                request.getRequestDispatcher("/WEB-INF/employees/showRecords.jsp").forward(request, response);
                break;
            case "/edit_create": //editing a record
                //LOG.info("Inside edit record of controller!!");
                request.setAttribute("deptManager", employeeService.getRecord(request.getParameter("deptNumber"), request.getParameter("empNumber")));
                request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);

                break;
            
            case "/edit_create_departments": //editing a department record 
                request.setAttribute("deptartments", employeeService.getDeptRecord(request.getParameter("deptNumber")));
                request.getRequestDispatcher("/WEB-INF/employees/editDepartments.jsp").forward(request, response);

                break;
                
            case "/deleteRecords":
                //LOG.info("Inside delete record of controller!!");
                request.setAttribute("deleteDeptMngr", employeeService.deleteDeptMgrRecord(request.getParameter("deptNumber"), request.getParameter("empNumber")));
                request.setAttribute("readDeptMngr", employeeService.getAllRecords());
                if (employeeService.getRecordDeleted()) {
                    mapMessages.put("Sucess!! ", "Sucessfully deleted record for Dept Number: " + request.getParameter("deptNumber")
                            + " and Employee Number:" + request.getParameter("empNumber"));
                } else {
                    mapMessages.put("Failure!! ", "Could not delete a new record for Dept Number: " + request.getParameter("deptNumber")
                            + " and Employee Number:" + request.getParameter("empNumber"));
                }
                request.getRequestDispatcher("/WEB-INF/employees/showRecords.jsp").forward(request, response);
                break;
            
            case "/deleteRecords_departments":
                //LOG.info("Inside delete record of controller!!");
                request.setAttribute("deleteDept", employeeService.deleteDeptRecord(request.getParameter("deptNumber")));
                request.setAttribute("readRecordsDept", employeeService.getAllDeptRecords());
                if (employeeService.getRecordDeleted()) {
                    mapMessages.put("Sucess!! ", "Sucessfully deleted record for Dept Number: " + request.getParameter("deptNumber"));
                } else {
                    mapMessages.put("Failure!! ", "Could not delete a new record for Dept Number: " + request.getParameter("deptNumber"));
                }
                request.getRequestDispatcher("/WEB-INF/employees/showRecords.jsp").forward(request, response);
                break;
                
                
            default:
                break;
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HashMap<String, String> mapMessages = new HashMap<>();
        request.setAttribute("messages", mapMessages);

        switch (request.getServletPath()) {

            case "/update":
                //LOG.info("Inside do Post: edit record of controller!!");
                //request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                DeptManager deptManger = new DeptManager();
                deptManger.setDeptNumber(trimValue(request.getParameter("deptNumber")));
                deptManger.setEmpNumber(trimValue(request.getParameter("empNumber")));
                deptManger.setFromDate(trimValue(request.getParameter("fromDate")));
                deptManger.setToDate(trimValue(request.getParameter("toDate")));

                Set<ConstraintViolation<DeptManager>> violations
                        = validator.validate(deptManger);

                if (violations.isEmpty()) {
                    employeeService.editDeptMgrRecord(deptManger);
                    //request.setAttribute("readDeptMngr", employeeService.getAllRecords());
                    if (employeeService.getRecordUpdated()) {
                        request.setAttribute("readDeptMngr", employeeService.getAllRecords());
                        mapMessages.put("Sucess!! ", "Sucessfully edited record for Dept Number: " + request.getParameter("deptNumber")
                                + " and Employee Number:" + request.getParameter("empNumber"));
                        request.getRequestDispatcher("/WEB-INF/employees/showRecords.jsp").forward(request, response);
                    } else {
                        mapMessages.put("Failure!! ", "Could not edit record for Dept Number: " + request.getParameter("deptNumber")
                                + " and Employee Number:" + request.getParameter("empNumber")+ " ::: " + employeeService.getFailureReason());
                        request.setAttribute("deptManager", deptManger);
                        request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                    }
                } else {
                   // LOG.info(violations.toString());
                    // LOG.info(String.valueOf(violations.size()));
                    request.setAttribute("violations", violations);
                    //mapMessages.put(violations.toString(),"Error in Bean");
                    request.setAttribute("deptManager", deptManger);
                    request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                }
                break;
                
                
            case "/updateDept":
                //LOG.info("Inside do Post: edit record of controller!!");
                //request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                Departments dept = new Departments();
                dept.setDeptNumber(trimValue(request.getParameter("deptNumber")));
                dept.setDeptName(trimValue(request.getParameter("deptName")));
                Set<ConstraintViolation<Departments>> deptViolations
                        = validator.validate(dept);

                if (deptViolations.isEmpty()) {
                    employeeService.editDeptRecord(dept);
                    //request.setAttribute("readDeptMngr", employeeService.getAllRecords());
                    if (employeeService.getRecordUpdated()) {
                        request.setAttribute("readRecordsDept", employeeService.getAllDeptRecords());
                        mapMessages.put("Sucess!! ", "Sucessfully edited record for Dept Number: " + request.getParameter("deptNumber")
                                );
                        request.getRequestDispatcher("/WEB-INF/employees/showRecords.jsp").forward(request, response);
                    } else {
                        mapMessages.put("Failure!! ", "Could not edit record for Dept Number: " + request.getParameter("deptNumber")
                                + " ::: " + employeeService.getFailureReason());
                        request.setAttribute("deptartments", dept);
                        request.getRequestDispatcher("/WEB-INF/employees/editDepartments.jsp").forward(request, response);
                    }
                } else {
                   // LOG.info(violations.toString());
                    // LOG.info(String.valueOf(violations.size()));
                    request.setAttribute("violations", deptViolations);
                    //mapMessages.put(violations.toString(),"Error in Bean");
                    request.setAttribute("deptartments", dept);
                    request.getRequestDispatcher("/WEB-INF/employees/editDepartments.jsp").forward(request, response);
                }
                break;

            case "/newRecord":
                //LOG.info("Inside do Post: edit record of controller!!");
                //request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                //LOG.info(employeeService.getRecordCreated().toString());

                deptManger = new DeptManager();
                deptManger.setDeptNumber(trimValue(request.getParameter("deptNumber")));
                deptManger.setEmpNumber(trimValue(request.getParameter("empNumber")));
                deptManger.setFromDate(trimValue(request.getParameter("fromDate")));
                deptManger.setToDate(trimValue(request.getParameter("toDate")));

                violations = validator.validate(deptManger);

                if (violations.isEmpty()) {
                     employeeService.createDeptMgrRecord(deptManger);
                    if (employeeService.getRecordCreated()) {
                        //request.setAttribute("readDeptMngr", employeeService.getAllRecords());

                        mapMessages.put("Sucess!! ", "Sucessfully created a new record for Dept Number: " + request.getParameter("deptNumber")
                                + " and Employee Number:" + request.getParameter("empNumber"));
                        request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                    } else {
                        mapMessages.put("Failure!! ", "Could not create a new record for Dept Number: " + request.getParameter("deptNumber")
                                + " and Employee Number:" + request.getParameter("empNumber") + " ::: " + employeeService.getFailureReason());
                        request.setAttribute("deptManager", deptManger);
                        request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                    }
                } else {
                   // LOG.info(violations.toString());
                    // LOG.info(String.valueOf(violations.size()));
                    request.setAttribute("violations", violations);
                    //mapMessages.put(violations.toString(),"Error in Bean");
                    request.setAttribute("deptManager", deptManger);
                    request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                }
                break;
            
            
            case "/newDeptRecord":
                //LOG.info("Inside do Post: edit record of controller!!");
                //request.getRequestDispatcher("/WEB-INF/employees/editRecords.jsp").forward(request, response);
                //LOG.info(employeeService.getRecordCreated().toString());

                dept = new Departments();
                dept.setDeptNumber(trimValue(request.getParameter("deptNumber")));
                dept.setDeptName(trimValue(request.getParameter("deptName")));

                deptViolations = validator.validate(dept);

                if (deptViolations.isEmpty()) {
                     employeeService.createDeptRecord(dept);
                    if (employeeService.getRecordCreated()) {
                        //request.setAttribute("readDeptMngr", employeeService.getAllRecords());

                        mapMessages.put("Sucess!! ", "Sucessfully created a new record for Dept Number: " + request.getParameter("deptNumber")
                                );
                        request.getRequestDispatcher("/WEB-INF/employees/editDepartments.jsp").forward(request, response);
                    } else {
                        mapMessages.put("Failure!! ", "Could not create a new record for Dept Number: " + request.getParameter("deptNumber")
                                +" ::: "+employeeService.getFailureReason());
                        request.setAttribute("deptartments", dept);
                        request.getRequestDispatcher("/WEB-INF/employees/editDepartments.jsp").forward(request, response);
                    }
                } else {
                   // LOG.info(violations.toString());
                    // LOG.info(String.valueOf(violations.size()));
                    request.setAttribute("violations", deptViolations);
                    //mapMessages.put(violations.toString(),"Error in Bean");
                    request.setAttribute("deptartments", dept);
                    request.getRequestDispatcher("/WEB-INF/employees/editDepartments.jsp").forward(request, response);
                }
                break;
                
            default:
                break;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
