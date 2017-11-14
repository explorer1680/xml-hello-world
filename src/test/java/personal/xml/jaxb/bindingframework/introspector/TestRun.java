package personal.xml.jaxb.bindingframework.introspector;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.JAXBIntrospector;

public class TestRun {
    public static void main(String[] args) throws JAXBException {

        JAXBContext context = JAXBContext.newInstance(Cup.class, Table.class);
        JAXBIntrospector introspector = context.createJAXBIntrospector();

        Table table = new Table("white");

        System.out.println("object from Table is a JAXB element? " + introspector.isElement(table));

        Cup cup = new Cup("red");

        System.out.println("object from Cup is a JAXB element? " + introspector.isElement(cup));

        System.out.println(introspector.getElementName(cup));
        System.out.println(JAXBIntrospector.getValue(cup));

        System.out.println(introspector.getElementName(table));
        System.out.println(JAXBIntrospector.getValue(table));
    }
}
