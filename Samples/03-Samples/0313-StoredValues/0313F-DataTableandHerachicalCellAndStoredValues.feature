##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313F-DataTableandHerachicalCellAndStoredValues
# - Description: How to interact with hierarchical cells and (user) stored values
#                - How to interact with hierarchical cells using stored value
# - Created date: 14/09/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313F-DataTableandHerachicalCellAndStoredValues

    Scenario: 0313F0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313F1 - Data Table management - How to interact with hierarchical cells using stored value

        #Open function by code
        Given the user opens the "GESPJM" function
        Then the "Project management" screen is displayed

        #Left panel: select the required project using the left list
        Given the user selects the data table of left panel
        When the user clicks the "List of projects" link on the left panel
        Then the user selects search cell with header: "Description"
        And the user adds the text "ATP21 - PJM001" in selected cell and hits enter key
        And the user selects cell with column header: "Project" and row number: 1
        And the user clicks on the selected cell

        #store the project reference in a stored value
        And the user selects the text field with name: "Project"
        And the user stores the value of the selected text field with the key: "ENV_ATPPJM01"

        #Open Task planning action
        And the user clicks the "Task planning" button in the header

        #Data table: select the main data table of the page
        And the user selects the data table with x3 field name: "PJMTAS0_ARRAY_NBLIG"

        #Hierarchical cell: select the row containing the the project reference saved in the stored value and check the Status of the current line
        Given the user selects row that has the hierarchical cell with the stored text with key: "ENV_ATPPJM01"
        When the user selects cell with header: "Status" of selected row
        Then the value of the selected cell is "New"

        #Hierarchical cell: select the required hierarchical cell containing the project reference saved in the stored value
        Given the user selects hierarchical cell with the stored text with key: "ENV_ATPPJM01"

        #Hierarchical cell: expand the hierarchical cell
        When the user expands the hierarchical list of the selected cell

        #Hierarchical cell: select the required hierarchical cell
        Given the user selects hierarchical cell with text: "T-030 [ Server assembly and test ]"
        And the user expands the hierarchical list of the selected cell

        #select the row whose the hierarchical cell has the required value and check the value of a given cell on the same row
        Given the user selects row that has the hierarchical cell with text: "T-031 [ Server assembly ]"
        And the user selects cell with header: "Status" of selected row
        Then the value of the selected cell is "New"

        #Hierarchical cell: Collapse the hierarchical cell
        Given the user selects hierarchical cell with text: "T-030 [ Server assembly and test ]"
        And the user collapses the hierarchical list of the selected cell

        #Close task planning action
        And the user clicks the Close page action icon on the header panel

        #Close project function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313F2 - Logout scenario
        And the user logs-out from the system