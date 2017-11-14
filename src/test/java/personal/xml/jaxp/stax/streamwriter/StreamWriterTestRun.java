package personal.xml.jaxp.stax.streamwriter;

import com.sun.xml.internal.txw2.output.IndentingXMLStreamWriter;
import org.springframework.core.io.FileSystemResource;

import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;
import java.io.FileWriter;
import java.io.IOException;

public class StreamWriterTestRun {

    public static void main(String[] args) throws XMLStreamException, IOException {

        XMLOutputFactory factory = XMLOutputFactory.newInstance();

        FileSystemResource resource = new FileSystemResource("output.xml");

        XMLStreamWriter writer = new IndentingXMLStreamWriter(factory.createXMLStreamWriter(
                new FileWriter(resource.getFile())));

//        XMLStreamWriter writer = factory.createXMLStreamWriter(
//                new FileWriter(resource.getFile()));

        writer.writeStartDocument();
        writer.writeStartElement("document");
        writer.writeStartElement("data");
        writer.writeAttribute("name", "value");
        writer.writeAttribute("age", "56");
        writer.writeEndElement();
        writer.writeEndElement();
        writer.writeEndDocument();

        writer.flush();
        writer.close();
    }
}