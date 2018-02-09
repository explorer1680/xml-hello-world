package personal.xml.jaxp.trax.withsax.saxsource.basic;

import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class SaxSourceWithParserReaderTestRun {

	public static void main(String[] args)
			throws SAXException, IOException, TransformerException, ParserConfigurationException {

		SAXParserFactory parserFactory = SAXParserFactory.newInstance();
		SAXParser parser = parserFactory.newSAXParser();
		System.out.println(parser.getClass());
		XMLReader reader = parser.getXMLReader();

//		the following code is separate with SAXSource.
//		 reader.setContentHandler(new VoteHandler());
//
//		reader.parse(
//				new InputSource(new ClassPathResource("personal/xml/jaxp/trax/withsax/saxsource/basic/vote.xml").getInputStream()));

		System.out.println("--" + reader.getClass());

		SAXSource source = new SAXSource(reader, //comment out this reader, it works.
				new InputSource(new ClassPathResource("personal/xml/jaxp/trax/withsax/saxsource/basic/vote.xml").getInputStream()));


		StreamSource xsl = new StreamSource(
				new ClassPathResource("personal/xml/jaxp/trax/withsax/saxsource/basic/votes.xsl").getInputStream());

		TransformerFactory factory = TransformerFactory.newInstance();
		 Transformer transformer = factory.newTransformer(xsl);
//		Transformer transformer = factory.newTransformer();

		transformer.transform(source, new StreamResult(System.out));

	}
}
