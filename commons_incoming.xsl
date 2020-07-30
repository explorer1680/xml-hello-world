<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://appraisal.solidifi.com/schema/AppraisalOrderRequest/1.2" 
    xmlns:r="http://appraisal.solidifi.com/schema/AppraisalOrderRequest/1.2"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:template name="formatDateTime">
        <xsl:param name="date"/> <!-- 2002/11/25 12:00:00 -->
        <xsl:if test="string-length($date) > 17">
            <xsl:value-of select="xsd:dateTime(concat(substring($date,1,4), '-', substring($date,6,2), '-', substring($date,9,2), 'T', substring($date, 12)))"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="formatDateTime17">
        <xsl:param name="date"/> <!-- 2002/11/25 12:00:00 -->
        <xsl:if test="string-length($date) > 17">
            <xsl:value-of select="xsd:dateTime(concat(substring($date,1,4), '-', substring($date,6,2), '-', substring($date,9,2), 'T17:00:00'))"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="formatDateTime8">
        <xsl:param name="date"/> <!-- 2002/11/25 -->
        <xsl:if test="string-length($date) > 8">
            <xsl:value-of select="xsd:dateTime(concat(substring($date,1,4), '-', substring($date,6,2), '-', substring($date,9,2), 'T17:00:00'))"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="formatDateTime6">
        <xsl:param name="date"/>
          <xsl:choose>
            <xsl:when test="string-length($date) > 8">   <!--12/25/2010 -->
                <xsl:value-of select="xsd:dateTime(concat(substring($date,7,4), '-', substring($date,1,2), '-', substring($date,4,2), 'T17:00:00'))"/>
            </xsl:when>
            <xsl:otherwise>   <!--12/25/10 -->
                <xsl:value-of select="xsd:dateTime(concat('20', substring($date,7,2), '-', substring($date,1,2), '-', substring($date,4,2), 'T17:00:00'))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="formatDateTimeX">
        <xsl:param name="date"/>
        <xsl:param name="setTime"/>
        <xsl:if test="string-length($date) > 17">
            <xsl:value-of select="xsd:dateTime(concat(substring($date,1,4), '-', substring($date,6,2), '-', substring($date,9,2), 'T', $setTime,':00:00'))"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="formatDate">
        <xsl:param name="date"/>
        <xsl:if test="string-length($date) > 8">
            <xsl:value-of select="xsd:date(concat(substring($date,1,4), '-', substring($date,6,2), '-', substring($date,9,2)))"/>
        </xsl:if>

    </xsl:template>

    <xsl:template name="formatDateWithTime">
        <xsl:param name="date"/>
        <xsl:param name="setTime"/>
        <xsl:value-of select="xsd:dateTime(concat(substring($date,1,4), '-', substring($date,6,2), '-', substring($date,9,2), 'T', $setTime))"/>
    </xsl:template>

    <xsl:template name="formatDateTimeFNC">
        <xsl:param name="date"/>
        <!--27-Feb-2013 10:59 AM -->
        <xsl:value-of select="concat(substring($date,8,4),'-')"/>
        <xsl:variable name='month'>
            <xsl:value-of select="substring($date,4,3)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="lower-case($month)='jan'">
                <xsl:text>01</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='feb'">
                <xsl:text>02</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='mar'">
                <xsl:text>03</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='apr'">
                <xsl:text>04</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='may'">
                <xsl:text>05</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='jun'">
                <xsl:text>06</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='jul'">
                <xsl:text>07</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='aug'">
                <xsl:text>08</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='sep'">
                <xsl:text>09</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='oct'">
                <xsl:text>10</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='nov'">
                <xsl:text>11</xsl:text>
            </xsl:when>
            <xsl:when test="lower-case($month)='dec'">
                <xsl:text>12</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$month"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="concat('-',substring($date,1,2))"/>
        <xsl:value-of select="'T'"/>
        <xsl:choose>
            <xsl:when test="lower-case(substring($date,19,2))='am'">
                <xsl:choose>
                    <xsl:when test="substring($date,13,2)='12'">
                        <xsl:text>00:</xsl:text>
                        <xsl:value-of select="substring($date,16,2)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring($date,13,5)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="substring($date,13,2)='12'">
                        <xsl:text>12:</xsl:text>
                        <xsl:value-of select="substring($date,16,2)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="number(substring($date,13,2))+12"/>
                        <xsl:value-of select="':'"/>
                        <xsl:value-of select="substring($date,16,2)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="':00'"/>
    </xsl:template>

  <xsl:template name="contact">
        <xsl:for-each select="*">
            <xsl:if test="not(empty(index-of(('Name', 'DayPhone', 'EvenPhone', 'CellPhone', 'Pager', 'EMail', 'Fax'), name(.))))">
                <xsl:element name="{local-name()}">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="yesNo">
        <xsl:choose>
            <xsl:when test="'yes' = lower-case(.)">
                <xsl:text>Y</xsl:text>
            </xsl:when>
            <xsl:when test="'no' = lower-case(.)">
                <xsl:text>N</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="RealECToRealEC_OccupancyMapping">
        <xsl:param name="occupancyCode"/>
        <xsl:choose>
            <xsl:when test="$occupancyCode = '2ND-RES'"><xsl:text>2nd Home</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'ABANDONED'"><xsl:text>Abandoned</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'ADVERSEOCCUPIED'"><xsl:text>Adverse Occupied</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'NON-OWNER'"><xsl:text>Non-Owner</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'OWNER'"><xsl:text>Owner</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'REMOVEDORDESTROYED'"><xsl:text>Removed Or Destroyed</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'TENANT'"><xsl:text>Tenant Occupied</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'UNKNOWN'"><xsl:text>Unknown</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'VACANT'"><xsl:text>Vacant</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'OTHER'"><xsl:text>Other</xsl:text></xsl:when>
            <!-- Add additional occupancy code mappings from Usage Type -->
            <xsl:when test="$occupancyCode = 'INVES'"><xsl:text>Investment</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'PRIMRES'"><xsl:text>Primary Residence</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'SECHOM'"><xsl:text>Secondary Residence</xsl:text></xsl:when>
            <xsl:when test="$occupancyCode = 'Refer to Property Type'"><xsl:text>Other</xsl:text></xsl:when>  
            <xsl:otherwise><xsl:text>Relationship: n/a</xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    
    <xsl:template name="PartyType_Mapping">
        <xsl:param name="partyType"/>
        <xsl:choose>
            <xsl:when test="$partyType = 'BORR'"><xsl:text>BORR</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'COAPP'"><xsl:text>COAPP</xsl:text></xsl:when>            
            <xsl:when test="$partyType = 'ACCTEXEC'"><xsl:text>ACCTEXEC</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'APP'"><xsl:text>APP</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'APPRAISALCOMPANY'"><xsl:text>APPRAISALCOMPANY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'APPRAISER'"><xsl:text>APPRAISER</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'APPRAISERSUPERVISOR'"><xsl:text>APPRAISERSUPERVISOR</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'APPRAISERTRAINEE'"><xsl:text>APPRAISERTRAINEE</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'ATNY'"><xsl:text>ATNY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'ATTORNEYINFACT'"><xsl:text>ATTORNEYINFACT</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'AUTHORIZEDREP'"><xsl:text>AUTHORIZEDREP</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'BLDR'"><xsl:text>BLDR</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'BLDRCOMPANY'"><xsl:text>BLDRCOMPANY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'BORRREP'"><xsl:text>BORRREP</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'BORRTRANS'"><xsl:text>BORRTRANS</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'BYAGNT'"><xsl:text>BYAGNT</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'CFDS'"><xsl:text>CFDS</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'CLOSINGAGENT'"><xsl:text>CLOSINGAGENT</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'CORRESPONDENTLENDER'"><xsl:text>CORRESPONDENTLENDER</xsl:text></xsl:when>                       
            <xsl:when test="$partyType = 'CPATAXPREPARER'"><xsl:text>CPATAXPREPARER</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'GIFTDONOR'"><xsl:text>GIFTDONOR</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'HAZARDINSURANCECO'"><xsl:text>HAZARDINSURANCECO</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'HUD1SETTLEMENTAGENT'"><xsl:text>HUD1SETTLEMENTAGENT</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'LEND'"><xsl:text>LEND</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'LENDERBRANCH'"><xsl:text>LENDERBRANCH</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'LOANCONT'"><xsl:text>LOANCONT</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'LOANOFF'"><xsl:text>LOANOFF</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'LOANORIGINATOR'"><xsl:text>LOANORIGINATOR</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'LOANPRO'"><xsl:text>LOANPRO</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'LOANTITLEHOLDERCOMP'"><xsl:text>LOANTITLEHOLDERCOMP</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'LSAGNT'"><xsl:text>LSAGNT</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'MORT'"><xsl:text>MORT</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'NOTARY'"><xsl:text>NOTARY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'PROPMGR'"><xsl:text>PROPMGR</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'REAL'"><xsl:text>REAL</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'REALESTATECOMPANY'"><xsl:text>REALESTATECOMPANY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'REQUESTINGPARTY'"><xsl:text>REQUESTINGPARTY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'REVIEWAPPRAISER'"><xsl:text>REVIEWAPPRAISER</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'SELL'"><xsl:text>SELL</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'SELLINGCOMPANY'"><xsl:text>SELLINGCOMPANY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'SELLERATTORNEY'"><xsl:text>SELLERATTORNEY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'SETTLEMENTCOMPANY'"><xsl:text>SETTLEMENTCOMPANY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'SHORTSALEBUYER'"><xsl:text>SHORTSALEBUYER</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'TITLECOMPANY'"><xsl:text>TITLECOMPANY</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'TITLEOFF'"><xsl:text>TITLEOFF</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'TITLEUNDERWRITER'"><xsl:text>TITLEUNDERWRITER</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'SPOUSE'"><xsl:text>SPOUSE</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'SRVCR'"><xsl:text>SRVCR</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'THIRDPARTYORIGINATOR'"><xsl:text>THIRDPARTYORIGINATOR</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'UNDERWRITER'"><xsl:text>UNDERWRITER</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'VEND'"><xsl:text>VEND</xsl:text></xsl:when>
            <xsl:when test="$partyType = 'OTHER'"><xsl:text>OTHER</xsl:text></xsl:when>
            
            <xsl:otherwise><xsl:text>UNKNOWN</xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>  

	<xsl:template name="get5DigitZipCode">
		<xsl:param name="zip"/>
		<xsl:choose>
			<xsl:when test="contains($zip, '-')">
				<xsl:value-of select="substring-before($zip,'-')"/>
			</xsl:when>
			<xsl:when test="string-length($zip) > 5">
				<xsl:value-of select="substring($zip, 1, 5)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$zip"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

    <xsl:template name="convertStringToNumber">
        <xsl:param name="numString" />
        <xsl:variable name="AllowedSymbols" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz()*%$#@!~&lt;&gt;,?[]=- +   /\ '"/>
        <xsl:value-of select="number(translate($numString, $AllowedSymbols, ''))"/>
    </xsl:template>	

    <xsl:template name="formatFhaNumber">
        <xsl:param name="originalFhaNumber"/>
        <xsl:analyze-string select="$originalFhaNumber" regex="^(\d{{3}})[-]?(\d{{7}})$">
            <xsl:matching-substring>
                <xsl:value-of select="concat(regex-group(1), '-', regex-group(2))"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="$originalFhaNumber"/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    
    <xsl:function name="r:extractNumberFromDollarCurrency">
        <xsl:param name="dollarCurrency"/>
        <xsl:value-of select="replace(replace($dollarCurrency, '\$', ''), ',', '')"/>
    </xsl:function>
    
    
    
    <!-- FNC OrderCreate common: -->
    <xsl:template name="FNC_head">
        <requesterName>
            <xsl:value-of select="ORDER/ELEMENTS/FOLDER/@PORT_ID"/>
        </requesterName>
        <requesterReferenceNumber>
            <xsl:value-of select="ORDER/ELEMENTS/FOLDER/@NUMBER"/>
        </requesterReferenceNumber>
        <progressAdvanceNumber/>
        <appraisalPurpose>
            <xsl:value-of select="ORDER/ELEMENTS/LOAN_PURPOSE"/>
        </appraisalPurpose>
        <appraisalProductRequested>
            <xsl:value-of select="ORDER/ELEMENTS/SERVICE_ID"/>
        </appraisalProductRequested>
        <partnerTransactionId>
            <xsl:value-of select="ORDER/ELEMENTS/ORDER_ID"/>
        </partnerTransactionId>
    </xsl:template>
    
    <xsl:template name="FNC_borrowers">
        <xsl:for-each select="ORDER/CONTACTS/CONTACT[lower-case(TYPE)='borrower' or TYPE='Co-Borrower']">
            <borrower>
                <primaryBorrowerIndicator>
                    <xsl:choose>
                        <xsl:when test="position()=1 and lower-case(TYPE)='borrower'">Y</xsl:when>
                        <xsl:otherwise>N</xsl:otherwise>
                    </xsl:choose>
                </primaryBorrowerIndicator>
                <xsl:apply-templates select="NAME"/>
                <xsl:apply-templates select="EMAIL"/>
                <xsl:apply-templates select="PHONE[1]"/>
                
            </borrower>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="/PUSHORDER/ORDER/CONTACTS/CONTACT/NAME">
        <firstName>
            <xsl:value-of select="substring-before(., ' ')"/>
        </firstName>
        <lastName>
            <xsl:value-of select="substring-after(., ' ')"/>
        </lastName>
    </xsl:template>
    
    <xsl:template match="/PUSHORDER/ORDER/CONTACTS/CONTACT/EMAIL">
        <email>
            <xsl:value-of select="."/>
        </email>
    </xsl:template>
    
    <xsl:template match="/PUSHORDER/ORDER/CONTACTS/CONTACT/PHONE">
        <homePhoneNumber>
            <xsl:value-of select="MAIN"/>
            <xsl:if test="PHONE/EXT!=''"> ext </xsl:if>
            <xsl:value-of select="EXT"/>
        </homePhoneNumber>
    </xsl:template>
    
    <xsl:template name="FNC_propertyCustom">
        <xsl:param name="customTag"/>
        
        <property>
            <legalRef>
                <xsl:value-of select="ORDER/ELEMENTS/LEGAL_DESCRIPTION"/>
            </legalRef>
            <typeOfProperty>
                <xsl:value-of select="ORDER/ELEMENTS/PROP_TYPE"/>
            </typeOfProperty>
            <address>
                <unitNumber>
                    <xsl:value-of select="ORDER/ELEMENTS/PROP_UNITNO"/>
                </unitNumber>
                <streetNumber>
                    <xsl:value-of select="ORDER/ELEMENTS/STREET_NO"/>
                </streetNumber>
                <suffix/>
                <streetDirection/>
                <streetType/>
                <streetName>
                    <xsl:value-of select="ORDER/ELEMENTS/STREET"/>
                </streetName>
                <city>
                    <xsl:value-of select="ORDER/ELEMENTS/CITY"/>
                </city>
                <province>
                    <xsl:value-of select="ORDER/ELEMENTS/STATE"/>
                </province>
                <propertyType/>
                <postalCode>
                    <xsl:call-template name="get5DigitZipCode">
                        <xsl:with-param name="zip" select="ORDER/ELEMENTS/ZIP"/>
                    </xsl:call-template>
                </postalCode>
            </address>
            <salesRegion>
                <xsl:call-template name="FNC_customTag">
                    <xsl:with-param name="tagNumber">
                        <xsl:value-of select="$customTag"/>
                    </xsl:with-param>
                </xsl:call-template>
            </salesRegion>
        </property>
    </xsl:template>
    
    <xsl:template name="FNC_customTag">
        <xsl:param name="tagNumber"/>
        <xsl:choose>
            <xsl:when test="$tagNumber=1">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM1"/>
            </xsl:when>
            <xsl:when test="$tagNumber=2">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM2"/>
            </xsl:when>
            <xsl:when test="$tagNumber=3">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM3"/>
            </xsl:when>
            <xsl:when test="$tagNumber=4">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM4"/>
            </xsl:when>
            <xsl:when test="$tagNumber=5">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM5"/>
            </xsl:when>
            <xsl:when test="$tagNumber=6">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM6"/>
            </xsl:when>
            <xsl:when test="$tagNumber=7">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM7"/>
            </xsl:when>
            <xsl:when test="$tagNumber=8">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM8"/>
            </xsl:when>
            <xsl:when test="$tagNumber=9">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM9"/>
            </xsl:when>
            <xsl:when test="$tagNumber=10">
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/CUSTOM10"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="FNC_appraisalFileInformationStandard">
        <appraisalFileInformation>
            <clientRefNumber>
                <xsl:value-of select="ORDER/ELEMENTS/LOAN_NUMBER"/>
            </clientRefNumber>
            <clientFhaNumber>
                <xsl:call-template name="formatFhaNumber">
                    <xsl:with-param name="originalFhaNumber">
                        <xsl:value-of select="ORDER/ELEMENTS/CASE_NUMBER"/>
                    </xsl:with-param>
                </xsl:call-template>
            </clientFhaNumber>
            <loanType>
                <xsl:value-of select="ORDER/ELEMENTS/LOAN_TYPE"/>
            </loanType>
            <originatorsEmail/>
            <underwriterEmail/>
            <xsl:call-template name="FNC_salePrice"/>
            <xsl:call-template name="FNC_mortgageAmount"/>
            <costAllocationCentre>
                <xsl:value-of select="ORDER/ELEMENTS/COST_CENTER"/>
            </costAllocationCentre>
            <dueDate/>
            <clientDueDate/>
            <contingencyDate/>
            <closeDate/>
            <speacialInstructions/>
        </appraisalFileInformation>
    </xsl:template>
    
    <xsl:template name="FNC_appraisalOrderer">
        <appraisalOrderer>
            <ordererId>FNC</ordererId>
        </appraisalOrderer>
    </xsl:template>
    
    <xsl:template name="FNC_appraisalContact">
        <xsl:for-each select="ORDER/CONTACTS/CONTACT[ACCESS='YES']">
            <xsl:if test="position()=1">
                <appraisalContact>
                    <xsl:apply-templates select="NAME"/>
                    <xsl:apply-templates select="EMAIL"/>
                    <homePhoneNumber>
                        <xsl:value-of select="PHONE/MAIN"/>
                        <xsl:if test="PHONE/EXT!=''"> ext </xsl:if>
                        <xsl:value-of select="PHONE/EXT"/>
                    </homePhoneNumber>
                    <accessContactRelation>
                        <xsl:value-of select="TYPE"/>
                    </accessContactRelation>
                    <accessInstructions>
                        <xsl:value-of select="../../ELEMENTS/ACCE_INST"/>
                    </accessInstructions>
                    <additionalContactList>
                        <xsl:for-each select="../../../ORDER/CONTACTS/CONTACT[ACCESS='YES']">
                            <xsl:if test="position()!=1">
                                <additionalContact>
                                    <type>
                                        <xsl:value-of select="TYPE"/>
                                    </type>
                                    <name>
                                        <xsl:value-of select="NAME"/>
                                    </name>
                                    <xsl:for-each select="PHONE">
                                        <phone>
                                            <xsl:value-of select="MAIN"/>
                                            <xsl:if test="EXT!=''"> ext </xsl:if>
                                            <xsl:value-of select="EXT"/>
                                        </phone>
                                    </xsl:for-each>
                                    <xsl:apply-templates select="EMAIL"/>
                                </additionalContact>
                            </xsl:if>
                        </xsl:for-each>
                    </additionalContactList>
                </appraisalContact>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="FNC_appraisalRequester">
        <appraisalRequester>
            <requestingCompanyId>
                <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/LOANOFFICER_ORG"/>
            </requestingCompanyId>
        </appraisalRequester>
    </xsl:template>
    
    <xsl:template name="FNC_order">
        <rushOrder>
            <xsl:choose>
                <xsl:when test="ORDER/ELEMENTS/RUSH and ORDER/ELEMENTS/RUSH='True'">true</xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
        </rushOrder>
    </xsl:template>
    
    
    <xsl:template name="FNC_salePrice">
        <salePrice>
            <xsl:choose>
                <xsl:when test="ORDER/ELEMENTS/SALES_PRICE != ''">
                    <xsl:value-of select="r:extractNumberFromDollarCurrency(ORDER/ELEMENTS/SALES_PRICE)"/>
                </xsl:when>
                <xsl:when test="ORDER/ELEMENTS/OWNERSESTIMATEDVALUE != ''">
                    <xsl:value-of select="r:extractNumberFromDollarCurrency(ORDER/ELEMENTS/OWNERSESTIMATEDVALUE)"/>
                </xsl:when>
            </xsl:choose>
        </salePrice>
    </xsl:template>
    
    <xsl:template name="FNC_mortgageAmount">
        <mortgageAmount>
            <xsl:value-of select="r:extractNumberFromDollarCurrency(ORDER/ELEMENTS/LOAN_AMOUNT)"/>
        </mortgageAmount>
    </xsl:template>
    
    <xsl:template name="FNC_brokerInfo">
        <xsl:if test="/PUSHORDER/ORDER/ELEMENTS != ''">
            <brokerInfo>
                <Name>
                    <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/PROCESSOR_NAME"/>
                </Name>
                <DayPhone>
                    <xsl:choose>
                        <xsl:when test="/PUSHORDER/ORDER/ELEMENTS/PROCESSOR_PHONE != ''">
                            <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/PROCESSOR_PHONE"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>--</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </DayPhone>
                <EvenPhone>--</EvenPhone>
                <EMail>
                    <xsl:value-of select="/PUSHORDER/ORDER/ELEMENTS/PROCESSOR_EMAIL"/>
                </EMail>
            </brokerInfo>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
