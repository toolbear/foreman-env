require "spec_helper"
require "foreman/env"

describe Foreman::Env, :fakefs do

  describe "#initialize" do
    context "with non-existent file" do
      it { expect { Foreman::Env.new("I'm not here") }.to raise_error(Errno::ENOENT) }
    end
  end

  describe "#entries" do
    subject do
      h = {}
      Foreman::Env.new(filename).entries do |k, v|
        h[k] = v
      end
      h
    end

    let(:filename) { '/tmp/env' }

    context "with empty file" do
      before do
        File.open(filename, "w") do |f|
          f.puts ''
        end
      end

      it { should be_empty }
    end

    context "with one pair" do
      before do
        File.open(filename, "w") do |f|
          f.puts 'FOO=bar'
        end
      end

      it { should_not be_empty }
      it { should include('FOO' => 'bar') }
    end

    context "with two pairs" do
      before do
        File.open(filename, "w") do |f|
          f.puts 'FOO=bar'
          f.puts 'BAZ=qux'
        end
      end

      it { should include('FOO' => 'bar', 'BAZ' => 'qux') }
    end

    context "with quoted values" do
      before do
        File.open("/tmp/env", "w") do |f|
          f.puts 'BAZ="qux"'
          f.puts "FRED='barney'"
          f.puts 'OTHER="escaped\"quote"'
        end
      end

      it { should include('BAZ' => 'qux', 'FRED' => 'barney', 'OTHER' => 'escaped"quote') }
    end

    context "with 'export' keyword" do
      before do
        File.open("/tmp/env", "w") do |f|
          f.puts 'export FOO=bar'
        end
      end

      it { should include('FOO' => 'bar') }
    end
  end
end
