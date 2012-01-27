require File.expand_path('../helper',__FILE__)

class TestRackGauges < Test::Unit::TestCase
  def self.should_show_tracker
    should "show tracker" do
      assert_match %r{_gauges},             last_response.body
      assert_match %r{</script>\s*</body>}, last_response.body
      assert_match %r{content},             last_response.body
    end
  end

  def self.should_not_show_tracker
    should "not show tracker" do
      assert_no_match %r{_gauges},  last_response.body
      assert_no_match %r{<script>}, last_response.body
      assert_match    %r{content},  last_response.body
    end
  end

  context "Given an app with the tracker installed" do
    setup { mock_app :tracker => 'somebody' }

    context "a page returning a body" do
      setup { get "/body" }
      should_show_tracker
    end

    context "a page returning a head but no body" do
      setup { get "/head" }
      should_not_show_tracker
    end

    context "a page returning XML" do
      setup { get "/xml" }
      should_not_show_tracker
    end

    context "a page returning 404" do
      setup { get "/no_such_path" }
      should_not_show_tracker
    end
  end
end
