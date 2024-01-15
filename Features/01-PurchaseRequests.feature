###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code : PurchaseRequests
# - Description : PR Creation, FP&A Workflow Attachment, PR Duplication
# - Legislation :
# - JIRA ID : 'ISFIN-1456 - ISFIN-1457 - ISFIN-1458'
# - Created by : cboumansour
# - Created date - 2024-01-05
# - Updated by :
# - Updated date :
###########################################################################

Feature: PurchaseRequests
    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    Scenario: PR Creation
        # Call Function by code
        Given the user opens the "GESPSH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "P2P Standard Entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase request P2P : Standard Entry" screen is displayed

        Given the user clicks the "New" main action button on the right panel

        #Set header fields
        And the user selects the text field with name: "Supplier"
        And the user writes "Sup000218" to the selected text field
        And the user selects the text field with name: "Request site"
        And the user writes "01000" to the selected text field
        And the user selects the text field with name: "Requester"
        And the user writes "301330" to the selected text field
        And the user selects the text field with name: "Currency"
        And the user writes "EUR" to the selected text field
        #And the user selects the text field with name: "Tax rule"
        #And the user writes "FRA" to the selected text field
        And the user selects the text field with name: "Payment term"
        And the user writes "15EOM-W20" to the selected text field
        And the user selects the text field with name: "Purchase Admin"
        And the user writes "JBAUD" to the selected text field
        And the user selects the text field with name: "Signatory ACT"
        And the user writes "HRS20" to the selected text field

        #Set Line field
        When the user selects the data table of section: "Lines"
        And the user selects cell with column header: "Product code" and row number: 1
        And the user adds the text "0000833" in selected cell
        And the user selects cell with column header: "Description" and row number: 1
        And the user adds the text "SCREEN" in selected cell
        And the user selects cell with column header: "Qty" and row number: 1
        And the user adds the text "1" in selected cell
        And the user selects cell with column header: "Unit price" and row number: 1
        And the user adds the text "100" in selected cell

        #Check alert box on empty ACT
        Given the user selects cell with column header: "ACT" and row number: 1
        And the user adds the text "" in selected cell
        And the user clicks the "Create" main action button on the right panel
        Then an alert box with the text "Mandatory dimension on dimension type ACT" appears
        And the user clicks the "Ok" opinion in the alert box
        And the user selects cell with column header: "ACT" and row number: 1
        And the user adds the text "HRS20" in selected cell

        #Check alert box on empty PRJ
        Given the user selects cell with column header: "PRJ" and row number: 1
        And the user adds the text "" in selected cell
        And the user clicks the "Create" main action button on the right panel
        Then an alert box with the text "Mandatory field" appears
        And the user clicks the "Ok" opinion in the alert box
        And the user selects cell with column header: "PRJ" and row number: 1
        And the user adds the text "000020" in selected cell

        #check validation
        And the user selects the text field with name: "Workflow comments*"
        And the user hits tab
        And the user writes block of text to the selected text area
            """
            Project approved for launch
            Approved by project supervisor
            """
        And the user hits tab

        And the user clicks the "Create" main action button on the right panel
        And the user selects the text field with name: "Request no."
        And the user stores the value of the selected text field with the key: "ENV_REQ_NUMBER"
        And the user selects the text field with name: "Signatory 1"
        Then the value of the selected text field is "MURAT Laurence"
        And the user selects the text field with name: "Signature Status"
        Then the value of the selected text field is "Workflow to launch"

    Scenario: FP&A Workflow Attachment
        When the user clicks the "Workflow" button in the header
        Then an alert box with the text "Please check the attachements...workflow not transmisted..." appears
        And the user clicks the "Ok" opinion in the alert box

        Given the user clicks the "Attachments" main action button on the right panel
        Then the modal dialog "Attachments" is displayed
        And the user selects the data table of section: "Attachments"
        And the user selects cell with column header: "Document name" and row number: 1
        And the user adds the text "[P2P attach]/Test.pdf" in selected cell
        And the user selects cell with column header: "Type" and row number: 1
        And the user adds the text "PDF" in selected cell
        And the user selects cell with column header: "Category" and row number: 1
        And  the user selects the choice "Confidential" of the selected cell

        And the user clicks the "OK" button in the header
        And the user clicks the "Workflow" button in the header
        And the user selects the text field with name: "Signature Status"
        And the value of the selected text field is "Pending FP&A"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: Logout scenario
        Then the user logs-out from the system

