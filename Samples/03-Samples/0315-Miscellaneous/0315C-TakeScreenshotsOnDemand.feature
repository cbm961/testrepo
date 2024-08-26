##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0315C-TakeScreenshotsOnDemand
# - Description: Take screenshots on demand.
#
# - Created date: 21/06/2022
# - Updated date: 30/11/2022
###########################################################################


@SageX3AutomatedTestPlatform @TakeScreenshot
Feature: 0315C-TakeScreenshotsOnDemand

    Scenario: 0315C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0315C1 - Miscellaneous actions - Take screenshots on demand

        Given the user opens the "GESPIH" function

        #Select purchase order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Purchase invoice ALL : Full entry" screen is displayed

        #Left panel: select the left list
        When the user clicks the "Purchase invoices" link on the left panel
        Given the user selects the data table of left panel

        #Search cell: use the search cell to filter the Category
        And the user selects search cell with header: "Document no."
        And the user adds the text "NA0231212INVBS000003" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        #Verification of one purchase invoice line
        And the user clicks the "Lines" tab selected by title
        And the user selects the data table with x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects row by multiple criteria that has the text "RECNA0220086" in column with header: "Number" and the text "3000" in column with header: "Line"
        And the user selects cell with header: "Unit" of selected row
        Then the value of the selected cell is "EA"
        And the user selects cell with header: "Invoiced qty." of selected row
        Then the value of the selected cell is "11000"
        And the user selects cell with header: "Net price" of selected row
        Then the value of the selected cell is "0.0300"
        And the user selects cell with header: "Line amt. - tax" of selected row
        Then the value of the selected cell is "330.00"

        #Screenshot on demand
        And the user takes a screenshot

        And the user clicks the "Control" tab selected by title

        And the user selects the fixed data table of section: "Taxes"
        And the user selects row that has the text "Exempt" in column with header: "Description"
        And the user selects cell with header: "Tax basis" of selected row
        Then the value of the selected cell is "137828.50"
        And the user selects cell with header: "Tax amount" of selected row
        Then the value of the selected cell is ""
        And the user selects cell with header: "Gross basis" of selected row
        Then the value of the selected cell is "137828.50"

        #Screenshot on demand
        And the user takes a screenshot

        And the user selects the text field with name: "Invoice - tax"
        Then the value of the selected text field is "137828.50"
        And the user selects the text field with name: "Calculated - tax"
        Then the value of the selected text field is "137828.50"

        #Screenshot on demand
        And the user takes a screenshot

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0315C2 - Logout scenario
        And the user logs-out from the system