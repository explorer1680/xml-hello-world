package personal.xml.jaxp.entity.dom;

import java.io.IOException;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class DomEntity {

	/**
	 * @param args
	 * @throws ParserConfigurationException
	 * @throws IOException
	 * @throws SAXException
	 * @throws TransformerException
	 * @throws XPathExpressionException
	 */

	private static final Logger LOG = LoggerFactory.getLogger(DomEntity.class);

	public static void main(String[] args) {

		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			factory.setExpandEntityReferences(true);
			
	        factory.setFeature("http://xml.org/sax/features/external-general-entities", false);
	        factory.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
	        factory.setFeature("http://javax.xml.XMLConstants/feature/secure-processing", true);
//	        factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
			
	        factory.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
			
			
			DocumentBuilder builder = factory.newDocumentBuilder();
//        Document document = builder.parse(new ClassPathResource("personal/xml/jaxp/entity/dom/entity1.xml").getInputStream());
//        Document document = builder.parse(new ClassPathResource("personal/xml/jaxp/entity/dom/entity3.xml").getInputStream());
//        Document document = builder.parse(new ClassPathResource("personal/xml/jaxp/entity/dom/internal_parameter_entity.xml").getInputStream());
//        Document document = builder.parse(new ClassPathResource("personal/xml/jaxp/entity/dom/xxe_inject.xml").getInputStream());
//        Document document = builder.parse(new ClassPathResource("personal/xml/jaxp/entity/dom/xxe_http.xml").getInputStream());
			
			
			Document document = builder
					.parse(new ClassPathResource("personal/xml/jaxp/entity/dom/entity_recursion.xml").getInputStream());

			
			
			//			Document document = builder
//					.parse(new ClassPathResource("personal/xml/jaxp/entity/dom/normal.xml").getInputStream());

			XPathFactory xPathFactory = XPathFactory.newInstance();
			XPath xPath = xPathFactory.newXPath();
			XPathExpression xPathExpression = xPath.compile("//text()[normalize-space()='']");
			NodeList nodeList = (NodeList) xPathExpression.evaluate(document, XPathConstants.NODESET);

			for (int i = 0; i < nodeList.getLength(); i++) {
				Node node = nodeList.item(i);
				node.getParentNode().removeChild(node);
			}

//        System.out.println(document.getChildNodes().item(1).getChildNodes().item(1).getTextContent().toString());

			DOMSource domSource = new DOMSource(document);

			StringWriter stringWriter = new StringWriter();
			StreamResult streamResult = new StreamResult(stringWriter);

			TransformerFactory tf = TransformerFactory.newInstance();
//			tf.setAttribute("indent-number", new Integer(4));
			Transformer transformer = tf.newTransformer();

			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
			transformer.setOutputProperty(OutputKeys.METHOD, "xml");
//        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
			transformer.transform(domSource, streamResult);

			System.out.println(stringWriter);

		} catch (Exception e) {
			LOG.error("Error!", e);
		}
	}

}
