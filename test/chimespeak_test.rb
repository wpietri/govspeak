# encoding: UTF-8

require 'test_helper'
require 'govspeak_test_helper'

require 'ostruct'

class ChimespeakTest < Test::Unit::TestCase
  include GovspeakTestHelper


  test "poster" do
    given_govspeak('
      $poster
      ![Alt Text](path/to/img)
      $poster
') do
      assert_html_output '
      <aside class="info-box event-poster">
      <img src="path/to/img" alt="Alt Text" />
      </aside>
'
    end
  end
  test "date" do
    given_govspeak('
      $date

      # Date and Time

      August 20th, 2015 at 8:00PM

      $date
') do
      assert_html_output '

      <aside class="info-box event-date">
      <h1 id="date-and-time">Date and Time</h1>

      <p>August 20th, 2015 at 8:00PM</p>
      </aside>
'
    end
  end

  test "address" do
    given_govspeak('
      $address

      # Location

      Redwood Heights Recreation Center

      3883 Aliso Ave.

      Oakland, CA 94619

      $address
') do
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
  test "contact" do
    given_govspeak('
      $contact

      # Contact

      **Phone Number:** (510) 482-7827

      **Website:** [Oakland Parks](http://oaklandnet.com/parks)

      $contact
') do
      assert_html_output '
      <aside class="info-box event-contact">
      <h1 id="contact">Contact</h1>

      <p><strong>Phone Number:</strong> (510) 482-7827</p>

      <p><strong>Website:</strong> <a href="http://oaklandnet.com/parks">Oakland Parks</a></p>
      </aside>
'
    end
  end

  test "registration" do
    given_govspeak('
      $registration

      # Registration

      We will begin accepting [registrations online](http://www2.oaklandnet.com/Government/o/opr/Connect/activities/index.htm), in person or via mail, beginning February 24, 2015.  Please note that to register online, you must pay in full (does not include excursion fee)

      $registration
') do
      assert_html_output '
      <aside class="info-box event-registration">
      <h1 id="registration">Registration</h1>

      <p>We will begin accepting <a href="http://www2.oaklandnet.com/Government/o/opr/Connect/activities/index.htm">registrations online</a>, in person or via mail, beginning February 24, 2015.  Please note that to register online, you must pay in full (does not include excursion fee)</p>
      </aside>
'
    end
  end
  test "callout" do
    given_govspeak('
      $callout

      any markdown content

      $callout
') do
      assert_html_output '
        <section class="event-callout">
        <p>any markdown content</p>
        </section>
'
    end
  end
end
