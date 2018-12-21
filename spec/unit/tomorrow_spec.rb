require 'rnba/commands/tomorrow'

RSpec.describe Rnba::Commands::Tomorrow do
  it "executes `tomorrow` command successfully" do
    output = StringIO.new
    options = {}
    command = Rnba::Commands::Tomorrow.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
