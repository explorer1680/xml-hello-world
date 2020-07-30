<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://appraisal.solidifi.com/schema/AppraisalOrderRequest/1.2" xmlns:xsd="http://www.w3.org/2001/XMLSchema" version="2.0" xmlns:ins="http://investor.redihive.com/schema/Investor">
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="orderNumber">NA0000000</xsl:param>

  <xsl:include href="commons_incoming.xsl"/>

  <xsl:template match="/RealEC-XML">
    <AppraisalRequest
        xmlns="http://appraisal.solidifi.com/schema/AppraisalOrderRequest/1.2"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://appraisal.solidifi.com/schema/AppraisalOrderRequest/1.2 AppraisalOrderRequest.xsd">
      <xsl:apply-templates select="Transaction"/>
    </AppraisalRequest>
  </xsl:template>

  <xsl:template match="Transaction">
    <xsl:apply-templates select="ProductList/Product[1]"/>

    <xsl:apply-templates select="PropertyList/Property[1]">
      <xsl:with-param name="orderNumber" select="$orderNumber" />
      <xsl:with-param name="costCenter" select="CostCenter"/>
      <xsl:with-param name="broker" select="LoanList/Loan[1]/Contact"/>
      <xsl:with-param name="loanofficer" select="PartyList/Party[Type='LOANOFF'][1]"/>
    </xsl:apply-templates>

    <xsl:apply-templates select="LoanList/Loan[1]"/>

    <partnerClientId><xsl:value-of select="RECClientID"/></partnerClientId>
    <partnerTransactionId><xsl:value-of select="TransactionID"/></partnerTransactionId>
    <partnerGMTOffset><xsl:value-of select="../Header/GMTOffset"/></partnerGMTOffset>
    <!-- <xsl:value-of select=""/> -->

    <xsl:call-template name="propertyLoanAddl"/>

    <xsl:call-template name="propertyAddl"/>

    <xsl:call-template name="productAddl"/>

    <xsl:call-template name="partyList"/>

    <xsl:call-template name="brokerInfo">
      <xsl:with-param name="contact" select="LoanList/Loan[1]/Contact" />
    </xsl:call-template>

    <xsl:call-template name="orderMessages" />
    <xsl:call-template name="orderNotes" />

    <xsl:call-template name="customFields"/>
  </xsl:template>

  <xsl:template name="customFields">
    <customFields>
      <xsl:if test="ProductList/Product[1]/ProductCode">
        <customField>
          <extid>5</extid>
          <extvalue><xsl:value-of select="ProductList/Product[1]/ProductCode"/></extvalue>
        </customField>
      </xsl:if>
      <xsl:apply-templates select="CostCenter"/>
      <xsl:for-each select="ProductList/Product[1]/ReferenceNumberList/*">
        <xsl:if test="Type = 'LenderProductCode'">
          <customField>
            <extid>26</extid>
            <extvalue>
              <xsl:value-of select="Reference"/>
            </extvalue>
          </customField>
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="ProductList/Product[1]/ServiceProductNameAddOnList/*">
        <customField>
          <extid>27</extid>
          <extvalue>
            <xsl:value-of select="ServiceProductNameAddOnIdentifier"/>
          </extvalue>
        </customField>
      </xsl:for-each>
      <xsl:for-each select="ProductList/Product[1]/ServiceProductNameAddOnList/*">
        <customField>
          <extid>28</extid>
          <extvalue>
            <xsl:value-of select="ServiceProductNameAddOnDescription"/>
          </extvalue>
        </customField>
      </xsl:for-each>
      <xsl:if test="PropertyList/Property[1]/ProjectLegalStructureType">
        <customField>
          <extid>29</extid>
          <extvalue>
            <xsl:value-of select="PropertyList/Property[1]/ProjectLegalStructureType"/>
          </extvalue>
        </customField>
      </xsl:if>
      <xsl:if test="PropertyList/Property[1]/IsDepartingResidenceIndicator">
        <customField>
          <extid>30</extid>
          <extvalue>
            <xsl:value-of select="PropertyList/Property[1]/IsDepartingResidenceIndicator"/>
          </extvalue>
        </customField>
      </xsl:if>
      <xsl:for-each select="ProductList/Product[1]/AddlProductDataList/*">
        <xsl:if test="DataName != 'NotificationStartDate'">
          <customField>
            <xsl:choose>
              <xsl:when test="DataName = 'ServicingDefaultAU'"><extid>31</extid></xsl:when>
              <xsl:when test="DataName = 'BusinessLineType'"><extid>32</extid></xsl:when>
              <xsl:when test="DataName = 'BusinessLineStructureType'"><extid>33</extid></xsl:when>
              <xsl:when test="DataName = 'BusinessAgreementGroupCode'"><extid>34</extid></xsl:when>
              <xsl:when test="DataName = 'BusinessProgramCode'"><extid>35</extid></xsl:when>
              <xsl:when test="DataName = 'BusinessTypeCode'"><extid>36</extid></xsl:when>
              <xsl:when test="DataName = 'FulfillmentFundingEntity'"><extid>37</extid></xsl:when>
              <xsl:when test="DataName = 'EconomicFundingEntity'"><extid>38</extid></xsl:when>
              <xsl:when test="DataName = 'BranchAUFundingEntityNbr'"><extid>39</extid></xsl:when>
              <xsl:when test="DataName = 'RequestingPartyFundingEntityNbr'"><extid>40</extid></xsl:when>
              <xsl:when test="DataName = 'SalesFundingEntity'"><extid>41</extid></xsl:when>
              <xsl:when test="DataName = 'SourceFundingEntity'"><extid>42</extid></xsl:when>
              <xsl:when test="DataName = 'LineOfBusiness'"><extid>43</extid></xsl:when>
              <xsl:when test="DataName = 'SalesAU'"><extid>44</extid></xsl:when>
              <xsl:when test="DataName = 'FulfillmentAU'"><extid>45</extid></xsl:when>
              <xsl:when test="DataName = 'SourceAU'"><extid>46</extid></xsl:when>
              <xsl:when test="DataName = 'SourceAUName'"><extid>47</extid></xsl:when>
              <xsl:when test="DataName = 'EconomicAU'"><extid>48</extid></xsl:when>
              <xsl:when test="DataName = 'BuilderProjectID'"><extid>49</extid></xsl:when>
              <xsl:when test="DataName = 'BuilderProjectName'"><extid>50</extid></xsl:when>
              <xsl:when test="DataName = 'TeamID'"><extid>51</extid></xsl:when>
              <xsl:when test="DataName = 'RequestingPartyAU'"><extid>52</extid></xsl:when>
              <xsl:when test="DataName = 'FulfillmentAUName'"><extid>53</extid></xsl:when>
              <xsl:when test="DataName = 'BranchAU'"><extid>54</extid></xsl:when>
              <xsl:when test="DataName = 'ClientOrderNumber'"><extid>55</extid></xsl:when>
              <xsl:when test="DataName = 'MasterSessionID'"><extid>56</extid></xsl:when>
              <xsl:when test="DataName = 'ClientPartnerID'"><extid>57</extid></xsl:when>
              <xsl:when test="DataName = 'StatusCorrelationID'"><extid>58</extid></xsl:when>
              <xsl:when test="DataName = 'ApplicationID'"><extid>59</extid></xsl:when>
              <xsl:when test="DataName = 'ClientSiteID'"><extid>60</extid></xsl:when>
              <xsl:when test="DataName = 'LoadID'"><extid>61</extid></xsl:when>
              <xsl:when test="DataName = 'EPN'"><extid>62</extid></xsl:when>
              <xsl:when test="DataName = 'OrderBulkID'"><extid>63</extid></xsl:when>
              <xsl:when test="DataName = 'ServiceProviderOrderNumber'"><extid>64</extid></xsl:when>
              <xsl:when test="DataName = 'ManufacturedHomeWidthType'"><extid>65</extid></xsl:when>
              <xsl:when test="DataName = 'BusinessAreaName'"><extid>66</extid></xsl:when>
              <xsl:when test="DataName = 'OrderRecordID'"><extid>67</extid></xsl:when>
              <xsl:when test="DataName = 'BranchAUName'"><extid>69</extid></xsl:when>
            </xsl:choose>
            <extvalue><xsl:value-of select="DataValue"/></extvalue>
          </customField>
        </xsl:if>
      </xsl:for-each>
    </customFields>
  </xsl:template>

  <xsl:template name="productAddl">
    <productAddl>
      <xsl:for-each select="ProductList/Product[1]/*">
        <xsl:if test="not(empty(index-of(('UniqueID', 'ProviderID', 'Reference', 'SLAPrice', 'DueDate', 'BundleID', 'IssueTo', 'RemitTo', 'WorkflowID', 'Workflowversion', 'SecurityAttcNumber', 'SecurityUserName', 'SecurityPassword', 'SecurityType', 'AddlSecurityAttcNumber', 'AddlSecurityUserName', 'AddlSecurityPassword', 'AddlSecurityType', 'Event', 'DocumentList', 'AddlProductDataName', 'AddlProductDataValue', 'AssignUserName', 'AssignUserFuntion', 'AssignUserOverrideEmail', 'XRefUniqueID', 'XRefType','ClosingDocInfo', 'CreditScoreType', 'CreditScore', 'CreditScoreBorrowerID', 'PaymentMethodAmount', 'PaymentMethodDate', 'PaymentMethodReference', 'AdditionalInstructions', 'ScheduleApptDateTime', 'ScheduleNbrOfAttempts', 'ScheduledBy', 'ScheduledApptNotes', 'CRMInd', 'DecliningMarketIndicator', 'HignCostAreaIndicator', 'ReferenceNumber', 'ReferenceNumberType', 'RestrictionType', 'SLABasisDate', 'InspectionDate', 'POS', 'AttachedUserReference', 'AttachedUserName', 'AttachedUserDayPhone', 'AttachedUserEvenPhone', 'AttachedUserCellPhone', 'AttachedUserPager', 'AttachedUserEmail', 'AttachedUserFax', 'EPSType', 'PaymentInfo', 'AppraiserLevel'), name(.))))">
          <xsl:choose>
            <xsl:when test="name(.) = 'IssueTo'">
              <xsl:element name="{local-name()}">
                <xsl:for-each select="*">
                  <xsl:if test="not(empty(index-of(('Reference', 'PrimaryName', 'Addr1', 'Addr2', 'City', 'State', 'Zip'), name(.))))">
                    <xsl:element name="{local-name()}">
                      <xsl:choose>
                        <xsl:when test="name(.) = 'Zip'">
                          <xsl:call-template name="get5DigitZipCode">
                            <xsl:with-param name="zip" select="."/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="."/>
                        </xsl:otherwise>
                      </xsl:choose>

                    </xsl:element>
                  </xsl:if>
                </xsl:for-each>
              </xsl:element>
            </xsl:when>
            <xsl:when test="name(.) = 'RemitTo'">
              <xsl:element name="{local-name()}">
                <xsl:for-each select="*">
                  <xsl:if test="not(empty(index-of(('ProviderID', 'ProviderName', 'Attn', 'Addr1', 'Addr2', 'City', 'State', 'Zip', 'Instructions', 'Contact'), name(.))))">
                    <xsl:element name="{local-name()}">
                      <xsl:choose>
                        <xsl:when test="name(.) = 'Contact'">
                          <xsl:call-template name="contact"/>
                        </xsl:when>
                        <xsl:when test="name(.) = 'Zip'">
                          <xsl:call-template name="get5DigitZipCode">
                            <xsl:with-param name="zip" select="."/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="."/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:element>
                  </xsl:if>
                </xsl:for-each>
              </xsl:element>
            </xsl:when>
            <xsl:when test="name(.) = 'Event'">
              <xsl:element name="{local-name()}">
                <xsl:for-each select="*">
                  <xsl:if test="not(empty(index-of(('RECCode', 'EventDate', 'OccurDate', 'UDF1', 'UDF2', 'UDF3', 'ClientCode', 'ClientDesc',  'EventID', 'RTEventID'), name(.))))">
                    <xsl:element name="{local-name()}">
                      <xsl:choose>
                        <xsl:when test="not(empty(index-of(('EventDate', 'OccurDate', '', '', '', ''), name(.))))">
                          <xsl:call-template name="formatDateTime">
                            <xsl:with-param name="date" select="."/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="."/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:element>
                  </xsl:if>
                </xsl:for-each>
                <Comment>
                  <xsl:if test="Comment != ''">
                    <xsl:value-of select="Comment"/>
                  </xsl:if>
                  <xsl:if test="../ClosingDocInfo/RateLockExpDate !=''">
                    Rate Lock Date: <xsl:value-of select="../ClosingDocInfo/RateLockExpDate"/>
                  </xsl:if>
                  <xsl:if test="../DueDate !=''">
                    Need By Date: <xsl:value-of select="../DueDate"/>
                  </xsl:if>
                  <xsl:if test="../../../LoanList/Loan/EstimatedClosingDate !=''">
                    Estimated Closing Date: <xsl:value-of select="../../../LoanList/Loan/EstimatedClosingDate"/>
                  </xsl:if>
                </Comment>
              </xsl:element>
            </xsl:when>
            <xsl:when test="name(.) = 'DocumentList'">
              <xsl:for-each select="Document">
                <xsl:element name="DocumentList">
                  <xsl:call-template name="documentList"/>
                </xsl:element>
              </xsl:for-each>
            </xsl:when>
            <xsl:when test="name(.) = 'EPSType' or name(.) = 'PaymentInfo'">
              <xsl:call-template name="paymentInfo"/>
            </xsl:when>
            <xsl:when test="not(empty(index-of(('DueDate', 'SLABasisDate', 'InspectionDate',  'PaymentMethodDate'), name(.))))">
              <xsl:element name="{local-name()}">
                <xsl:variable name="theDateStr"  select="."/>
                <xsl:choose>
                  <xsl:when test="string-length($theDateStr) > 17">
                    <xsl:call-template name="formatDateTime">
                      <xsl:with-param name="date" select="."/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="formatDateTime8">
                      <xsl:with-param name="date" select="."/>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:element>
            </xsl:when>

            <xsl:when test="name(.) = 'ClosingDocInfo'">
              <xsl:for-each select="*">
                <xsl:if test="not(empty(index-of(('RateLockExpDate', 'ClosingDocExpDate'), name(.))))">
                  <xsl:element name="{local-name()}">
                    <xsl:choose>
                      <xsl:when test="not(empty(index-of(('RateLockExpDate', 'ClosingDocExpDate', '', '', '', ''), name(.))))">
                        <xsl:call-template name="formatDateTime8">
                          <xsl:with-param name="date" select="."/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="."/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:element>
                </xsl:if>
              </xsl:for-each>
            </xsl:when>

            <xsl:when test="not(empty(index-of(('ScheduleApptDateTime'), name(.))))">
              <xsl:element name="{local-name()}">
                <xsl:call-template name="formatDate">
                  <xsl:with-param name="date" select="."/>
                </xsl:call-template>
              </xsl:element>
            </xsl:when>
            <!-- ScheduleApptDateTime -->
            <xsl:when test="not(empty(index-of(('POS'), name(.))))">
              <xsl:element name="{local-name()}">
                <xsl:call-template name="yesNo"/>
              </xsl:element>
            </xsl:when>
            <xsl:otherwise>
              <xsl:element name="{local-name()}">
                <xsl:value-of select="."/>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:for-each>
    </productAddl>
  </xsl:template>

  <xsl:template name="paymentInfo">
    <xsl:choose>
      <xsl:when test="../EPSType = 'BILLTO' or ../EPSType = 'CREDITCARD'">
        <PaymentInfo>
          <PaymentType>EPS</PaymentType>
          <Amount>
            <xsl:choose>
              <xsl:when test="../CreditCardPaymentInfoList">
                <xsl:value-of select="../CreditCardPaymentInfoList/Payment[1]/Amount"/>
              </xsl:when>
              <xsl:when test="../PaymentInfo">
                <xsl:value-of select="../PaymentInfo/PaymentInfoList/Payment[1]/Amount"/>
              </xsl:when>
            </xsl:choose>
          </Amount>
        </PaymentInfo>
      </xsl:when>
      <xsl:otherwise>

        <xsl:element name="{local-name()}">
          <xsl:for-each select="PaymentInfoList/Payment[1]/*">
            <xsl:if test="not(empty(index-of(('PaymentType', 'Amount', 'Date', 'CompanyName', 'BillingFirstName', 'BillingLastName', 'BillingAddress', 'BillingCity', 'BillingState', 'BillingZip', 'BillingPhone', 'BillingEmail', 'Instructions', 'Reference', 'CreditCard', 'PaymentRef'), name(.))))">
              <xsl:element name="{local-name()}">
                <xsl:choose>
                  <xsl:when test="name(.) = 'PaymentType'">
                    <xsl:value-of select="."/>
                  </xsl:when>
                  <xsl:when test="name(.) = 'CreditCard'">
                    <xsl:for-each select="*">
                      <xsl:if test="not(empty(index-of(('NameOnCC', 'CCType', 'CCNumber', 'ExpirationMonth', 'ExpirationYear', 'CCSecurityCode'), name(.))))">
                        <xsl:element name="{local-name()}">
                          <xsl:value-of select="."/>
                        </xsl:element>
                      </xsl:if>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="name(.) = 'BillingZip'">
                    <xsl:call-template name="get5DigitZipCode">
                      <xsl:with-param name="zip" select="."/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="not(empty(index-of(('Date'), name(.))))">
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="date" select="."/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:element>
            </xsl:if>
          </xsl:for-each>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="CostCenter">
    <customField>
      <extid>6</extid>
      <extvalue><xsl:value-of select="."/></extvalue>
    </customField>
  </xsl:template>

  <xsl:template name="documentList">
    <Description><xsl:value-of select="Description"/></Description>
    <DocName><xsl:value-of select="DocName"/></DocName>
    <OriginalFileName><xsl:value-of select="FileName"/></OriginalFileName>
    <ContentFileName><xsl:value-of select="Content"/></ContentFileName>
  </xsl:template>

  <xsl:template name="propertyAddl">
    <propertyAddl>
      <xsl:for-each select="PropertyList/Property[1]/*">
        <xsl:if test="empty(index-of(('UniqueID', 'Type', 'Occupancy'), name(.)))">
          <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:choose>
              <xsl:when test="not(empty(index-of(('PolicyToFollow', 'LockBox', 'PUDIndicator', 'ConstructionToPerm'), name(.))))">
                <xsl:call-template name="yesNo"/>
              </xsl:when>
              <xsl:when test="name(.) = 'Zip'">
                <xsl:call-template name="get5DigitZipCode">
                  <xsl:with-param name="zip" select="."/>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="name(.) = 'Situs'">
                <xsl:for-each select="*">
                  <xsl:if test="not(empty(index-of(('Direction1', 'Direction2', 'Number', 'Name', 'Unit', 'Type'), name(.))))">
                    <xsl:element name="{local-name()}">
                      <xsl:value-of select="."/>
                    </xsl:element>
                  </xsl:if>
                </xsl:for-each>
              </xsl:when>
              <xsl:when test="name(.) = 'Contact'">
                <xsl:call-template name="contact"/>
              </xsl:when>
              <xsl:when test="name(.) = 'Structure'">
                <xsl:for-each select="*">
                  <xsl:if test="not(empty(index-of(('Bedrooms', 'Bathrooms', 'Rooms', 'Stories', 'Fireplaces', 'Garage', 'AttachedGarage', 'GarageSpaces', 'Pool', 'Spa', 'CentralAC', 'Basement', 'YearBuilt', 'ValueAsOfDate', 'DetachedBldg', 'CrawlSpace', 'LotSizeUnit', 'PurchaseMonth', 'PurchaseYear', 'PrevEstValue', 'PrevEstValueSource', 'OriginalAppraisalAmount', 'FoundationType', 'PropertyAge'), name(.))))">
                    <xsl:element name="{local-name()}">
                      <xsl:choose>
                        <xsl:when test="not(empty(index-of(('Garage', 'AttachedGarage', 'Pool', 'Spa', 'CentralAC', 'Basement', 'DetachedBldg', 'DetachedBldg', 'CrawlSpace', 'CrawlSpace'), name(.))))">
                          <xsl:call-template name="yesNo"/>
                        </xsl:when>
                        <xsl:when test="not(empty(index-of(('ValueAsOfDate'), name(.))))">
                          <xsl:call-template name="formatDateTime">
                            <xsl:with-param name="date" select="."/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="."/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:element>
                  </xsl:if>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="."/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
          <!--
          -->
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="PartyList/Party">
        <xsl:if test="TypeOtherDesc = 'VABuilderID'">
          <BuilderReferenceNumber><xsl:value-of select="PartyRoleCode"/></BuilderReferenceNumber>
          <BuilderName><xsl:value-of select="CompanyName"/></BuilderName>
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="ProductList/Product/AddlProductDataList/AddlProductData">
        <xsl:if test="DataName = 'BuilderProjectName'">
          <ProjectName><xsl:value-of select="DataValue"/></ProjectName>
        </xsl:if>
        <xsl:if test="DataName = 'BuilderProjectID'">
          <ProjectID><xsl:value-of select="DataValue"/></ProjectID>
        </xsl:if>
      </xsl:for-each>
    </propertyAddl>
  </xsl:template>

  <xsl:template name="partyList">
    <xsl:for-each select="PartyList/Party">
      <partyList>
        <xsl:for-each select="*">
          <xsl:if test="empty(index-of(('UniqueID', 'SpouseUniqueID'), name(.)))">
            <xsl:element name="{local-name()}">
              <xsl:copy-of select="@*"/>
              <xsl:choose>
                <xsl:when test="not(empty(index-of(('SpouseUniqueID', 'BankruptcyLastSevenYears', 'BankruptcyLastSevenYears', 'ForeclosureLastSevenYears', 'ForeclosureLastSevenYears', 'PendingLawsuit', 'ExistingLienToBePaidOff', 'NoLienToBePaidOff'), name(.))))">
                  <xsl:call-template name="yesNo"/>
                </xsl:when>
                <xsl:when test="name(.) = 'Zip'">
                  <xsl:call-template name="get5DigitZipCode">
                    <xsl:with-param name="zip" select="."/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="not(empty(index-of(('DOB'), name(.))))">
                  <xsl:call-template name="formatDate">
                    <xsl:with-param name="date" select="."/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="name(.) = 'Type'">
                  <xsl:call-template name="PartyType_Mapping">
                    <xsl:with-param name="partyType" select="."/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="."/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:element>
          </xsl:if>
        </xsl:for-each>
      </partyList>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="propertyLoanAddl">
    <propertyLoanAddl>
      <!-- copy all nodes except listed in the if test statement -->
      <xsl:for-each select="LoanList/Loan[1]/*">
        <!-- TODO: confirm list of excluded nodes -->
        <xsl:if test="empty(index-of(('Contact', 'Purpose', 'UniqueID', 'PropertyAddtionalInfo', 'Amount', 'Type'), name(.)))">
          <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:choose>
              <xsl:when test="not(empty(index-of(('Existing', 'Subordinate', 'Payoff', 'CashOut', 'Paydown', 'ARMInd', 'SubPrimeInd', 'CEM', 'TexasHomeEquity', 'BondLoan', 'PortfolioLoan', 'RefinancedRecently'), name(.))))">
                <xsl:call-template name="yesNo"/>
              </xsl:when>
              <xsl:when test="not(empty(index-of(('InitialPayDate', 'InitialPayDate', 'OriginationDate'), name(.))))">
                <xsl:call-template name="formatDateTime">
                  <xsl:with-param name="date" select="."/>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="not(empty(index-of(('ExpDisbDate'), name(.))))">
                <xsl:call-template name="formatDate">
                  <xsl:with-param name="date" select="."/>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="not(empty(index-of(('Zip'), name(.))))">
                <xsl:call-template name="get5DigitZipCode">
                  <xsl:with-param name="zip" select="."/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="."/>
              </xsl:otherwise>
            </xsl:choose>

          </xsl:element>
        </xsl:if>
      </xsl:for-each>
      <occupancy>
        <xsl:choose>
          <xsl:when test="normalize-space(PropertyList/Property[1]/Occupancy) !=''">
            <xsl:call-template name="RealECToRealEC_OccupancyMapping">
              <xsl:with-param name="occupancyCode" select="PropertyList/Property[1]/Occupancy"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="normalize-space(PropertyList/Property[1]/UsageType) !=''">
            <xsl:call-template name="RealECToRealEC_OccupancyMapping">
              <xsl:with-param name="occupancyCode" select="PropertyList/Property[1]/UsageType"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="RealECToRealEC_OccupancyMapping">
              <xsl:with-param name="occupancyCode">UNKNOWN</xsl:with-param>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </occupancy>

    </propertyLoanAddl>
  </xsl:template>

  <xsl:template match="Product">
    <xsl:param name="orderNumber"></xsl:param>
    <requesterName></requesterName>
    <requesterReferenceNumber><xsl:value-of select="../../TransactionID"/></requesterReferenceNumber>
    <xsl:choose>
      <xsl:when test="../../PartyList/Party/TypeOtherDesc = 'VABuilderID' or AddlProductDataList/AddlProductData/DataValue = 'BUILDER, MN'">
        <appraisalPurpose>NEWCON</appraisalPurpose>
      </xsl:when>
      <xsl:otherwise>
        <appraisalPurpose><xsl:value-of select="../../LoanList/Loan[1]/Purpose"/></appraisalPurpose>
      </xsl:otherwise>
    </xsl:choose>
    <appraisalProductRequested><xsl:value-of select="ProductCode"/></appraisalProductRequested>
    <rushOrder>
      <xsl:choose>
        <xsl:when test="RushIndicator and RushIndicator='YES'">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </rushOrder>
    <xsl:call-template name="borrower"/>
  </xsl:template>

  <xsl:template name="borrower">
    <borrower>
      <primaryBorrowerIndicator>Y</primaryBorrowerIndicator>
      <firstName></firstName>
      <lastName></lastName>
      <email></email>
      <phoneNumber></phoneNumber>
    </borrower>
  </xsl:template>

  <xsl:template match="Property">
    <xsl:param name="orderNumber"></xsl:param>
    <xsl:param name="costCenter"></xsl:param>
    <xsl:param name="broker"></xsl:param>
    <xsl:param name="loanofficer"></xsl:param>
    <property>
      <legalRef><xsl:value-of select="Description"/></legalRef>
      <lotSize><xsl:value-of select="Structure/LotSize"/></lotSize>
      <sqFootage><xsl:value-of select="Structure/LivingArea"/></sqFootage>
      <typeOfProperty><xsl:value-of select="Type"/></typeOfProperty>
      <address>
        <unitNumber></unitNumber>
        <streetNumber></streetNumber>
        <suffix></suffix>
        <streetDirection></streetDirection>
        <streetType></streetType>
        <streetName>
          <xsl:value-of select="Addr1"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="Addr2"/>
        </streetName>
        <city><xsl:value-of select="City"/></city>
        <province><xsl:value-of select="State"/></province>
        <propertyType></propertyType>
        <postalCode>
          <xsl:call-template name="get5DigitZipCode">
            <xsl:with-param name="zip" select="Zip"/>
          </xsl:call-template>
        </postalCode>
        <country></country>
      </address>

      <!-- VAL-8819 : Map CostCenter to SaleRegion if not null and not empty -->
      <xsl:choose>
        <xsl:when test="boolean($costCenter) and string($costCenter) != ''">
          <salesRegion><xsl:value-of select="$costCenter"/></salesRegion>
        </xsl:when>
        <xsl:otherwise>
          <salesRegion>0</salesRegion>
        </xsl:otherwise>
      </xsl:choose>

      <projectName><xsl:value-of select="ProjectName"/></projectName>
    </property>

    <appraisalFileInformation>
      <clientRefNumber><xsl:value-of select="../../LoanList[1]/Loan/Reference"/></clientRefNumber>
      <clientFhaNumber>
        <xsl:choose>
          <xsl:when test= "normalize-space(../../LoanList[1]/Loan/AgencyCaseNumber) !=''">
            <xsl:value-of select="normalize-space(../../LoanList[1]/Loan/AgencyCaseNumber)"/>
          </xsl:when>

          <xsl:when test="normalize-space(../../LoanList[1]/Loan/FHACaseNumber) !=''">
            <xsl:value-of select="normalize-space(../../LoanList[1]/Loan/FHACaseNumber)"/>
          </xsl:when>
        </xsl:choose>
      </clientFhaNumber>
      <loanType><xsl:value-of select="../../LoanList[1]/Loan/Type"/></loanType>
      <xsl:choose>
        <xsl:when test="$broker/EMail != ''">
          <originatorsEmail><xsl:value-of select="$broker/EMail"/></originatorsEmail>
        </xsl:when>
        <xsl:otherwise>
          <originatorsEmail><xsl:value-of select="$loanofficer/EMail"/></originatorsEmail>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="../../LoanList/Loan/IsConformingIndicator = 'NO'"><nonConforming>true</nonConforming></xsl:when>
        <xsl:when test="../../LoanList/Loan/IsConformingIndicator = 'YES'"><nonConforming>false</nonConforming></xsl:when>
      </xsl:choose>
      <underwriterEmail></underwriterEmail>
      <salePrice><xsl:value-of select="Structure/EstValue"/></salePrice>
      <mortgageAmount><xsl:value-of select="../../LoanList[1]/Loan/Amount"/></mortgageAmount>
      <clientDueDate></clientDueDate>
      <closeDate>
        <xsl:call-template name="formatDateTime8">
          <xsl:with-param name="date" select="../../LoanList/Loan[1]/EstimatedClosingDate"/>
        </xsl:call-template>
      </closeDate>

      <speacialInstructions>
        <xsl:value-of select="../../ProductList/Product[1]/Instructions"/>
        <xsl:if test="not(empty(AdditionalProjectConsiderationsType)) and AdditionalProjectConsiderationsType != 'Other'">
          Project classified as <xsl:value-of select="AdditionalProjectConsiderationsType"/>.
        </xsl:if>
      </speacialInstructions>
      <xsl:if test="../../ProductList/Product[1]/AddlProductDataList/AddlProductData[DataName = 'NotificationStartDate']">
        <disclosureDate>
          <xsl:call-template name="formatDateTime8">
            <xsl:with-param name="date" select="../../ProductList/Product[1]/AddlProductDataList/AddlProductData[DataName = 'NotificationStartDate']/DataValue"/>
          </xsl:call-template>
        </disclosureDate>
      </xsl:if>
      <xsl:variable name='wellsBondsOrder'>
        <xsl:value-of select="FORMS/FORM/FIELDS/BROKERCONTACTTYPE1"/>
      </xsl:variable>
      <!-- VAL-24939 : Wells Bond Orders requires 2 signatures -->
      <xsl:for-each select="../../LoanList/Loan">
        <xsl:for-each select="LoanProgramList/LoanProgramDetail">
          <xsl:if test="LoanProgramIdentifier = 'BNJHMPFAP' and not(preceding-sibling::*/LoanProgramIdentifier='BNJHMPFAP')">
            <requiresTwoAppraisalSignatories>true</requiresTwoAppraisalSignatories>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
    </appraisalFileInformation>

    <appraisalOrderer>
      <ordererId></ordererId>
    </appraisalOrderer>
    <appraisalContact>
      <firstName><xsl:value-of select="substring-before(Contact/Name, ' ')"/></firstName>
      <lastName>
        <xsl:call-template name="substring-after-last-space">
          <xsl:with-param name="string">
            <xsl:value-of select="Contact/Name"/>
          </xsl:with-param>
        </xsl:call-template>
      </lastName>
      <email><xsl:value-of select="Contact/EMail"/></email>
      <homePhoneNumber><xsl:value-of select="Contact/DayPhone"/></homePhoneNumber>
      <workPhoneNumber><xsl:value-of select="Contact/EvenPhone"/></workPhoneNumber>
      <cellPhoneNumber><xsl:value-of select="Contact/CellPhone"/></cellPhoneNumber>
      <accessInstructions></accessInstructions>
      <pager><xsl:value-of select="Contact/Pager"/></pager>
      <fax><xsl:value-of select="Contact/Fax"/></fax>
      <accessContactRelation><xsl:value-of select="Occupancy"/></accessContactRelation>
      <additionalContactList>
        <xsl:for-each select="../../PropertyList/Property">
          <xsl:if test="position()!=1">
            <additionalContact>
              <type>
                <xsl:choose>
                  <xsl:when test="normalize-space(Occupancy) !=''">
                    <xsl:call-template name="RealECToRealEC_OccupancyMapping">
                      <xsl:with-param name="occupancyCode" select="Occupancy"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
              </type>
              <name>
                <xsl:value-of select="Contact/Name"/>
              </name>
              <phone>
                <xsl:if test="normalize-space(Contact/DayPhone) !=''">
                  <xsl:value-of select="Contact/DayPhone"/>
                </xsl:if>
                <xsl:if test="normalize-space(Contact/EvenPhone) !=''">
                  <xsl:if test="normalize-space(Contact/DayPhone) !=''">
                    ,
                  </xsl:if>
                  <xsl:value-of select="Contact/EvenPhone"/>
                </xsl:if>
              </phone>
              <email>
                <xsl:value-of select="Contact/EMail"/>
              </email>
            </additionalContact>
          </xsl:if>
        </xsl:for-each>
      </additionalContactList>
    </appraisalContact>
  </xsl:template>

  <xsl:template match="Loan">
    <!-- <xsl:value-of select=""/> -->
    <appraisalRequester>
      <requesterId></requesterId>
      <firstName><xsl:value-of select="substring-before(Contact/Name, ' ')"/></firstName>
      <lastName>
        <xsl:call-template name="substring-after-last-space">
          <xsl:with-param name="string">
            <xsl:value-of select="Contact/Name"/>
          </xsl:with-param>
        </xsl:call-template>
      </lastName>
      <email><xsl:value-of select="Contact/Email"/></email>
      <phoneNumber><xsl:value-of select="Contact/DayPhone"/></phoneNumber>
      <requestingCompanyId></requestingCompanyId>
      <evenPhoneNumber><xsl:value-of select="Contact/evenPhone"/></evenPhoneNumber>
      <cellPhoneNumber><xsl:value-of select="Contact/CellPhone"/></cellPhoneNumber>
      <pager><xsl:value-of select="Contact/Pager"/></pager>
      <fax><xsl:value-of select="Contact/Fax"/></fax>
      <!-- <xsl:value-of select="Contact/"/> -->
    </appraisalRequester>

    <appraisalPayment>
      <xsl:choose>
        <xsl:when test="/RealEC-XML/Transaction/ProductList/Product[1]/EPSType = 'CREDITCARD' or /RealEC-XML/Transaction/ProductList/Product[1]/EPSType = 'BILLTO'">
          <xsl:text>EPS</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="/RealEC-XML/Transaction/ProductList/Product[1]/PaymentInfo/PaymentInfoList/Payment[1]/PaymentType">
              <xsl:value-of select="/RealEC-XML/Transaction/ProductList/Product[1]/PaymentInfo/PaymentInfoList/Payment[1]/PaymentType"/>
            </xsl:when>
            <xsl:otherwise>
              <appraisalPayment><xsl:text></xsl:text></appraisalPayment>
            </xsl:otherwise>
          </xsl:choose>


        </xsl:otherwise>
      </xsl:choose>
    </appraisalPayment>
  </xsl:template>

  <xsl:template match="Event"></xsl:template>
  <xsl:template name="substring-after-last-space">
    <xsl:param name="string" />
    <xsl:choose>
      <xsl:when test="contains($string, ' ')">
        <xsl:call-template name="substring-after-last-space">
          <xsl:with-param name="string" select="substring-after($string, ' ')" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise><xsl:value-of select="$string" /></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="brokerInfo">
    <xsl:param name="contact"/>
    <xsl:if test="$contact != ''">
      <brokerInfo>
        <Name><xsl:value-of select="$contact/Name"/></Name>
        <DayPhone><xsl:value-of select="$contact/DayPhone"/></DayPhone>
        <EvenPhone>--</EvenPhone>
        <EMail><xsl:value-of select="$contact/EMail"/></EMail>
      </brokerInfo>
    </xsl:if>
  </xsl:template>

  <xsl:template name="orderMessages">
    <orderMessages>
      <xsl:for-each select="ProductList/Product[1]/AppraisalInfo/AddlInstructions">
        <orderMessage>
          <subject>Create Order</subject>
          <content><xsl:value-of select="."/></content>
        </orderMessage>
      </xsl:for-each>
      <xsl:for-each select="LoanList/Loan">
        <xsl:for-each select="LoanProgramList/LoanProgramDetail">
          <xsl:if test="LoanProgramCategoryCode = 'Bond'">
            <orderMessage>
              <subject>Bond Order</subject>
              <content>This order is a Wells Fargo bond order, please review the notes history and notify the Account Manager.</content>
            </orderMessage>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
    </orderMessages>
  </xsl:template>

  <xsl:template name="orderNotes">
    <orderNotes>
      <xsl:if test="PartyList/Party/TypeOtherDesc = 'VABuilderID' or (ProductList/Product/AddlProductDataList/AddlProductData/DataValue = 'FulfillmentAUName' and ProductList/Product/AddlProductDataList/AddlProductData/DataValue = 'BUILDER, MN')">
