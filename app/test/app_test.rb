require File.expand_path '../test_helper.rb', __FILE__

class TestApp < MiniTest::Test
  def setup
    Resource.create(name: 'Resource #1')
  end

  def test_index
    resources = Resource.select('id', 'name')

    get '/'
    assert last_response.ok?
    assert_equal resources.to_json, last_response.body
  end

  def test_show
    resource = Resource.first

    get "/#{resource.id}"
    assert last_response.ok?
    assert_equal resource.to_json, last_response.body
  end

  def test_create
    post '/', name: 'Created Resource'

    resource = Resource.find_by_name 'Created Resource'

    refute_nil resource
    assert_equal 'Created Resource', resource.name
  end

  def test_update
    resource = Resource.first

    patch "/#{resource.id}", name: 'Updated Resource'

    assert_equal 'Updated Resource', resource.reload.name
  end

  def test_delete
    resource = Resource.first
    count = Resource.count

    delete "/#{resource.id}"

    assert_equal count - 1, Resource.count
    assert_raises ActiveRecord::RecordNotFound do
      resource.reload
    end
  end
end
