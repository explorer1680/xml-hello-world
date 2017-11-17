package personal.xml.jaxp.stax.write.eventwriter;

import org.springframework.core.io.FileSystemResource;

import javax.xml.stream.*;
import javax.xml.stream.events.XMLEvent;
import java.io.FileWriter;
import java.io.IOException;

public class EventWriterTestRun {

    public static void main(String[] args) throws XMLStreamException, IOException {
        XMLOutputFactory factory = XMLOutputFactory.newInstance();
        XMLEventFactory eventFactory = XMLEventFactory.newInstance();

        FileSystemResource resource = new FileSystemResource("output.xml");

        XMLEventWriter writer = factory.createXMLEventWriter(
                new FileWriter(resource.getFile()));


        XMLEvent event = eventFactory.createStartDocument();
        writer.add(event);

        event = eventFactory.createStartElement(
                "jenkov", "http://jenkov.com", "document");
        writer.add(event);

        event = eventFactory.createNamespace(
                "jenkov", "http://jenkov.com");
        writer.add(event);

        event = eventFactory.createAttribute
                ("attribute", "value");
        writer.add(event);

        event = eventFactory.createEndElement(
                "jenkov", "http://jenkov.com", "document");
        writer.add(event);

        writer.flush();
        writer.close();
    }

}
