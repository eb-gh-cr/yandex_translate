RSpec.describe YandexTranslate do
  # use this code for manual testing during developing and debugging
  xit 'does right thing' do
    client = YandexTranslate::Client.new(key: '')
    binding.pry
    langs = client.get_langs ui: 'ru'
    lang = langs['langs'].keys[0]
    binding.pry
    client.detect text: 'россия', hint: 'ru'
    client.translate text: 'россия', lang: 'af'
  end
end
