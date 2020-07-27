package personal.xml.jaxp.entity.sax;

import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class SaxParser {
	
	public static void main(String[] args)
			throws SAXException, IOException, TransformerException, ParserConfigurationException {

		SAXParserFactory parserFactory = SAXParserFactory.newInstance();

        parserFactory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);

		SAXParser parser = parserFactory.newSAXParser();
		System.out.println(parser.getClass());
		XMLReader reader = parser.getXMLReader();

		SAXSource source = new SAXSource(reader, //comment out this reader, it works.
				new InputSource(new ClassPathResource("personal/xml/jaxp/entity/dom/xxe_inject.xml").getInputStream()));


		
		TransformerFactory factory = TransformerFactory.newInstance();
		 Transformer transformer = factory.newTransformer();

		transformer.transform(source, new StreamResult(System.out));
		 
	}
	

}
