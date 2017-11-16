package personal.xml.jaxp.validator;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.IOException;

public class ValidatorTestRun {

    public static void main(String[] args) throws IOException, SAXException {
        SchemaFactory factory =
                SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        Schema schema = factory.newSchema(new ClassPathResource("personal/xml/jaxp/validator/employee.xsd").getFile());
        Validator validator = schema.newValidator();
        validator.validate(new StreamSource(new ClassPathResource("personal/xml/jaxp/validator/employee.xml").getFile()));
    }
}