<![CDATA[Wells Fargo New Construction Order.<br/>Please follow the assignment/QC process. Wells Fargo Construction orders are to be reviewed by Wells Fargo Builder reviewers.]]>
      </xsl:if>
      <xsl:variable name="lakeviewProgramIds" select="' BCAHFAHFA  BCAHFAPLU BCAHFAVAL BCAHFMBSP BCAHFPLHF BTXSAHFLV '"/>
      <xsl:variable name="usBankProgram" select="' BTXSAHMLV BFLHFMRBP BFLHFPHFA BILHDAFHI BILHDFHFA BMDCDAUSB BMDCDCCVC BMNHFAMRB BMNHFHFAP BMNHFNOM2 BMNHFNOMI BMNHFPHFA BMNHFSTEP BNEIF981- BNEIFAMHP BNEIFHFAP BNVHDHFAP BNVHDHIPT BNVHDMBSP '"/>
      <xsl:variable name="serviSolutionsProgram" select="' BNCHFAMBS BNCHFHFAP '"/>
      <xsl:variable name="northDakotaHFA" select="' BNDHF2K1F BNDHFCNVC '"/>
      <xsl:for-each select="LoanList/Loan">
        <xsl:for-each select="LoanProgramList/LoanProgramDetail">
          <xsl:choose>
            <xsl:when test="LoanProgramIdentifier != '' and contains($lakeviewProgramIds, LoanProgramIdentifier)">
