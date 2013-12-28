Feature: Plugins Management As an admin,
  I want to manage plugins,
  So that I can decide whether it's enable or not.

  Background:
    Given the following plugin exist:
      |name     |description            |enable |id     |link                           |
      |carousel |carousel               |false   |1     |/admin/plugins/carousel        |

  Scenario: Can not see plugin carousel when disable
    When I am on the visitor index page
    Then I should not see plugin "carousel"

#  @javascript
#  Scenario: plugin carousel can be seen after enable
#    When I have already logged in
#    And I am on the plugins manage page
#    Then I should see plugin "carousel" with status "Disable"
#    When I follow plugin "carousel" status "Disable"
#    Then I should see plugin "carousel" with status "Enable"
#    When I am on the visitor index page
