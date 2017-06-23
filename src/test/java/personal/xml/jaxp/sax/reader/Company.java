package personal.xml.jaxp.sax.reader;

import java.util.List;

public class Company {
    private List<Employee> employeeList;

    public List<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    @Override
    public String toString() {
        return "Company{" +
                "employeeList=" + employeeList +
                '}';
    }
}
