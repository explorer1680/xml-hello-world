package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.domhandler;

import java.io.StringWriter;

import javax.xml.bind.ValidationEventHandler;
import javax.xml.bind.annotation.DomHandler;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamResult;

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
