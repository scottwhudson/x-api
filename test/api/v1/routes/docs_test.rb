require './test/v1_helper'
require './test/vcr_helper'

class V1RoutesDocsTest < Minitest::Test
  include Rack::Test::Methods

  def app
    V1::App
  end

  def test_no_error_on_missing_documentation
    get '/docs/animal'

    assert_equal 200, last_response.status
    options = { format: :json, name: 'get_docs_for_docless_language' }
    Approvals.verify(last_response.body, options)
  end

  def test_get_docs_for_language
    get '/docs/fake'
    options = { format: :json, name: 'get_docs_for_language' }
    Approvals.verify(last_response.body, options)
  end
end
