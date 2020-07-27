package personal.xml.jaxp.entity.sax;

import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

public class SaxReader {
	public static void main(String[] args)
			throws SAXException, IOException, TransformerException, ParserConfigurationException {

		// method 1 to get XMLReader: (the crimson project has been deprecated)
//		 String parserClass = "org.apache.crimson.parser.XMLReaderImpl";
//        String parserClass = "org.apache.xerces.parsers.SAXParser";
//		 XMLReader reader = XMLReaderFactory.createXMLReader(parserClass);

		// method 2 to get XMLReader: (it not works)
		// com.sun.org.apache.xerces.internal.parsers.SAXParser
		XMLReader reader = XMLReaderFactory.createXMLReader();
		reader.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);

		SAXSource source = new SAXSource(reader,
				new InputSource(new ClassPathResource("personal/xml/jaxp/entity/dom/xxe_inject.xml").getInputStream()));


		TransformerFactory factory = TransformerFactory.newInstance();
		 Transformer transformer = factory.newTransformer();

		transformer.transform(source, new StreamResult(System.out));
	}
}
