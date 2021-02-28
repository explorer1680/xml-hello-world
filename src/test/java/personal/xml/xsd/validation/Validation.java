package personal.xml.xsd.validation;

import java.io.File;
import java.io.IOException;

import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.xml.sax.SAXException;

public class Validation {

	public static void main(String[] args) {

		boolean isValid = validateXMLSchema("src/test/java/personal/xml/xsd/validation/poll.xsd", "src/test/java/personal/xml/xsd/validation/poll.xml");
		if (isValid) {
			System.out.println("is valid against ");
		} else {
			System.out.println(" is not valid against ");
		}
	}

	
    public static boolean validateXMLSchema(String xsdPath, String xmlPath){
        
        try {
            SchemaFactory factory = 
                    SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            Schema schema = factory.newSchema(new File(xsdPath));
            Validator validator = schema.newValidator();
            validator.validate(new StreamSource(new File(xmlPath)));
        } catch (IOException | SAXException e) {
            System.out.println("Exception: "+e.getMessage());
            return false;
        }
        return true;
    }

}
