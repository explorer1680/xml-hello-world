package personal.xml.jaxb.bindingframework.marshalling.wrapper;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.namespace.QName;
import java.io.StringWriter;

public class WapperTestRun {
    public static void main(String[] args) throws JAXBException {
        JAXBContext context = JAXBContext.newInstance(ProductElement.class, Product.class);

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

        StringWriter stringWriter = new StringWriter();

        Product product = new Product("name", "description");

        QName qName = new QName("myNameSpace", "product2");

        JAXBElement element = new JAXBElement(qName, ProductElement.class, product);
//        ProductElement element = new ProductElement("name", "description");

        marshaller.marshal(element, stringWriter);

        System.out.println(stringWriter);
    }
}
