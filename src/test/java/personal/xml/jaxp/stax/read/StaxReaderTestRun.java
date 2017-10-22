package personal.xml.jaxp.stax.read;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.ClassPathResource;

public class StaxReaderTestRun {
	
	public static void main(String[] args) throws IOException{
        List<Employee> empList = StaxXMLReader.parseXML(new ClassPathResource("personal/xml/jaxp/stax/read/employee.xml").getInputStream());
        for(Employee emp : empList){
            System.out.println(emp.toString());
        }
	}

}
