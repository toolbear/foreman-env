require "foreman-env"

describe ForemanEnv do

  describe "VERSION" do
    subject { ForemanEnv::VERSION }
    it { should be_a String }
  end
end
