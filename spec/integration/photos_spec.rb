require 'swagger_helper'

describe 'Photos API' do

  path '/api/v1/photos' do

    post 'Creates a photo' do
      tags 'Photos'
      consumes 'application/json', 'application/xml'
      parameter name: :photo, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          photo_url_string: { type: :string }
        },
        required: [ 'title', 'photo_url_string' ]
      }

      response '201', 'photo created' do
        let(:photo) { { title: 'Dodo', photo_url_string: 'availabl.png' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:photo) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/photos/{id}' do

    get 'Retrieves a photo' do
      tags 'Photos'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
              title: { type: :string },
              photo_url_string: { type: :string }
          },
          required: [ 'id', 'name', 'status' ]

        let(:id) { Photo.create(title: 'foo', photo_url_string: 'http://example.com/avatar.jpg').id }
        run_test!
      end

      response '404', 'photo not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end