RSpec.describe "`rnba today` command", type: :cli do
  it "executes `rnba help today` command successfully" do
    output = `rnba help today`
    expected_output = <<-OUT
Usage:
  rnba today

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
