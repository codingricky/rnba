RSpec.describe "`rnba tomorrow` command", type: :cli do
  it "executes `rnba help tomorrow` command successfully" do
    output = `rnba help tomorrow`
    expected_output = <<-OUT
Usage:
  rnba tomorrow

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
