# encoding: UTF-8

require 'test_helper'
require 'govspeak_test_helper'

require 'ostruct'

class ChimespeakTest < Test::Unit::TestCase
  include GovspeakTestHelper


  test "address" do
    chimespeak = '
$address

# Location

Redwood Heights Recreation Center

3883 Aliso Ave.

Oakland, CA 94619

$address
'

    given_govspeak(chimespeak) do
      assert_html_output '
<aside class="info-box event-address">
<h1 id="location">Location</h1>

<p>Redwood Heights Recreation Center</p>

<p>3883 Aliso Ave.</p>

<p>Oakland, CA 94619</p>
</aside>

'
    end
  end
end
