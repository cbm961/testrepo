###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314E-DropdownListFieldStateVerification
# - Description: How to check the state of a drop down list field or value
#                - How to verify a drop down list field is displayed or hidden
#                - How to verify a drop down list value is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 14/12/2023
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314E-DropdownListFieldStateVerification

    Scenario: 0314E0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314E1 - Drop down list management - How to verify a drop down list field is displayed or hidden
        #Open function by code
        Given the user opens the "GESITM" function
        Then the "Product" screen is displayed

        #Drop down list field: verify the drop down list field with name is displayed
        Then the drop down list with name: "Product status" is displayed

        #Drop down list field: verify the drop down list field with X3 field Name (ScreenCode_FieldName) is displayed
        Then the drop down list with X3 field name: "ITM0_ITMSTA" is displayed

        #Drop down list field: verify the drop down list field with name is hidden
        Then the drop down list with name: "Hiddenfield" is hidden

        #Drop down list field: verify the drop down list field with X3 field Name (ScreenCode_FieldName) is hidden
        Then the drop down list with X3 field name: "ITM0_HDFIELD" is hidden

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314E2 - Drop down list management -  How to verify a drop down list value is displayed or hidden
        #Open function by code
        Given the user opens the "GESITF" function
        Then the "Product-site" screen is displayed


        #Select the required data using the left list
        And the user clicks the "Products - site" link on the left panel
        And the user selects the data table of left panel
        And the user selects search cell with header: "Product"
        And the user adds the text "ALUMSHEET" in selected cell and hits enter key
        And the user selects search cell with header: "Stock site"
        And the user adds the text "DE011" in selected cell and hits enter key
        And the user selects cell with column header: "Category" and row number: 1
        And the user clicks on the selected cell

        And the user clicks the "Planning" tab selected by title

        #Drop down list field: verify the value of the selected drop down list is displayed or hidden
        And the user selects the drop down list with name: "Suggestion type"
        Then the "No suggestion" value of the selected drop down list is displayed
        Then the "Purchase" value of the selected drop down list is displayed
        Then the "Manufacturing" value of the selected drop down list is hidden
        Then the "Intersite" value of the selected drop down list is displayed

        And the user clicks the Close page action icon on the header panel


    Scenario: 0314E3 - Logout scenario
        And the user logs-out from the system