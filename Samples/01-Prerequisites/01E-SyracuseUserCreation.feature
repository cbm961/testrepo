###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 01E-SyracuseUserCreation
# - Description: create a syracuse user
# - Created date: 05/04/2022
# - Updated date: 02/06/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 01E-SyracuseUserCreation

    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: Syracuse user creation

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed


        When the user clicks the "New user" action button on the header drop down

        #fill-in the user information
        And the user selects the text field with name: "Login"
        And the user writes "XATP" to the selected text field and hits tab key
        And the user selects the password fields with name: "New password"
        And the user writes "XATP" password to the selected password field
        And the user writes "XATP" password to the selected password confirmation field
        And the user selects the text field with name: "First name"
        And the user writes "XATP" to the selected text field
        And the user selects the text field with name: "Last name"
        And the user writes "XATP" to the selected text field
        And the user selects the icon field with name: "Groups"

        #Add user to Super administrator group
        And the user clicks on the "Add" icon of the selected icon field
        And the modal dialog "Groups" is displayed
        And the user selects the data table in the popup
        And the user selects search cell with header: "Description"
        And the user adds the text "Super administrators" in selected cell and hits enter key
        And the user selects cell with column header: "Description" and row number: 1
        And the user clicks on the selected cell
        And the user clicks the "Ok" button in the header

        #Create the user
        And the user clicks the "Save" action button on the header drop down

        #Verify that the user has been created
        Then a confirmation dialog appears with the message "The resource has been saved."

        And the user open the main page clicking on the logo

    Scenario: Logout scenario
        Then the user logs-out from the system