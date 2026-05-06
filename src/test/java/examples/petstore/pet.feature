Feature: Casos de prueba del modulo Pet

  Scenario: CP01 - Obtener mascota
    * def petId = 2
    Given url "https://petstore.swagger.io/v2"
    And path "/pet/" + petId
    When method get
    Then status 200

  Scenario: CP02 - Crear mascota
    Given url "https://petstore.swagger.io/v2"
    And path "/pet"
    And request
    """
    {
      "id": 2,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "doggie",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    When method post
    Then status 200


  Scenario: CP03 - Actualizar Mascota
    Given url "https://petstore.swagger.io/v2"
    And path "/pet"
    And request
    """
    {
      "id": 2,
      "category": {
        "id": 3,
        "name": "string"
      },
      "name": "doggie",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 3,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    When method put
    Then status 200

  Scenario: CP05 - Eliminar mascota
    * def petId = 2
    * def apiKey = ""
    Given url "https://petstore.swagger.io/v2"
    And path "/pet/" + petId
    And header x-api-key = apiKey
    When method delete
    Then status 200


