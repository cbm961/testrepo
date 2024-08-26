###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0402B-gql-query-read-customer
# - Description:  GraphQL Query
#                 - read customer
# - Created date:  06/02/2024
# - Updated dates: 04/03/2024
###########################################################################

@GraphQL_Test
Feature: 0402B-gql-query-read-customer

    Scenario: Login scenario and connect
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected
        And the user opens the application on a desktop using the following link: "/xtrem/explorer/"

    Scenario: Load query request: Read customer NA001
        When the user writes "./0402B-gql- query-read-customer-request.graphql" GraphQL request
        And the user clicks the "Run" button in the GraphQL page header

    Scenario: Validate GraphQL response
        Then the "./0402B-gql- query-read-customer-response.json" GraphQL response is valid

    Scenario: Get and Control GraphQL response Property
        When the user selects the "data.x3MasterData.customer.query.edges[1].node" GraphQL property
        Then the selected GraphQL property value is not '{"_id": "NA002", "code": {"code": "NA001"}, "companyNames": {"query": {"edges": [{"node": {"companyName": "International Distributors"}}]}},"shortCompanyName": "IntlDist", "serviceContract": null}'
        Then the selected GraphQL property value is not
            """
            {
                "_id": "NA002",
                "code": {
                    "code": "NA002"
                },
                "companyNames": {
                    "query": {
                        "edges": [
                            {
                                "node": {
                                    "companyName": "International Distributors"
                                }
                            }
                        ]
                    }
                },
                "shortCompanyName": "IntlDist",
                "serviceContract": null
            }
            """
        Then the selected GraphQL property value is '{"_id": "NA001", "code": {"code": "NA001"}, "companyNames": {"query": {"edges": [{"node": {"companyName": "International Distributors"}}]}}, "shortCompanyName": "IntlDist","serviceContract": null}'
        Then the selected GraphQL property value is
            """
            {
                "_id": "NA001",
                "code": {
                    "code": "NA001"
                },
                "companyNames": {
                    "query": {
                        "edges": [
                            {
                                "node": {
                                    "companyName": "International Distributors"
                                }
                            }
                        ]
                    }
                },
                "shortCompanyName": "IntlDist",
                "serviceContract": null
            }
            """
        Then the selected GraphQL property value contains
            """
            "_id": "NA001"
            """

    Scenario: Get and Check GraphQL single results Property value
        When the user selects the "data.x3MasterData.customer.query.edges[1].node.companyNames.query.edges[1].node.companyName" GraphQL property
        Then the selected GraphQL property value is 'International Distributors'

        When the user selects the "data.x3MasterData.customer.query.edges[1].node._id" GraphQL property
        Then the selected GraphQL property value is 'NA001'

    Scenario: The user logs out
        When the user logs-out from the system