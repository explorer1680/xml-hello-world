package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.errorinfo;

import javax.xml.bind.ValidationEventHandler;
import javax.xml.bind.annotation.DomHandler;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.StringReader;
import java.io.StringWriter;

public class AHandler implements DomHandler<Object, StreamResult> {

    private static final String BIO_START_TAG = "<bio>";
    private static final String BIO_END_TAG = "</bio>";

    private StringWriter xmlWriter = new StringWriter();

    public StreamResult createUnmarshaller(ValidationEventHandler errorHandler) {
        return new StreamResult(xmlWriter);
    }

    public Object getElement(StreamResult rt) {
        String xml = rt.getWriter().toString();
//        System.out.println(xml);
        int beginIndex = xml.indexOf(BIO_START_TAG) + BIO_START_TAG.length();
        int endIndex = xml.indexOf(BIO_END_TAG);
//        return xml.substring(beginIndex, endIndex);
        return new Double("12345");
    }


    public Source marshal(Object n, ValidationEventHandler errorHandler) {
        System.out.println("in marshal");

        try {
            String xml = BIO_START_TAG + n + BIO_END_TAG;
            StringReader xmlReader = new StringReader(xml);
            return new StreamSource(xmlReader);
        } catch(Exception e) {
            throw new RuntimeException(e);
        }
    }

}
