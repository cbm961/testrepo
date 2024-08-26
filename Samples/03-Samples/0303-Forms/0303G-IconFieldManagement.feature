###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303G-IconFieldManagement
# - Description: How to interact with icon fields
#                - How to interact with icon fields in syracuse page
#                - How to interact with icon fields in X3 Classic page
# - Created date: 27/02/2020
# - Updated date: 13/05/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303G-IconFieldManagement

    Scenario: 0303G0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303G1 - Icon field management - How to interact with icon fields in syracuse page

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed

        When the user selects the main data table of the page
        And the user selects row that has the text "XATP" in column with header: "Login"
        And the user opens "Detail" function on toolbox of the selected row
        And the user selects the text field with name: "Login"
        And the value of the selected text field is "XATP"

        #Icon field: selection of the icon field and check the Icon field is checked
        Given the user selects the icon field with name: "Active"
        Then the icon of the selected icon field is checked

        #Icon field: selection of the icon field and check the Icon field is a cross
        Given the user selects the icon field with name: "Password never expires"
        Then the icon of the selected icon field is a cross

        And the user clicks the "Edit" action button on the header drop down
        And the user clicks the "Administration" tab selected by title

        #Icon field: click on the add action of the selected icon field
        Given the user selects the icon field with name: "Groups"
        When the user clicks on the "Add" icon of the selected icon field
        Then the modal dialog "Groups" is displayed
        And the user clicks the Close page action icon on the header panel

        And the user open the main page clicking on the logo


    Scenario: 0303G2 - Icon field management - How to interact with icons field in X3 Classic page

        #Open function by code
        Given the user opens the "GESITM" function
        Then the "Product" screen is displayed

        #Left panel: select the left list
        When the user clicks the "Products" link on the left panel
        Given the user selects the data table of left panel

        #Search cell: use the search cell to filter the product
        And the user selects search cell with header: "Product"
        And the user adds the text "BMS062" in selected cell and hits enter key
        And the user selects cell with column header: "Product" and row number: 1
        And the user clicks on the selected cell

        #Icon field: selection of the icon field and check the icon field is disabled
        Given the user selects the icon field with name: "PLM history"
        Then the selected icon field should be disabled

        #Icon field: selection of the icon field by X3 Field Name (ScreenCode_FieldName) and check the icon field is disabled
        Given the user selects the icon field with X3 field name: "ITM1_BUTHISURL"
        Then the selected icon field should be disabled

        #Icon field: selection of the icon field and click on it
        Given the user selects the icon field with name: "Product notes"
        When the user clicks on the selected icon field
        Then the "Notes" screen is displayed

        #Close Notes functions
        And the user clicks the Close page action icon on the header panel

        #Close Product function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303G3 - Logout scenario
        And the user logs-out from the system