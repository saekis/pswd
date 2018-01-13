require 'spec_helper'

describe Pswd::Domain do
  describe '#extract' do
    context 'Url with protocol' do
      it 'returns only domain' do
        expect(Pswd::Domain.extract('https://www.amazon.com/ap/signin'))
          .to eq 'www.amazon.com'
      end
    end

    context 'Url without protocol' do
      it 'returns only domain' do
        expect(Pswd::Domain.extract('www.amazon.com/ap/signin'))
          .to eq 'www.amazon.com'
      end
    end

    context 'Only domain' do
      it 'returns same value' do
        expect(Pswd::Domain.extract('www.amazon.com')).to eq 'www.amazon.com'
      end
    end

    context 'Ip' do
      it 'returns same value' do
        expect(Pswd::Domain.extract('123.456.78')).to eq '123.456.78'
      end
    end

    context 'localhost' do
      it 'returns same value' do
        expect(Pswd::Domain.extract('localhost')).to eq 'localhost'
      end
    end
  end
end