RSpec.describe YandexTranslate do
  let(:client) { YandexTranslate::Client.new(key: '') }

  describe '#get_langs' do
    it 'returns correct results' do
      VCR.use_cassette("get_langs") do
        result = client.get_langs ui: 'ru'
        expect(result['langs']['af']).to eq 'Африкаанс'
      end
    end
  end

  describe '#detect' do
    it 'returns correct resutls' do
      VCR.use_cassette("detect") do
        result = client.detect text: 'россия', hint: 'ru'
        expect(result['lang']).to eq 'ru'
      end
    end
  end

  describe '#translate' do
    it 'returns correct resutls' do
      VCR.use_cassette("translate") do
        result = client.translate text: 'россия', lang: 'af'
        expect(result['text'][0]).to eq 'Rusland'
      end
    end
  end
end
