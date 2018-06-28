package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.domhandler;

import javax.xml.bind.ValidationEventHandler;
import javax.xml.bind.annotation.DomHandler;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.StringReader;
import java.io.StringWriter;

public class StringHandler implements DomHandler<String, StreamResult> {

    private StringWriter xmlWriter = new StringWriter();

    private static final String HEAD = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";

    @Override
    public StreamResult createUnmarshaller(ValidationEventHandler errorHandler) {
        return new StreamResult(xmlWriter);
    }

    @Override
    public String getElement(StreamResult rt) {
        System.out.println("in getElement");
        System.out.println(rt.getWriter().toString());

        return rt.getWriter().toString();
    }

    @Override
    public Source marshal(String n, ValidationEventHandler errorHandler) {
        System.out.println("-------------");
        System.out.println(n);
        int i = n.indexOf(HEAD);
        System.out.println(n.substring(HEAD.length()));

        StringReader xmlReader = new StringReader(n.substring(HEAD.length()));
        return new StreamSource(xmlReader);
    }
}
