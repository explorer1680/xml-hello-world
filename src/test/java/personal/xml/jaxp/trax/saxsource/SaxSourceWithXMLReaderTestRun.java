package personal.xml.jaxp.trax.saxsource;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.*;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class SaxSourceWithXMLReaderTestRun {
	public static void main(String[] args)
			throws SAXException, IOException, TransformerException, ParserConfigurationException {

		// method 1 to get XMLReader:
		// String parserClass = "org.apache.crimson.parser.XMLReaderImpl";
		// XMLReader reader = XMLReaderFactory.createXMLReader(parserClass);

		// method 2 to get XMLReader: (it not works)
		// SAXParserFactory parserFactory = SAXParserFactory.newInstance();
		// SAXParser parser = parserFactory.newSAXParser();
		// System.out.println(parser.getClass());
		// XMLReader reader = parser.getXMLReader();

		// method 3 to get XMLReader:
		// com.sun.org.apache.xerces.internal.parsers.SAXParser
		XMLReader reader = XMLReaderFactory.createXMLReader();

		// reader.setContentHandler(new VoteHandler());

		// reader.parse(new InputSource(new
		// ClassPathResource("personal/xml/jaxp/trax/saxsource/vote.xml").getInputStream()));

		System.out.println(reader.getClass());

		SAXSource source = new SAXSource(reader,
				new InputSource(new ClassPathResource("personal/xml/jaxp/trax/saxsource/vote.xml").getInputStream()));

		// SAXSource source = new SAXSource(new InputSource(new
		// ClassPathResource("personal/xml/jaxp/trax/saxsource/vote.xml").getInputStream()));

		StreamSource xsl = new StreamSource(
				new ClassPathResource("personal/xml/jaxp/trax/saxsource/votes.xsl").getInputStream());

		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer transformer = factory.newTransformer(xsl);
		// Transformer transformer = factory.newTransformer();

		transformer.transform(source, new StreamResult(System.out));

	}
}
