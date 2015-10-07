require 'rails_helper'

RSpec.describe PhotoService, type: :service do
  subject(:service) { PhotoService.new }

  describe '.default_builder' do
    subject(:builder) { PhotoService.default_builder }
    it { is_expected.to be_a F00px::Api::Photos::Builder }

    it 'has a result size of 100' do
      expect(builder.build).to include(rpp: 100)
    end
  end

  describe '#run!' do
    subject { service.run! }

    it 'returns an array of Photos' do
      is_expected.to all(be_a Photo)
    end
  end
end
