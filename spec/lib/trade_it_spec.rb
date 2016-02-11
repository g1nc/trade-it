require 'spec_helper'

describe TradeIt do
  it 'has a version number' do
    expect(TradeIt::VERSION).not_to be nil
  end

  it 'returns brokers' do
    expect(TradeIt.brokers[:td]).to eq('TD')
  end

  describe '#api_uri' do
    it 'returns ENV - TRADEIT_BASE_URI' do
      expect(TradeIt.api_uri).to eql ENV['TRADEIT_BASE_URI']
    end
    it 'raises error with no ENV' do
      ENV['TRADEIT_BASE_URI'] = ''
      expect{TradeIt.api_uri}.to raise_error(TradeIt::Errors::ConfigException)
    end
  end
  describe '#api_key' do
    it 'returns ENV - TRADEIT_API_KEY' do
      expect(TradeIt.api_key).to eql ENV['TRADEIT_API_KEY']
    end
    it 'raises error with no ENV' do
      ENV['TRADEIT_API_KEY'] = ''
      expect{TradeIt.api_uri}.to raise_error(TradeIt::Errors::ConfigException)
    end
  end
end