package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.domhandler;

import javax.xml.bind.ValidationEventHandler;
import javax.xml.bind.annotation.DomHandler;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.StringReader;
import java.io.StringWriter;

public class CHandler implements DomHandler<E, StreamResult>{

    @Override
    public StreamResult createUnmarshaller(ValidationEventHandler errorHandler) {
        System.out.println("in createUnmarshaller");
        return new StreamResult(new StringWriter());
    }

    @Override
    public E getElement(StreamResult rt) {
        System.out.println("in getElement");
        System.out.println(rt.getWriter().toString());

        return new E(rt.getWriter().toString());
    }

    @Override
    public Source marshal(E n, ValidationEventHandler errorHandler) {
        System.out.println("in marshal");
        return null;
    }

}
