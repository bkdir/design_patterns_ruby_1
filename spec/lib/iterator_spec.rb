require 'spec_helper'
require 'helper'

require 'iterator.rb'

describe Family do
  include Helper
  it "prints every member of the family" do
    family = Family.new "Jackson"

    family.add_father "John"
    family.add_mother "Jane"

    3.times { |i| family.add_child "Child #{i}", "F" }

    expected_result = <<EOF
John Jackson
Jane Jackson
Child 0 Jackson
Child 1 Jackson
Child 2 Jackson
EOF
    output = capture { family.each_member { |member| puts family.full_name(member) } }
    expect(output).to eq expected_result
  end
end
