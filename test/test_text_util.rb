require "helper"

module Sinew
  class TestTextUtil < TestCase
    def setup
      tidy = TextUtil.html_tidy(HTML)
    end
    
    def test_tidy
      tidy = TextUtil.html_tidy(HTML)
      # tags removed?
      assert(tidy !~ /script|meta|link/)
      # squished?
      assert(tidy !~ /  /)
      # comments removed?
      assert(tidy !~ /<!--/)      
    end

    def test_clean
      clean = TextUtil.html_clean(HTML)
      # attributes removed
      assert(clean !~ /will_be_removed/)
      # attributes preserved
      assert(clean =~ /will_be_preserved/)
    end
  end
end
