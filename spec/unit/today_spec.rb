require 'rnba/commands/today'

RSpec.describe Rnba::Commands::Today do
  it "executes `today` command successfully" do
    output = StringIO.new
    options = {}
    command = Rnba::Commands::Today.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
