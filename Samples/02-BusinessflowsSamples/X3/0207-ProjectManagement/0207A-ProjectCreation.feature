###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  0207A-ProjectCreation
# - Description:
#       1) Create a PJM Project
#       2) Create the project cost structure (Budget)
#       3) Create the task planning on the project
# - Created date: 24/06/2020
# - Updated date: 03/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0207A-ProjectCreation

    Scenario: 0207A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0207A1 - PJM Project creation
        Given the user opens the "GESPJM" function
        Then the "Project management" screen is displayed

        Given the user clicks the "New" main action button on the right panel

        #Enter header information
        And the user selects the text field with name: "Sales site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "ATP21 - PJM001" to the selected text field and hits tab key

        Then the user clicks the "General" tab selected by title
        And the user selects the date field with name: "Start date"
        And the user writes first day of the year to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes last day of the year to the selected date field

        #Create Project
        #Used in feature: 0303I-TextAreaFieldManagement
        #Used in feature: 0304L-DataTableandHerachicalCellManagement
        Then the user clicks the "Create" main action button on the right panel

        And an alert box with the text containing "Creation of analytical dimension for dimension type PRJ" appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario Outline: 0207A2 - <PBUCOD> Project budget creation

        #Add Cost Structure
        Then the user clicks the "Cost structure" button in the header

        #Add Budget 1
        Given the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Budget code"
        And the user writes <PBUCOD> to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes <PBUDESAXX> to the selected text field and hits tab key

        Then the user clicks the "Budget lines" tab selected by title
        And the user selects the data table of section: "Budget lines"
        And the user selects last editable cell with column header: "Cost type"
        And the user adds the text <PCCCOD> in selected cell
        And the user selects last editable cell with column header: "Amount"
        And the user adds the text <PLBAMT> in selected cell

        Then the user clicks the "Save" main action button on the right panel

        Then the user clicks the Close page action icon on the header panel

        Examples:
            | PBUCOD  | PBUDESAXX                       | PCCCOD       | PLBAMT     |
            | "B-010" | "Specification"                 | "MANAGER"    | "969.76"   |
            | "B-020" | "Purchase"                      | "STDPRODUCT" | "22700.00" |
            | "B-030" | "Solution setting and mounting" | "TECHNICIAN" | "1011.20"  |


    Scenario Outline: 0207A3 - <TASCOD> - Project Task Planning creation

        #Add Cost Structure
        Then the user clicks the "Task planning" button in the header

        #Add Budgets
        Given the user clicks the "New" main action button on the right panel

        #Select the Category
        When the user selects the data table in the popup
        Then the user selects search cell with header: "Category"
        And the user adds the text <TCACOD> in selected cell and hits enter key
        And the user selects cell with column header: "Category" and row number: 1
        And the user clicks on the selected cell

        And the user selects the text field with name: "Task code"
        And the user writes <TASCOD> to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes <TASDESAXX> to the selected text field
        And the user selects the text field with name: "Parent code"
        And the user writes <TASPAE> to the selected text field
        And the user selects the date field with name: "Start date"
        And the user writes first day of the year to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes last day of the year to the selected date field
        And the user selects the text field with name: "Budget code"
        And the user writes <PBUCOD> to the selected text field

        Then the user clicks the "Save" main action button on the right panel

        Then the user clicks the Close page action icon on the header panel

        Examples:
            | TCACOD  | TASCOD  | TASDESAXX                  | TASPAE  | PBUCOD  |
            | "MIXED" | "T-030" | "Server assembly and test" | ""      | "B-030" |
            | "MIXED" | "T-031" | "Server assembly"          | "T-030" | "B-030" |
            | "MIXED" | "T-032" | "Assembly billing"         | "T-030" | "B-030" |


    Scenario: 0207A4 - Close project management function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0207A5 - Logout scenario
        Then the user logs-out from the system