###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303C-DateFieldManagement
# - Description: How to interact with date fields
#                - How to enter a date in a date field - Common to all languages
#                - How to enter a date in a date field - Specificities for German language
#                - How to enter a date in a date field - Specificities for British language
#                - How to enter a date in a date field - Specificities for United States language
#                - How to enter a date in a date field - Specificities for Spanish language
#                - How to enter a date in a date field - Specificities for French language
#                - How to enter a date in a date field - Specificities for Italian language
#                - How to enter a date in a date field - Specificities for Polish language
#                - How to enter a date in a date field - Specificities for Portuguese language
#                - How to enter a date in a date field - Specificities for Chinese language
# - Created date: 21/01/2020
# - Updated date: 10/02/2023
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303C-DateFieldManagement

    Scenario: 0303C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303C1 - Date field management - How to enter a date in a date field - Common to all languages

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - Today's date
        Given the user selects the date field with name: "Accounting date"
        When the user writes today to the selected date field
        Then the value of the selected date field is today

        #Date field: entering & verifying value - Tomorrow’s date
        Given the user selects the date field with name: "Accounting date"
        When the user writes a generated date in the selected date field using the value "T+1"
        Then the value of the selected date field is a generated date using value "T+1"
        And the user takes a screenshot

        #Date field: entering & verifying value - Yesterday's date
        Given the user selects the date field with name: "Accounting date"
        When the user writes a generated date in the selected date field using the value "T-1"
        Then the value of the selected date field is a generated date using value "T-1"
        And the user takes a screenshot

        #Date field: entering & verifying value - n day after today with n=3
        Given the user selects the date field with name: "Accounting date"
        When the user writes a generated date in the selected date field using the value "T+3"
        Then the value of the selected date field is a generated date using value "T+3"
        And the user takes a screenshot

        #Date field: entering & verifying value - n day before today with n=3
        Given the user selects the date field with name: "Accounting date"
        When the user writes a generated date in the selected date field using the value "T-3"
        Then the value of the selected date field is a generated date using value "T-3"
        And the user takes a screenshot

        #Date field: entering & verifying value - First day of the current month
        Given the user selects the date field with name: "Accounting date"
        When the user writes first day of month to the selected date field
        Then the value of the selected date field is the first day of the month
        And the user takes a screenshot

        #Date field: entering & verifying value - Last Day of the current month
        Given the user selects the date field with name: "Accounting date"
        When the user writes last day of month to the selected date field
        Then the value of the selected date field is the last day of the month
        And the user takes a screenshot

        #Date field: entering & verifying value - n months after today with n=2
        Given the user selects the date field with name: "Accounting date"
        When the user writes a generated date in the selected date field using the value "M+2"
        Then the value of the selected date field is a generated date using value "M+2"
        And the user takes a screenshot

        #Date field: entering & verifying value - First day of the current year
        Given the user selects the date field with name: "Accounting date"
        When the user writes first day of the year to the selected date field
        Then the value of the selected date field is the first day of the year
        And the user takes a screenshot

        #Date field: entering & verifying value - Last day of the current year
        Given the user selects the date field with name: "Accounting date"
        When the user writes last day of the year to the selected date field
        Then the value of the selected date field is the last day of the year
        And the user takes a screenshot

        #Date field: entering & verifying value - n years after today with n=2
        Given the user selects the date field with name: "Accounting date"
        When the user writes a generated date in the selected date field using the value "Y+2"
        Then the value of the selected date field is a generated date using value "Y+2"
        And the user takes a screenshot

        #Date field: entering & verifying value - n years before today with n=2
        Given the user selects the date field with name: "Accounting date"
        When the user writes a generated date in the selected date field using the value "Y-2"
        Then the value of the selected date field is a generated date using value "Y-2"
        And the user takes a screenshot

        #Date field: entering & verifying value - First Day of the next month
        Given the user selects the date field with name: "Accounting date"
        When the user writes first day of month to the selected date field and adjusts it by "M+1"
        Then the value of the selected date field is first day of the month adjusted by "M+1"
        And the user takes a screenshot

        #Date field: entering & verifying value - Last Day of the next month
        Given the user selects the date field with name: "Accounting date"
        When the user writes last day of month to the selected date field and adjusts it by "M+1"
        Then the value of the selected date field is last day of the month adjusted by "M+1"
        And the user takes a screenshot

        #Date field: entering & verifying value - Last Day of a specific month
        Given the user selects the date field with name: "Accounting date"
        Then the user writes last day of "June" to the selected date field
        And the user takes a screenshot

        #Date field: entering & verifying value - First Day of the next year
        Given the user selects the date field with name: "Accounting date"
        When the user writes first day of the year to the selected date field and adjusts it by "Y+1"
        Then the value of the selected date field is first day of the year adjusted by "Y+1"
        And the user takes a screenshot

        #Date field: entering & verifying value - Last Day of the previous year
        Given the user selects the date field with name: "Accounting date"
        When the user writes last day of the year to the selected date field and adjusts it by "Y-1"
        Then the value of the selected date field is last day of the year adjusted by "Y-1"
        And the user takes a screenshot

        #Date field: entering & verifying value - Fixed date
        Given the user selects the date field with name: "Accounting date"
        When the user writes month: "01" day: "20" and year: "2020" to the selected date field
        Then the value of the selected date field is month: "01" day: "20" and year: "2020"
        And the value of the "Accounting" date field is month: "01" date: "20" and year: "2020"
        And the user takes a screenshot

        #Date field: 1st Monday from Today
        #Value can be 1st 2nd 3rd 4th, Monday Tuesday, Wednesday until Sunday
        Given the user selects the date field with name: "Accounting date"
        When the user writes the "1st Monday" from today to the selected date field
        Then the value of the selected date field is the "1st Monday" from today
        And the user takes a screenshot

        #Date field: 3rd Tuesday + 4 days from Today
        #Value can be 1st 2nd 3rd 4th, Monday Tuesday, Wednesday until Sunday
        Given the user selects the date field with name: "Accounting date"
        When the user writes the "3rd Tuesday +4" from today to the selected date field
        Then the value of the selected date field is the "3rd Tuesday +4" from today
        And the user takes a screenshot

        #Date field: entering default date.
        Given the user selects the date field with name: "Accounting date"
        When the user writes default date to the selected date field

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C2 - Date field management - How to enter a date in a date field - Specificities for German language

        #Change to German langugage
        Given the user changes the main language code to "de-DE"

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "Neu" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "Standort"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - January the 31th of the current year
        Given the user selects the date field with name: "Buchungsdatum"
        When the user writes a generated date in the selected date field using the value "31.01.Y"
        Then the value of the selected date field is a generated date using value "31.01.Y"
        And the user takes a screenshot

        #Date field: entering & verifying value - current day, current month of previous year
        Given the user selects the date field with name: "Buchungsdatum"
        When the user writes a generated date in the selected date field using the value "T.M.(Y-1)"
        Then the value of the selected date field is a generated date using value "T.M.(Y-1)"
        And the user takes a screenshot

        #Date field: selection by X3 field name (ScreenCode_FieldName) then entering and verifying the value
        Given the user selects the date field with X3 field name: "BIC0_ACCDAT"
        When the user writes "31.01.20" to the selected date field
        Then the value of the selected date field is "31.01.20"
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "Abbrechen" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C3 - Date field management - How to enter a date in a date field - Specificities for British language

        #Change to Bristish langugage
        Given the user changes the main language code to "en-GB"

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - January the 31th of the current year
        Given the user selects the date field with name: "Accounting Date"
        When the user writes a generated date in the selected date field using the value "31/01/Y"
        Then the value of the selected date field is a generated date using value "31/01/Y"
        And the user takes a screenshot

        #Date field: entering & verifying value - current day, current month of previous year
        Given the user selects the date field with name: "Accounting Date"
        When the user writes a generated date in the selected date field using the value "T/M/(Y-1)"
        Then the value of the selected date field is a generated date using value "T/M/(Y-1)"
        And the user takes a screenshot

        #Date field: selection by X3 field name (ScreenCode_FieldName) then entering and verifying the value
        Given the user selects the date field with X3 field name: "BIC0_ACCDAT"
        When the user writes "31/01/20" to the selected date field
        Then the value of the selected date field is "31/01/20"
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C4 - Date field management - How to enter a date in a date field - Specificities for United States language

        #Change to American English langugage
        Given the user changes the main language code to "en-US"

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - January the 31th of the current year
        Given the user selects the date field with name: "Accounting date"
        When the user writes a generated date in the selected date field using the value "01/31/Y"
        Then the value of the selected date field is a generated date using value "01/31/Y"
        And the user takes a screenshot

        #Date field: entering & verifying value - current day, current month of previous year
        Given the user selects the date field with name: "Accounting date"
        When the user writes a generated date in the selected date field using the value "M/T/(Y-1)"
        Then the value of the selected date field is a generated date using value "M/T/(Y-1)"
        And the user takes a screenshot

        #Date field: selection by X3 field name (ScreenCode_FieldName) then entering and verifying the value
        Given the user selects the date field with X3 field name: "BIC0_ACCDAT"
        When the user writes "01/31/20" to the selected date field
        Then the value of the selected date field is "01/31/20"
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C5 - Date field management - How to enter a date in a date field - Specificities for Spanish language

        #Change to American Spanish langugage
        Given the user changes the main language code to "es-ES"

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "Nuevo" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "Planta"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - January the 31th of the current year
        Given the user selects the date field with name: "Fecha contable"
        When the user writes a generated date in the selected date field using the value "31/01/Y"
        Then the value of the selected date field is a generated date using value "31/01/Y"
        And the user takes a screenshot

        #Date field: entering & verifying value - current day, current month of previous year
        Given the user selects the date field with name: "Fecha contable"
        When the user writes a generated date in the selected date field using the value "T/M/(Y-1)"
        Then the value of the selected date field is a generated date using value "T/M/(Y-1)"
        And the user takes a screenshot

        #Date field: selection by X3 field name (ScreenCode_FieldName) then entering and verifying the value
        Given the user selects the date field with X3 field name: "BIC0_ACCDAT"
        When the user writes "31/01/20" to the selected date field
        Then the value of the selected date field is "31/01/20"
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "Cancelar" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C6 - Date field management - How to enter a date in a date field - Specificities for French language

        #Change to American French langugage
        Given the user changes the main language code to "fr-FR"

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "Nouveau" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - January the 31th of the current year
        Given the user selects the date field with name: "Date comptable"
        When the user writes a generated date in the selected date field using the value "31/01/Y"
        Then the value of the selected date field is a generated date using value "31/01/Y"
        And the user takes a screenshot

        #Date field: entering & verifying value - current day, current month of previous year
        Given the user selects the date field with name: "Date comptable"
        When the user writes a generated date in the selected date field using the value "T/M/(Y-1)"
        Then the value of the selected date field is a generated date using value "T/M/(Y-1)"
        And the user takes a screenshot

        #Date field: selection by X3 field name (ScreenCode_FieldName) then entering and verifying the value
        Given the user selects the date field with X3 field name: "BIC0_ACCDAT"
        When the user writes "31/01/20" to the selected date field
        Then the value of the selected date field is "31/01/20"
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "Abandon" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C7 - Date field management - How to enter a date in a date field - Specificities for Italian language

        #Change to American Italian langugage
        Given the user changes the main language code to "it-IT"

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "Nuovo" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "Sito"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - January the 31th of the current year
        Given the user selects the date field with name: "Data contabile"
        When the user writes a generated date in the selected date field using the value "31/01/Y"
        Then the value of the selected date field is a generated date using value "31/01/Y"
        And the user takes a screenshot

        #Date field: entering & verifying value - current day, current month of previous year
        Given the user selects the date field with name: "Data contabile"
        When the user writes a generated date in the selected date field using the value "T/M/(Y-1)"
        Then the value of the selected date field is a generated date using value "T/M/(Y-1)"
        And the user takes a screenshot

        #Date field: selection by X3 field name (ScreenCode_FieldName) then entering and verifying the value
        Given the user selects the date field with X3 field name: "BIC0_ACCDAT"
        When the user writes "31/01/20" to the selected date field
        Then the value of the selected date field is "31/01/20"
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "Annulla" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C8 - Date field management - How to enter a date in a date field - Specificities for Polish language

        #Change to American Polish langugage
        Given the user changes the main language code to "pl-PL"

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "Nowy" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "Lokalizacja"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - January the 31th of the current year
        Given the user selects the date field with name: "Data księgi"
        When the user writes a generated date in the selected date field using the value "(Y)-01-31"
        Then the value of the selected date field is a generated date using value "(Y)-01-31"
        And the user takes a screenshot

        #Date field: entering & verifying value - current day, current month of previous year
        Given the user selects the date field with name: "Data księgi"
        When the user writes a generated date in the selected date field using the value "(Y-1)-(M)-(T)"
        Then the value of the selected date field is a generated date using value "(Y-1)-(M)-(T)"
        And the user takes a screenshot

        #Date field: selection by X3 field name (ScreenCode_FieldName) then entering and verifying the value
        Given the user selects the date field with X3 field name: "BIC0_ACCDAT"
        When the user writes "20-01-31" to the selected date field
        Then the value of the selected date field is "20-01-31"
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "Anuluj" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C9 - Date field management - How to enter a date in a date field - Specificities for Portuguese language

        #Change to American Portuguese langugage
        Given the user changes the main language code to "pt-PT"

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "Nova" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "Estab"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - January the 31th of the current year
        Given the user selects the date field with name: "Data contab."
        When the user writes a generated date in the selected date field using the value "31-01-(Y)"
        Then the value of the selected date field is a generated date using value "31-01-(Y)"
        And the user takes a screenshot

        #Date field: entering & verifying value - current day, current month of previous year
        Given the user selects the date field with name: "Data contab."
        When the user writes a generated date in the selected date field using the value "(T)-(M)-(Y-1)"
        Then the value of the selected date field is a generated date using value "(T)-(M)-(Y-1)"
        And the user takes a screenshot

        #Date field: selection by X3 field name (ScreenCode_FieldName) then entering and verifying the value
        Given the user selects the date field with X3 field name: "BIC0_ACCDAT"
        When the user writes "31-01-20" to the selected date field
        Then the value of the selected date field is "31-01-20"
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "Abandonar" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C10 - Date field management - How to enter a date in a date field - Specificities for Chinese language

        #Change to American Chinese langugage
        Given the user changes the main language code to "zh-CN"

        #Open function by code
        Given the user opens the "GESBIC" function

        #Entering in creation mode
        When the user clicks the "新建" main action button on the right panel

        #Text field: selection by name & entering value
        Then the user selects the text field with name: "地点"
        And the user writes "ATP21" to the selected text field

        #Date field: entering & verifying value - January the 31th of the current year
        Given the user selects the date field with name: "记账日期"
        When the user writes a generated date in the selected date field using the value "Y/01/31"
        Then the value of the selected date field is a generated date using value "Y/01/31"
        And the user takes a screenshot

        #Date field: entering & verifying value - current day, current month of previous year
        Given the user selects the date field with name: "记账日期"
        When the user writes a generated date in the selected date field using the value "(Y-1)/M/T"
        Then the value of the selected date field is a generated date using value "(Y-1)/M/T"
        And the user takes a screenshot

        #Date field: selection by X3 field name (ScreenCode_FieldName) then entering and verifying the value
        Given the user selects the date field with X3 field name: "BIC0_ACCDAT"
        When the user writes "31/01/21" to the selected date field
        Then the value of the selected date field is "31/01/21"
        And the user takes a screenshot

        #Cancel the creation
        And the user clicks the "取消" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303C11 - Logout scenario
        And the user logs-out from the system