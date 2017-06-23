package personal.xml.jaxp.sax.reader;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.util.ArrayList;
import java.util.List;


public class EmployeeHandler extends DefaultHandler {

    private static final String COMPANY = "company";
    private static final String EMPLOYEE = "employee";
    private static final String FIRSTNAME = "firstname";
    private static final String LASTNAME = "lastname";

    private StringBuffer buffer = new StringBuffer();
    private List<Employee> employeeList;
    private Employee employee;
    private Company company;

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {

        buffer.setLength(0);
        if (qName.equalsIgnoreCase(COMPANY)) {
            employeeList = new ArrayList<>();
        } else if (qName.equalsIgnoreCase(EMPLOYEE)) {
            employee = new Employee();
        } else if (qName.equalsIgnoreCase(FIRSTNAME)) {
        } else if (qName.equalsIgnoreCase(LASTNAME)) {
        }
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {

        if (qName.equalsIgnoreCase(COMPANY)) {
            company = new Company();
            company.setEmployeeList(employeeList);
        } else if (qName.equalsIgnoreCase(EMPLOYEE)) {
            employeeList.add(employee);
        } else if (qName.equalsIgnoreCase(FIRSTNAME)) {
            employee.setFirstName(buffer.toString());
        } else if (qName.equalsIgnoreCase(LASTNAME)) {
            employee.setLastName(buffer.toString());
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        buffer.append(ch, start, length);
    }

    public Company retrieveCompany() {
        return company;
    }
}
