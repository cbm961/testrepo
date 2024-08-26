###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 01A-PrerequisiteSetupAndData
# - Description: Create prerequisites setup and dynamic data for the samples
# - Created date: 28/05/2020
# - Updated date: 20/02/2024
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 01A-PrerequisiteSetupAndData

    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    # -------------------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------STRUCTURAL SETUP CREATION ------------------------------------------------------
    # -------------------------------------------------------------------------------------------------------------------------------------------------

    #----------------------------------------------------------------------------
    # [101] - ATP2 company creation by duplication of NA20 Company
    #----------------------------------------------------------------------------
    Scenario Outline: <CPY> company creation by duplication of NA020 Company

        Given the user opens the "GESCPY" function
        Then the "Companies" screen is displayed

        #Left list selection
        Then the user clicks the "Companies" link on the left panel
        And the user selects the data table of left panel
        And the user selects search cell with header: "Company"
        And the user adds the text "NA20" in selected cell and hits tab key
        And the user selects cell with column header: "Company" and row number: 1
        And the user clicks on the selected cell

        #Modify the required company information
        And the user selects the text field with name: "Company"
        And the user writes <CPY> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "CPY0_CPYNAM"
        And the user writes <CPYNAM> to the selected text field
        And the user selects the text field with name: "Short description"
        And the user writes <CPY> to the selected text field
        And the user selects the text field with name: "Main site"
        And the user writes " " to the selected text field and hits tab key

        #Acct Tab
        And the user clicks the "Acct" tab selected by title
        And the user selects the date field with name: "First fiscal year"
        And the user writes first day of the year to the selected date field

        #Create the company
        When the user clicks the "Create" main action button on the right panel

        #Confirm duplication
        Then an alert box with the text "Continue and confirm the duplication?" appears
        And the user clicks the "Yes" opinion in the alert box

        #Close the function
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | CPY    | CPYNAM               |
            | "ATP2" | "ATP2 - ATP Samples" |


    #-------------------------------------------------------------------------------
    # [102] - ATP21 financial site creation by duplication of NA021 site
    #-------------------------------------------------------------------------------
    Scenario Outline: <FCY> financial site creation by duplication of NA021 site

        Given the user opens the "GESFCY" function
        Then the "Sites" screen is displayed

        #Site template selection
        And the user selects the text field with name: "Site"
        And the user writes "NA021" to the selected text field and hits tab key

        #Modify the required site information
        And the user selects the text field with name: "Site"
        And the user writes <FCY> to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes <FCYNAM> to the selected text field
        And the user selects the text field with name: "Short description"
        And the user writes <FCY> to the selected text field
        And the user selects the text field with name: "Legal company"
        And the user writes <LEGCPY> to the selected text field

        Then the user clicks the "Details" tab selected by title
        And the user selects the check box with name: "Saturday"
        And the user sets the check box to ticked
        And the user selects the check box with name: "Sunday"
        And the user sets the check box to ticked

        #Create financial site
        When the user clicks the "Create" main action button on the right panel

        #Confirm duplication
        Then an alert box with the text "Continue and confirm the duplication?" appears
        And the user clicks the "Yes" opinion in the alert box

        # Then an alert box with the text containing "Replace address" appears
        # And the user clicks the "Yes" opinion in the alert box

        #To wait for the error address validation message to disappear when it is returned
        And the user waits 35 seconds

        #Close the function
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | FCY     | FCYNAM                    | LEGCPY |
            | "ATP21" | "Site ATP21 company ATP2" | "ATP2" |


    #----------------------------------------------------------------------------
    # [103] - ATP2 Company Main site update
    #----------------------------------------------------------------------------
    Scenario Outline: <CPY> Company Main Site Update
        Given the user opens the "GESCPY" function
        Then the "Companies" screen is displayed

        #General tab
        And the user selects the text field with name: "Company"
        And the user writes <CPY> to the selected text field and hits tab key
        And the user selects the text field with name: "Main site"
        And the user writes <FCY> to the selected text field and hits tab key

        #Save and close the function
        Then the user clicks the "Save" main action button on the right panel
        Then the user clicks the Close page action icon on the header panel
        Examples:
            | CPY    | FCY     |
            | "ATP2" | "ATP21" |


    #----------------------------------------------------------------------------
    # [104] - fiscal years opening for ATP2 company
    #----------------------------------------------------------------------------
    Scenario Outline: Open all fiscal years for <CPY> company
        Given the user opens the "GESFIY" function
        Then the "Fiscal year management" screen is displayed

        And the user selects the text field with name: "Company"
        And the user writes <CPY> to the selected text field
        And the user hits tab
        And the user selects the drop down list with name: "Ledger type"
        And the user clicks on "Legal" option of the selected drop down list

        #Open 1st Fiscal Year
        And the user clicks the "Opening" button in the header
        Then the user clicks the "OK" button in the header

        #Open 2nd Fiscal Year
        And the user clicks the "Opening" button in the header
        Then the user clicks the "OK" button in the header

        #Close the function
        Then the user clicks the Close page action icon on the header panel
        Examples:
            | CPY    |
            | "ATP2" |


    #----------------------------------------------------------------------------
    # [105] - Fiscal periods opening for ATP2 company
    #----------------------------------------------------------------------------
    Scenario Outline: Open all fiscal Periods for <CPY> company
        Given the user opens the "GESPER" function
        Then the "Periods" screen is displayed

        And the user selects the text field with name: "Company"
        And the user writes <CPY> to the selected text field
        And the user hits tab
        And the user selects the drop down list with name: "General ledger type"
        And the user clicks on "Legal" option of the selected drop down list
        And the user selects the text field with name: "Fiscal year"
        And the user writes "1" to the selected text field and hits enter key

        #Open first Periods
        And the user clicks the "Opening" button in the header
        Then the user clicks the "OK" button in the header

        #Open remaining periods
        And the user clicks the "Opening" button in the header
        Then the user clicks the "OK" button in the header

        #Close the function
        Then the user clicks the Close page action icon on the header panel
        Examples:
            | CPY    |
            | "ATP2" |


    #--------------------------------------------------------------------------------
    # [106] - Bank account BATP2 creation for company ATP2
    #--------------------------------------------------------------------------------
    Scenario Outline: Create <BAN> Bank accounts for company <CPY>
        Given the user opens the "GESBAN" function
        Then the "Bank account" screen is displayed
        #Left list selection
        Then the user clicks the "Bank accounts" link on the left panel
        And the user selects the data table of left panel
        And the user selects search cell with header: "Code"
        And the user adds the text "NA2US" in selected cell and hits tab key
        And the user selects cell with column header: "Code" and row number: 1
        And the user clicks on the selected cell
        #Header section
        And the user selects the text field with name: "Code"
        And the user writes <BAN> to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes <DES> to the selected text field
        #General Tab
        And the user clicks the "General" tab selected by title
        And the user selects the text field with name: "Treasury interface"
        And the user writes <TRECOD> to the selected text field
        #Management Tab
        And the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Company"
        And the user writes <CPY> to the selected text field
        And the user selects the text field with name: "File extension"
        And the user writes <FILEXT> to the selected text field
        #Create bank account
        When the user clicks the "Create" main action button on the right panel
        #Confirm duplication
        Then an alert box with the text "Continue and confirm the duplication?" appears
        And the user clicks the "Yes" opinion in the alert box
        #Close the function
        Then the user clicks the "Close page" main action button on the right panel
        Examples:
            | BAN     | DES                 | TRECOD        | CPY    | FILEXT |
            | "BATP2" | "Bank company ATP2" | "BATP2TRSINT" | "ATP2" | "ATP"  |

    # ----------------------------------------------------------------------------
    # [107.1] - Open BP invoice Entry function
    # ----------------------------------------------------------------------------
    Scenario: Open BP invoice Entry function
        Given the user opens the "GESIDP" function
        Then the "BP invoice entry settings" screen is displayed


    # ----------------------------------------------------------------------------
    # [107.2] - Set BP invoice Entry setup for company ATP2
    # ----------------------------------------------------------------------------
    Scenario Outline: Set BP invoice Entry setup for company <CPY>

        Given the user selects the text field with name: "Company"
        Then the user writes <CPY> to the selected text field and hits tab key
        And the user selects the drop down list with name: "Document type"
        And the user clicks on <TYP> option of the selected drop down list

        #Select the data table
        And the user selects the main data table of the page

        #Set IAS Ledger
        And the user selects row that has the text "IAS" in column with header: "Ledger type"
        And the user selects cell with header: "Enter account" of selected row
        And the user selects the choice "Yes" of the selected cell
        And the user selects cell with header: "Enter account" of selected row
        And the user edits text to "20" for cell with header: "Order" of selected row

        #Set Group Ledger
        And the user selects row that has the text "Group" in column with header: "Ledger type"
        And the user selects cell with header: "Enter account" of selected row
        And the user selects the choice "Yes" of the selected cell
        And the user selects cell with header: "Enter account" of selected row
        And the user edits text to "30" for cell with header: "Order" of selected row

        Then the user clicks the "Save" main action button on the right panel

        Examples:
            | CPY    | TYP                 |
            | "ATP2" | "Supplier invoices" |
            | "ATP2" | "Customer invoices" |


    # ----------------------------------------------------------------------------
    # [107.3] - Close BP invoice Entry function
    # ----------------------------------------------------------------------------
    Scenario:  Close BP invoice Entry function
        Then the user clicks the Close page action icon on the header panel


    # ----------------------------------------------------------------------------
    # [108] - Product creation
    # ----------------------------------------------------------------------------
    Scenario: Product creation

        #Open Product function
        Given the user opens the "GESITM" function
        When the "Product" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Header information
        When the user selects the text field with name: "Category"
        And the user writes "BMSOL" to the selected text field
        When the user selects the text field with name: "Description"
        And the user writes "ATPPRD01" to the selected text field

        And the user clicks the "Suppliers" tab selected by title
        And the user selects the data table with x3 field name: "ITP_ARRAY_NBITP"
        And the user selects last editable cell with column header: "Supplier"
        And the user adds the text "NA052" in selected cell and hits enter key

        And the user selects the text field with name: "Supplier product"
        And the user writes "NA052 - ATPPRD01" to the selected text field

        #Confirm creation message
        And the user clicks the "Create" main action button on the right panel
        Then an alert box with the text containing "The Product was created" appears
        And the user clicks the "Ok" option in the alert box

        #Save the product reference in a stored value
        And the user selects the text field with name: "Product"
        And the user stores the value of the selected text field with the key: "ENV_ITM01"

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    # ----------------------------------------------------------------------------
    # [109.1] - Open product site function
    # ----------------------------------------------------------------------------
    Scenario:  Open product site function
        Given the user opens the "GESITF" function
        Then the "Product-site" screen is displayed

    #--------------------------------------------------------------------------------
    # [109.2] - Product site creation
    #--------------------------------------------------------------------------------
    Scenario:  Create product site

        When the user clicks the "New" main action button on the right panel

        Then the user selects the text field with name: "Product"
        And the user writes the stored text with key "ENV_ITM01" in the selected text field
        And the user selects the text field with name: "Stock site"
        And the user writes "ATP21" to the selected text field

        Then the user selects the check box with name: "Location management"
        And the user sets the check box to unticked

        Then the user clicks the "Create" main action button on the right panel


    #--------------------------------------------------------------------------------
    # [109.3] - Product site creation
    #--------------------------------------------------------------------------------
    Scenario Outline: Create product site

        When the user clicks the "New" main action button on the right panel

        Then the user selects the text field with name: "Product"
        And the user writes <ITMREF> to the selected text field
        And the user selects the text field with name: "Stock site"
        And the user writes "ATP21" to the selected text field

        Then the user selects the check box with name: "Location management"
        And the user sets the check box to unticked

        #Create product site
        #Product BMS012 used in feature: 0202A-SalesStandardFlow / 0202B-PurchasesStandardFlow / 0304H-DataTableandFormsManagement / 0304N-DataTableandCellActionManagement
        #Product BMS013 used in feature: 0304N-DataTableandCellActionManagement
        #Product SFI903 / RAW903 used in feature: 0308A-ModalDialogManagement
        Then the user clicks the "Create" main action button on the right panel

        Examples:
            | ITMREF   |
            | "BMS012" |
            | "BMS013" |
            | "SFI903" |
            | "RAW903" |


    # ----------------------------------------------------------------------------
    # [109.3] - Close product site function
    # ----------------------------------------------------------------------------
    Scenario:  Close product site function
        Then the user clicks the Close page action icon on the header panel


    # ----------------------------------------------------------------------------
    # [110] - Set standard cost
    # ----------------------------------------------------------------------------
    Scenario:  Set standard cost

        Given the user opens the "GESICD" function
        Then the "Standard costs" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Set header information
        And the user selects the text field with name: "Product"
        And the user writes "RAW903" to the selected text field
        And the user selects the text field with name: "Storage site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Fiscal year"
        And the user writes "1" to the selected text field and hits tab key

        #Set Level cost
        When the user clicks the "Level cost" tab selected by title
        And the user selects the text field with name: "Component"
        And the user writes "120" to the selected text field
        And the user selects the text field with name: "Calculation quantity"
        And the user writes "1" to the selected text field

        #Create standard cost
        Then the user clicks the "Create" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [111] - Work center creation
    #--------------------------------------------------------------------------------
    Scenario: Create work center

        Given the user opens the "GESMWS" function
        Then the "Work centers" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Set header information
        And the user selects the text field with name: "Work center"
        And the user writes "ATPWKC" to the selected text field
        And the user selects the text field with name: "Manufacturing site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "ATP21 Work center" to the selected text field
        And the user selects the text field with name: "Work center group"
        And the user writes "GLA01" to the selected text field and hits tab key
        And the user selects the radio buttons group with name: "Work center type"
        And the user clicks on "Subcontracting" radio button of the selected radio buttons group

        #Set management information
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Structure"
        And the user writes "SC0" to the selected text field
        And the user selects the text field with name: "No. of resources"
        And the user writes "1" to the selected text field
        And the user selects the text field with name: "Automatic closing %"
        And the user writes "100" to the selected text field

        #Create the work center
        Then the user clicks the "Create" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [112] - Routings creation
    #--------------------------------------------------------------------------------
    Scenario: Create Routing

        Given the user opens the "GESROU" function
        Then the "Routings" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Set main information
        And the user selects the text field with name: "Routing"
        And the user writes "SFI903" to the selected text field
        And the user selects the text field with name: "Routing code"
        And the user writes "40" to the selected text field
        And the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the date field with name: "Validity start date"
        And the user writes first day of the year to the selected date field
        And the user selects the date field with name: "Validity end date"
        And the user writes last day of the year to the selected date field
        And the user hits tab
        And the user selects the radio buttons group with name: "Use status"
        And the user clicks on "Available to use" radio button of the selected radio buttons group

        #Set header information
        When the user clicks the "Header" tab selected by title
        And the user selects the radio buttons group with X3 field name: "ROU2_WORTYP"
        And the user clicks on "Change materials and operations" radio button of the selected radio buttons group

        #Set routing information
        When the user clicks the "Routings" tab selected by title
        And the user selects the data table of section: "Operations"
        And the user selects last editable cell with column header: "Work center"
        And the user adds the text "ATPWKC" in selected cell
        And the user selects last editable cell with column header: "Subcon prod"
        And the user adds the text "SER008" in selected cell and hits enter key

        #Create the routing
        Then the user clicks the "Create" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [113] - Set Accounting code transaction
    #--------------------------------------------------------------------------------
    Scenario: Set Accounting code transaction for NA2 Accounting core model

        Given the user opens the "GESGCO" function
        When the "Acct. code entry transactions" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Set header information
        And the user selects the text field with name: "Transaction code"
        And the user writes "NA2" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "NA2" to the selected text field
        And the user selects the text field with name: "Legislation"
        And the user writes "USA" to the selected text field

        #Set chart of accounts
        When the user selects the data table of section: "Selection"
        And the user selects last editable cell with column header: "Chart of accounts"
        And the user adds the text "NA1" in selected cell and hits enter key
        And the user selects last editable cell with column header: "Chart of accounts"
        And the user adds the text "IUS" in selected cell and hits enter key
        And the user selects last editable cell with column header: "Chart of accounts"
        And the user adds the text "INT" in selected cell and hits enter key

        #Create accounting code transaction
        Then the user clicks the "Create" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [114] - Create fixed asset accounting code
    #--------------------------------------------------------------------------------
    Scenario: Create fixed asset accounting code NA17200

        Given the user opens the "GESCAC" function

        #Select accounting code transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "NA2 NA2" and column header: ""
        And the user clicks on the selected cell

        Then the "Accounting codes NA2 NA2" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Set header information
        And the user selects the drop down list with name: "Type"
        And the user clicks on "Fixed assets" option of the selected drop down list
        And the user selects the text field with name: "Code"
        And the user writes "NA17200" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "NA17200" to the selected text field
        And the user selects the text field with name: "Short description"
        And the user writes "NA17200" to the selected text field

        #Set details accounts
        When the user selects the data table of section: "Details"
        And the user selects row that has the text "Fixed asset account" in column with header: "Description"
        And the user selects cell with header: "Leg./Ana USA" of selected row
        And the user adds the text "17200" in selected cell and hits enter key

        #Create the accounting code
        When the user clicks the "Create" main action button on the right panel

        Then an alert box with the text "Continue and confirm the duplication?" appears
        And the user clicks the "Yes" opinion in the alert box

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [115] - Depreciation context creation
    #--------------------------------------------------------------------------------
    Scenario: Create depreciation context

        Given the user opens the "GESCNX" function
        Then the "Depreciation contexts" screen is displayed

        When the user clicks the "New" main action button on the right panel

        Then the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field


        #Create product site
        #Used in feature: 0304H-DataTableandFormsManagement
        Then the user clicks the "Create" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [116.1] -  Set Association definition
    #--------------------------------------------------------------------------------
    Scenario: Set New Association definition for company ATP2

        Given the user opens the "GESRDE" function
        Then the "Associations - definition" screen is displayed

        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field

        And the user selects the drop down list with name: "Business object"
        And the user clicks on "Asset" option of the selected drop down list
        And the user selects the drop down list with name: "Decisive"
        And the user clicks on "Asset group" option of the selected drop down list
        And the user hits tab


    #--------------------------------------------------------------------------------
    # [116.2] -  Set Association definition Given sections grid
    #--------------------------------------------------------------------------------
    Scenario Outline: Set Association definition Given sections grid

        #Set the Given sections grid
        When the user selects the data table of section: "Given sections"
        And the user selects row that has the text <HEADINGS_VALUE> in column with header: "Headings"
        And the user selects cell with header: "Mangd" of selected row
        And the user ticks the checkbox contained in the selected cell
        And the user sets rows to display to 100

        Examples:
            | HEADINGS_VALUE        |
            | "Type of assets"      |
            | "Accounting code"     |
            | "Depreciation method" |
            | "Depreciation Period" |
            | "Depreciation Rate"   |
            | "Type prorata"        |


    #--------------------------------------------------------------------------------
    # [116.3] -  Set Association definition
    #--------------------------------------------------------------------------------
    Scenario: Finalize the creation of the Association definition for company ATP2

        Then the user clicks the "Create" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [117] -  Set Association value for company ATP2 & Asset group Computer
    #--------------------------------------------------------------------------------
    Scenario: Set Association value for company ATP2 & Asset group Computer

        Given the user opens the "GESRVA" function
        Then the "Associations - values" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Set header information
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits tab key
        And the user selects the drop down list with name: "Business object"
        And the user clicks on "Asset" option of the selected drop down list
        And the user selects the drop down list with name: "Decisive"
        And the user clicks on "Asset group" option of the selected drop down list
        And the user selects the text field with name: "Value"
        And the user writes "COMPUTER" to the selected text field and hits tab key
        And the user hits escape

        #Set Asset properties
        When the user selects the data table of section: "Values"
        And the user selects row that has the text "Type of assets" in column with header: "Headings"
        And the user selects cell with header: "Value" of selected row
        And the user adds the text "1" in selected cell
        And the user selects row that has the text "Accounting code" in column with header: "Headings"
        And the user selects cell with header: "Value" of selected row
        And the user adds the text "NA17200" in selected cell

        #Set plan values
        When the user selects the data table of section: "Plan values"
        And the user selects row that has the text "Accounts" in column with header: "Plan"
        And the user selects cell with header: "Method" of selected row
        And the user adds the text "RE" in selected cell
        And the user selects cell with header: "Duration" of selected row
        And the user adds the text "5" in selected cell and hits enter key

        #Create association value
        Then the user clicks the "Create" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    # ----------------------------------------------------------------------------
    # [118] - Set Bank ID information to supplier NA052
    # ----------------------------------------------------------------------------
    Scenario: Set Bank ID information to supplier NA052

        Given the user opens the "GESBPS" function
        Then the "Supplier" screen is displayed

        Then the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field

        When the user clicks the "Bank details" tab selected by title
        And the user selects the data table with x3 field name: "BIDBPS_ARRAY_NBRIB"
        And the user selects last editable cell with column header: "Bank account number"
        And the user adds the text "102780350200011103940298" in selected cell
        And the user selects last editable cell with column header: "Paying bank"
        And the user adds the text "Bank of America" in selected cell
        And the user selects last editable cell with column header: "BIC code"
        And the user adds the text "BOFAUS3N" in selected cell
        And the user hits enter key in the selected cell

        #Save the modification
        Then the user clicks the "Save" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    # ----------------------------------------------------------------------------
    # [119] - Activate purchase order signature for ATP2 company
    # ----------------------------------------------------------------------------
    Scenario: Activate purchase order signature for ATP2 company


        Given the user opens the "ADPVAL" function

        And the "Parameter values" screen is displayed

        #Select purchase chapter for company ATP2
        And the user selects the text field with name: "Chapter"
        And the user writes "ACH" to the selected text field
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits enter key

        # Open the Signature management group
        And the user selects the main fixed data table of the page
        And the user selects row that has the text "APP" in column with header: "Group"
        And the user opens "Detail" function on toolbox of the selected row

        And the modal dialog "Parameter values" is displayed

        #Activate signature for purchase orders
        And the user selects the fixed data table in the popup
        And the user selects row that has the text "APPPOH" in column with header: "Parameter"
        And the user selects cell with header: "Value" of selected row
        And the user adds the text "Yes, mandatory" in selected cell and hits enter key

        #Confirm the modification
        And the user clicks the "OK" button in the header

        #Save the modification
        And the user clicks the "Save" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    # ----------------------------------------------------------------------------
    # [120] - Create user assignments for purchase order signature for company ATP2
    # ----------------------------------------------------------------------------
    Scenario: Create user assignments for purchase order signature for company ATP2

        Given the user opens the "GESAWV" function

        And the "Rule values" screen is displayed

        #Left panel: select the required data using the left list
        Given the user selects the data table of left panel
        When the user clicks the "Rule values" link on the left panel

        #Search cell: use the search cell to filter the Category
        And the user selects search cell with header: "Rule"
        And the user adds the text "POHSIG" in selected cell and hits enter key
        And the user selects cell with column header: "Rule" and row number: 1
        And the user clicks on the selected cell

        #Duplicate the record for company ATP2
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits tab key

        #Define main approver
        And the user selects the data table of section: "Default user"
        And the user selects cell with column header: "User code" and row number: 1
        And the user adds the text "ADMIN" in selected cell and hits enter key

        #Define the signature rules values
        And the user selects the data table of section: "Values"
        And the user selects last editable cell with column header: "Supplier stat 1"
        And the user adds the text "200" in selected cell
        And the user selects last editable cell with column header: "Maximum value"
        And the user adds the text "10000" in selected cell and hits enter key


        #Create the record
        And the user clicks the "Create" main action button on the right panel

        And an alert box with the text containing "Continue and confirm the duplication?" appears
        And the user clicks the "Yes" option in the alert box

        #Close the function
        And the user clicks the Close page action icon on the header panel


    # -------------------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------Dynamic DATA CREATION ----------------------------------------------------------
    # -------------------------------------------------------------------------------------------------------------------------------------------------


    #--------------------------------------------------------------------------------
    # [202] Create budget envelope
    #--------------------------------------------------------------------------------
    Scenario: Create budget envelope

        Given the user opens the "GESENV" function
        Then the "Budget envelopes" screen is displayed

        When the user clicks the "New" main action button on the right panel

        #Set header information
        Then the user selects the text field with name: "Budget type"
        And the user writes "ENVA" to the selected text field
        And the user selects the text field with name: "Budget code"
        And the user writes "NAO" to the selected text field
        And the user selects the text field with name: "Description"
        And the user writes "ATP2 - Budget envelope 1" to the selected text field

        #Set enveloppe information
        When the user clicks the "Envelope" tab selected by title
        Then the user selects the text field with name: "Company/Site"
        And the user writes "ATP2" to the selected text field
        And the user selects the text field with name: "Responsible entity"
        And the user writes "60101" to the selected text field
        And the user selects the date field with name: "Completion date from/to"
        And the user writes first day of the year to the selected date field
        And the user hits tab

        And the user selects the text field with name: "Envelope amount"
        And the user writes "10000" to the selected text field

        #Set Budgets data table
        When the user selects the data table of section: "Budgets"
        Then the user selects row that has the text "1 - " in column with header: "Fiscal year"
        And the user selects cell with header: "Budget amount" of selected row
        And the user adds the text "10000" in selected cell

        #Create the budget enveloppe
        Then the user clicks the "Create" main action button on the right panel

        #close the function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [203] Create stock entry
    #--------------------------------------------------------------------------------
    Scenario: Create stock entry

        Given the user opens the "GESSMR" function

        #Select miscellenous receipt transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Misc Stock Receipts Full Entry" and column header: ""
        And the user clicks on the selected cell

        And the user dismisses the alert box

        Then the "Miscellaneous receipts ALL : Misc Stock Receipts Full Entry" screen is displayed

        #Entering in creation mode.
        When the user clicks the "New" main action button on the right panel

        #Set header information
        Then the user selects the text field with name: "Stock site"
        And the user writes "ATP21" to the selected text field
        And the user selects the date field with name: "Allocation date"
        And the user writes a generated date in the selected date field using the value "T-1"

        #Set stock lines information
        Given the user selects the fixed data table of section: "Lines"
        When the user selects last fixed cell with header: "Product"
        Then the user adds the text "BMS012" in selected cell
        And the user selects last editable cell with column header: "Quantity"
        And the user adds the text "100" in selected cell


        #Create the budget enveloppe
        Then the user clicks the "Create" main action button on the right panel

        #Close Print labels
        Then the user clicks the Close page action icon on the header panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [204.1] Open Supplier Invoice function
    #--------------------------------------------------------------------------------
    Scenario: Open Supplier Invoice function

        Given the user opens the "GESBIS" function
        Then the "Supplier BP invoice" screen is displayed


    #--------------------------------------------------------------------------------
    # [204.2] Create supplier invoice
    #--------------------------------------------------------------------------------
    Scenario Outline: Create suoplier invoice

        Given the user clicks the "New" main action button on the right panel

        #Main Header fields definition
        Then the user selects the text field with name: "Site"
        And the user writes <FCY> to the selected text field
        And the user selects the text field with name: "Invoice type"
        And the user writes <PIVTYP> to the selected text field
        And the user selects the date field with name: "Accounting date"
        And the user writes first day of month to the selected date field
        And the user selects the text field with name: "Supplier"
        And the user writes <BPR> to the selected text field and hits tab key

        #Header Tab fields definition
        And the user clicks the "Header" tab selected by title

        And the user selects the text field with name: "Source document"
        And the user writes <BPRVCR> to the selected text field
        And the user selects the text field with name: "Currency"
        And the user writes <CUR> to the selected text field
        And the user selects the text field with name: "Amount - tax"
        And the user writes <AMTNOT> to the selected text field
        And the user selects the text field with name: "Amount + tax"
        And the user writes <AMTATI> to the selected text field
        And the user selects the text field with name: "Payment term"
        And the user writes "CH30NET" to the selected text field
        And the user selects the text field with name: "Discount/Late charge"
        And the user writes <DEP> to the selected text field
        # And the user selects the text field with name: "1099 box"
        # And the user writes "8" to the selected text field
        And the user selects the text field with name: "Tax rule"
        And the value of the selected text field is <VAC>
        And the user selects the radio buttons group with name: "Supplier amount type"
        And the user clicks on "Exclude tax" radio button of the selected radio buttons group
        And the user selects the drop down list with name: "Pay approval"
        And the user clicks on "Authorized to pay" option of the selected drop down list

        #Lines Tab fields definition
        And the user clicks the "Lines" tab selected by title
        And the user selects the data table of section: "Details"
        And the user selects last editable cell with X3 field name: "BIS3_FCYLIN"
        And the user clicks on the selected cell
        And the user selects last editable cell with X3 field name: "BIS3_ACC1"
        And the user adds the text "70900" in selected cell
        And the user selects last editable cell with X3 field name: "BIS3_AMTNOTLIN"
        And the user adds the text <AMTNOTLIN> in selected cell
        And the user selects last editable cell with X3 field name: "BIS3_VAT"
        And the user adds the text <VAT> in selected cell

        #Add dimension value on Dimension type "Dim type 1"
        And the user selects last editable cell with X3 field name: "BIS3_CCE1"
        And the user adds the text "PEND-001" in selected cell

        #Add dimension value on Dimension type "IAStype sec1"
        And the user selects last editable cell with X3 field name: "BIS3_CCE2"
        And the user adds the text "SERVICE" in selected cell

        #Invoice Creation
        #Used in feature: 0306B-RightPanelSecondaryActionManagement
        #Used in feature: 0309A-AlertBoxManagement
        #Used in feature: 0310A-LogPanelManagement
        #Generated document: PIDATP21*-000001 / PIDATP21*-000002
        Then the user clicks the "Create" main action button on the right panel
        And the user clicks the "Update..." secondary action button on the right panel

        Examples:
            | FCY     | PIVTYP | BPR     | BPRVCR         | CUR   | AMTNOT    | AMTATI    | VAC   | DEP | AMTNOTLIN | VAT |
            | "ATP21" | "DIR"  | "NA052" | "ATP-BIS1-001" | "USD" | "1000.00" | "1000.00" | "NTX" | ""  | "1000.00" | ""  |
            | "ATP21" | "DIR"  | "NA052" | "ATP-BIS2-002" | "USD" | "1000.00" | "1000.00" | "NTX" | ""  | "1000.00" | ""  |


    #--------------------------------------------------------------------------------
    # [204.3] Close supplier invoice function
    #--------------------------------------------------------------------------------
    Scenario: Close supplier invoice function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [205.1] Open Customer Invoice function
    #--------------------------------------------------------------------------------
    Scenario: Open customer invoice
        Given the user opens the "GESBIC" function
        Then the "Customer BP invoice" screen is displayed


    #--------------------------------------------------------------------------------
    # [205.2] Create customer invoice
    #--------------------------------------------------------------------------------
    Scenario Outline: Create customer invoice
        Given the user clicks the "New" main action button on the right panel

        #Main Header fields definition
        Then the user selects the text field with name: "Site"
        And the user writes <FCY> to the selected text field
        And the user selects the text field with name: "Invoice type"
        And the user writes <SIVTYP> to the selected text field
        And the user selects the date field with name: "Accounting date"
        And the user writes first day of month to the selected date field
        And the user selects the text field with name: "Customer"
        And the user writes <BPR> to the selected text field and hits tab key

        #Header Tab fields definition
        And the user clicks the "Header" tab selected by title

        And the user selects the text field with name: "Source document"
        And the user writes <BPRVCR> to the selected text field
        And the user selects the text field with name: "Currency"
        And the user writes <CUR> to the selected text field
        And the user selects the text field with name: "Amount - tax"
        And the user writes <AMTNOT> to the selected text field
        And the user selects the text field with name: "Amount + tax"
        And the user writes <AMTATI> to the selected text field
        And the user selects the text field with name: "Payment term"
        And the user writes "CH30NET" to the selected text field
        And the user selects the text field with name: "Early discounts/Late charges"
        And the user writes "" to the selected text field
        And the user selects the text field with name: "Tax rule"
        And the value of the selected text field is <VAC>
        And the user selects the radio buttons group with name: "Amount type"
        And the user clicks on "Exclude tax" radio button of the selected radio buttons group

        #Lines Tab fields definition
        And the user clicks the "Lines" tab selected by title
        And the user selects the data table of section: "Details"
        And the user selects last editable cell with X3 field name: "BIC3_FCYLIN"
        And the user clicks on the selected cell
        And the user selects last editable cell with X3 field name: "BIC3_ACC1"
        And the user adds the text "41100" in selected cell
        And the user selects last editable cell with X3 field name: "BIC3_AMTNOTLIN"
        And the user adds the text <AMTNOTLIN> in selected cell
        And the user selects last editable cell with X3 field name: "BIC3_VAT"
        And the user adds the text <VAT> in selected cell

        #Add dimension value on Dimension type "Dim type 1"
        And the user selects last editable cell with X3 field name: "BIC3_CCE1"
        And the user adds the text "ACCT-001" in selected cell

        #Add dimension value on Dimension type "IAStype sec1"
        And the user selects last editable cell with X3 field name: "BIC3_CCE2"
        And the user adds the text "SERVICE" in selected cell

        #Invoice Creation & Posting
        #Used in feature: 0305A-PageActionManagement / 307C-PickingListManagement
        #Generated document:DIR000022 / DIR000023
        Then the user clicks the "Create" main action button on the right panel
        And the user selects the text field with name: "Document no."
        And the user stores the value of the selected text field with the key: <NUM>
        And the user clicks the "Update..." secondary action button on the right panel


        Examples:
            | FCY     | SIVTYP | BPR     | BPRVCR         | CUR   | AMTNOT    | AMTATI    | VAC   | AMTNOTLIN | VAT     | NUM               |
            | "ATP21" | "DIR"  | "NA003" | "ATP-BIC1-001" | "USD" | "1000.00" | "1070.00" | "NTX" | "1000.00" | "USTAX" | "ENV_ATPBICNUM01" |
            | "ATP21" | "DIR"  | "NA003" | "ATP-BIC2-002" | "USD" | "1000.00" | "1070.00" | "NTX" | "1000.00" | "USTAX" | "ENV_ATPBICNUM02" |


    #--------------------------------------------------------------------------------
    # [205.3] post customer invoice
    #--------------------------------------------------------------------------------
    Scenario: Post Customer invoice

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Customer BP invoices" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the stored text with key "ENV_ATPBICNUM01" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        And the user clicks the "Post" button in the header
        And the user clicks the "Yes" opinion in the alert box

    #--------------------------------------------------------------------------------
    # [205.4] Close customer invoice function
    #--------------------------------------------------------------------------------
    Scenario: Close customer invoice function
        Then the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    # [206.1] Open Sales order function
    #--------------------------------------------------------------------------------
    Scenario: Open Sales order function

        #Open Sales order function
        Given the user opens the "GESSOH" function

        #Select sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed


    #--------------------------------------------------------------------------------
    # [206.2] Create Sales order
    #--------------------------------------------------------------------------------
    Scenario Outline: Sales order creation

        #Entering in creation mode.
        When the user clicks the "New" main action button on the right panel

        #Set header information
        Then the user selects the text field with name: "Sales site"
        And the user writes <FCY> to the selected text field
        And the user selects the date field with name: "Date"
        And the user writes a generated date in the selected date field using the value "T+2"
        And the user selects the text field with name: "Sold-to"
        And the user writes <BPCORD> to the selected text field and hits tab key

        #Select management section
        #Verification of the Tax rule & currency used on the sales invoice.
        Then the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Tax rule"
        And the value of the selected text field is <VACBPR>
        And the user selects the text field with name: "Currency"
        And the value of the selected text field is <CUR>

        #Set delivery information
        Then the user clicks the "Delivery" tab selected by title
        And the user selects the text field with name: "Shipment site"
        And the user writes <FCY> to the selected text field
        And the user selects the drop down list with name: "Delivery priority"
        And the user clicks on "Urgent" option of the selected drop down list

        When the user clicks the "Lines" tab selected by title

        #Set sales order lines information
        When the user selects the fixed data table of section: "Lines"
        Then the user selects last fixed cell with header: "Product"
        And the user adds the text <ITMREF> in selected cell
        And the user selects the data table of section: "Lines"
        And the user selects last editable cell with column header: "Ordered qty."
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with column header: "Gross price"
        And the user adds the text <GROPRI> in selected cell and hits tab key
        And the user hits enter

        #Create the sales order.
        #Sales order used in feature: 0304P-DataTableandStoredParameterManagement
        #Sales order used in feature: 0307C-PickingListManagement
        # Generated document: SONATP210001
        When the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

        Examples:
            | FCY     | BPCORD  | VACBPR | CUR   | ITMREF   | QTY | GROPRI |
            | "ATP21" | "NA008" | "NTX"  | "USD" | "BMS012" | "4" | "150"  |


    #--------------------------------------------------------------------------------
    # [206.3] Close Sales order function
    #--------------------------------------------------------------------------------
    Scenario: Close Sales order function

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: Logout scenario
        Then the user logs-out from the system