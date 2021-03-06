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

		SAXParserFactory parserFactory = SAXParserFactory.newInstance("com.sun.org.apache.xerces.internal.jaxp.SAXParserFactoryImpl", null);
		
		System.out.println(parserFactory);

//        parserFactory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
//		parserFactory.setFeature("http://xml.org/sax/features/external-general-entities", false);
//        parserFactory.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
//        parserFactory.setFeature("http://javax.xml.XMLConstants/feature/secure-processing", true); 
        
//		parserFactory.setFeature("http://xml.org/sax/features/external-general-entities", false);
//		parserFactory.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
		parserFactory.setFeature("http://javax.xml.XMLConstants/feature/secure-processing", true);
//		parserFactory.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);

        
//        parserFactory.setFeature("http://javax.xml.XMLConstants/feature/secure-processing", true);

		SAXParser parser = parserFactory.newSAXParser();
		System.out.println(parser.getClass());
		XMLReader reader = parser.getXMLReader();

		SAXSource source = new SAXSource(reader, //comment out this reader, it works.
				new InputSource(new ClassPathResource("personal/xml/jaxp/entity/dom/xxe_http.xml").getInputStream()));


		
		TransformerFactory factory = TransformerFactory.newInstance();
		 Transformer transformer = factory.newTransformer();

		transformer.transform(source, new StreamResult(System.out));
		 
	}
	

}
