package personal.xml.jaxb.bindingframework.annotation.elementwrapper;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.util.ArrayList;
import java.util.List;

public class WrapperTestRun {
    public static void main(String[] args) throws JAXBException {
        JAXBContext context = JAXBContext.newInstance(Configuration.class);

        Configuration configuration = new Configuration();

        List<Document> documents = new ArrayList<>();
        documents.add(new Document("a"));
        documents.add(new Document("b"));
        documents.add(new Document("c"));
        documents.add(new Document("d"));

        configuration.setDocuments(documents);

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(configuration, System.out);
    }
}
