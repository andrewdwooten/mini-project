require 'rails_helper'

describe Robot, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a name' do
        robot = Robot.new(location: 'test', serial_no: 'test')
        expect(robot).to be_invalid
      end

      it 'is invalid without a location' do
        robot = Robot.new(name: 'frank', serial_no: 'test')
        expect(robot).to be_invalid
      end

      it 'is invalid wihtout a serial_no' do
        robot = Robot.new(name: 'frank', location: 'test')
        expect(robot).to be_invalid
      end

      it 'has a unique name' do
        Robot.create(name: 'frank', location: 'test', serial_no: 'test')
        robot = Robot.new(name: 'frank', location: 'home', serial_no: '123')
        expect(robot).to be_invalid
      end

      it 'has a unique serial_no' do
        Robot.create(name: 'frank', location: 'test', serial_no: 'test')
        robot = Robot.new(name: 'test', location: 'home', serial_no: 'test')
        expect(robot).to be_invalid
      end
    end
  end
end
