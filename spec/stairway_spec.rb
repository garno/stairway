require File.join(File.dirname(__FILE__), 'spec_helper.rb')

class Klass; end

describe Stairway do
  subject { Stairway }
  let(:stairs) { Stairway::Stairs.new(:stairs) }
  let(:klass) { Klass.new }

  describe '#register' do
    context 'register a valid Stairs class' do
      it 'should return true' do
        Stairway.register(stairs).should be_true
      end
    end

    context 'register an unvalid Stairs class' do
      it 'should raise an UnvalidStairsObject error' do
        expect { Stairway.register(klass) }.to raise_error(Stairway::InvalidStairsObject)
      end
    end
  end

  describe '#mount' do
    context 'mount registered stairs' do
      before { Stairway.register(stairs) }

      it 'should return an intanciated Stairs class' do
        Stairway.mount(:stairs).class.should eq(Stairway::Stairs)
      end
    end

    context 'mount unregistered stairs' do
      it 'should raise a UnregisteredStairs exception' do
        expect { Stairway.mount(:ladder) }.to raise_error(Stairway::UnregisteredStairs)
      end
    end
  end

  describe '#stop' do
    it 'should raise a Stop exception' do
      expect { Stairway.stop }.to raise_error(Stairway::Stop)
    end
  end
end
