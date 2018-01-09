require 'spec_helper'

describe Pswd::HashBuilder do
  describe '#build' do
    context 'Nothing is registered' do
      it 'returns only build hash' do
        expect(Pswd::HashBuilder.build({}, 'www.amazon.com', 'username', 'password'))
          .to eq 'www.amazon.com' => { 'username' => 'password' }
      end
    end

    context 'Same key already exist' do
      context 'Pass other username' do
        it 'returns 1 domain 2 user' do
          hash = { 'www.amazon.com' => { 'username_a' => 'password' } }
          expect(Pswd::HashBuilder.build(hash, 'www.amazon.com', 'username_b', 'password'))
            .to eq(
              'www.amazon.com' => {
                'username_a' => 'password',
                'username_b' => 'password'
              }
            )
        end
      end

      context 'Pass same username' do
        it 'update password' do
          hash = { 'www.amazon.com' => { 'username' => 'password' } }
          expect(Pswd::HashBuilder.build(hash, 'www.amazon.com', 'username', 'password_updated'))
            .to eq 'www.amazon.com' => { 'username' => 'password_updated' }
        end
      end
    end
  end
end