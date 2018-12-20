RSpec.describe "`rnba game` command", type: :cli do
  it "executes `rnba help game` command successfully" do
    output = `rnba help game`
    expected_output = <<-OUT
Usage:
  rnba game [TEAM]

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
