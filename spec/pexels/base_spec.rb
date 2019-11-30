# frozen_string_literal: true

describe PexelsApiClient::Base do
  describe 'rescue_errors' do
    describe 'when bad request' do
      it 'should raise error' do
        base = PexelsApiClient::Base.new
        expect do
          base.rescue_errors('blah', FakeResponse.new(400))
        end.to raise_error(PexelsApiClient::BadRequestError)
      end
    end

    describe 'when server error' do
      it 'should raise error' do
        base = PexelsApiClient::Base.new
        expect do
          base.rescue_errors('blah', FakeResponse.new(500))
        end.to raise_error(PexelsApiClient::ServerError)
      end
    end
  end
end

class FakeResponse
  attr_reader :status,
              :body

  def initialize(status)
    @status = status
    @body = '{"body": "some response"}'
  end
end
