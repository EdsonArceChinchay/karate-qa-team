Feature: Casos de prueba del modulo store

  Scenario: CP01 - Obtener inventario mascotas
    Given url "https://petstore.swagger.io/v2"
    And path "/store/inventory"
    When method get
    Then status 200

  Scenario: CP02 - Crear una orden
    Given url "https://petstore.swagger.io/v2"
    And path "/store/order"
    And request
    """
    {
      "id": 0,
      "petId": 0,
      "quantity": 0,
      "shipDate": "2026-05-04T16:49:15.367Z",
      "status": "placed",
      "complete": true
    }
    """
    When method post
    Then status 200
    And match response contains {"id":9223372036854775617}
    