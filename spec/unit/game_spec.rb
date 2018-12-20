require 'rnba/commands/game'

RSpec.describe Rnba::Commands::Game do
  it "executes `game` command successfully" do
    output = StringIO.new
    team = nil
    options = {}
    command = Rnba::Commands::Game.new(team, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
