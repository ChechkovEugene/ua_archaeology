defmodule UaArchaeology.Condition do
  use UaArchaeology.Web, :model

  schema "conditions" do
    field :name, :string
    belongs_to :user, UaArchaeology.User
    has_many :finds, UaArchaeology.Find
    
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