<![CDATA[<b>This is a bond order</b>
<b>Bond Program:</b> Lakeview Program
<b>Requirements:</b> Appraiser must not be on Lakeview Exclusionary List. Lakeview will not provide access to the exclusionary list for the AMCs. Please contact WF NUPRM Appraisal Compliance at CollateralCompliance@wellsfargo.com and they will validate if the appraiser is on the Lakeview exclusionary list.]]>
            </xsl:when>
            <xsl:when test="LoanProgramIdentifier != '' and contains($usBankProgram, LoanProgramIdentifier)">
<![CDATA[<b>This is a bond order</b>
<b>Bond Program:</b> US Bank Program
<b>Requirements:</b> Appraiser must not be on US Bank Exclusionary List.]]>
            </xsl:when>
            <xsl:when test="LoanProgramIdentifier != '' and contains($serviSolutionsProgram, LoanProgramIdentifier)">
<![CDATA[<b>This is a bond order</b>
<b>Bond Program:</b> ServiSolutions Program
<b>Requirements:</b> Appraiser includes a copy of their license in the appraisal report.]]>
            </xsl:when>
	<xsl:when test="LoanProgramIdentifier != '' and contains($northDakotaHFA, LoanProgramIdentifier)">
	<![CDATA[<b>This is a bond order</b>
	<b>Bond Program:</b> North Dakota HFA
	<b>Requirements:</b> Addendum A to be completed at the time of the appraisal by the appraiser and attached to the appraisal. https://www.ndhfa.org/LenderReAgent/Forms/AppraisalAddendumA.pdf]]>
	</xsl:when>
	<xsl:when test="LoanProgramIdentifier = 'BNJHMPFAP'">
	<![CDATA[<b>This is a bond order</b>
	<b>Bond Program:</b> New Jersey Police and Fireman
	<b>Requirements:</b>  Appraisals are required to contain a written certification signed by 2 people (from the same firm), which include the opinion of the signatories as to the value of the land and improvements. MSA requirements for background check requirements apply.]]>
	</xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </xsl:for-each>
    </orderNotes>
  </xsl:template>

</xsl:stylesheet>
