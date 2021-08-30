RSpec.describe Paramore::PermittedParameterArgument, '.parse' do
  subject { described_class.parse(types_definition) }

  let(:types_definition) do
    {
      id: Paramore.field(Types::Int),
      name: Paramore.field(Types::Text),
      metadata: Paramore.field({
        email: Paramore.field(Types::Text),
        tags: Paramore.field([Types::Int]),
        deeper: Paramore.field({
          depth: Paramore.field(Types::Int),
        }),
      }),
      extra: Paramore.field({
        parameter: Paramore.field(Types::Int),
      }),
    }
  end

  it "returns an array that rails' .permit expects" do
    expect(subject).to eq(
      [:id, :name, metadata: [:email, tags: [], deeper: [:depth]], extra: [:parameter]]
    )
  end
end
