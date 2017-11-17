package personal.xml.jaxp.stax.read.streamreader;

import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import java.util.ArrayList;
import java.util.List;

public class StaxStreamReaderTestRun {
    public static void main(String[] args) throws XMLStreamException {
        List empList = null;
        Employee currEmp = null;
        String tagContent = null;
        XMLInputFactory factory = XMLInputFactory.newInstance();
        XMLStreamReader reader = factory
                .createXMLStreamReader(StaxStreamReaderTestRun.class
                        .getResourceAsStream("sample.xml"));
        while (reader.hasNext()) {
            int event = reader.next();
            switch (event) {
                case XMLStreamConstants.START_ELEMENT:
                    if ("employee".equals(reader.getLocalName())) {
                        currEmp = new Employee();
                        currEmp.setId(Integer.parseInt(reader.getAttributeValue(0)));
                    }
                    if ("employees".equals(reader.getLocalName())) {
                        empList = new ArrayList<>();
                    }
                    break;

                case XMLStreamConstants.CHARACTERS:
                    tagContent = reader.getText().trim();
                    break;

                case XMLStreamConstants.END_ELEMENT:
                    switch (reader.getLocalName()) {
                        case "employee":
                            empList.add(currEmp);
                            break;
                        case "name":
                            currEmp.setName(tagContent);
                            break;
                        case "age":
                            currEmp.setAge(Integer.parseInt(tagContent));
                            break;
                    }
                    break;

                case XMLStreamConstants.START_DOCUMENT:
                    empList = new ArrayList<>();
                    break;
            }
        }
        empList.stream().forEach(System.out::println);
    }
}
