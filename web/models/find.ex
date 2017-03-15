defmodule UaArchaeology.Find do
  use UaArchaeology.Web, :model

  schema "finds" do
    field :title, :string
    field :another_name, :string
    field :idn, :string
    field :topo, :string
    field :storage_place, :string
    field :archival_storage, :string
    belongs_to :user, UaArchaeology.User
    many_to_many :conditions, UaArchaeology.Condition,
      join_through: UaArchaeology.FindCondition,
      join_keys: [find_id: :id, parameter_id: :id], on_delete: :delete_all
    many_to_many :research_levels, UaArchaeology.ResearchLevel,
      join_through: UaArchaeology.FindResearchLevel,
      join_keys: [find_id: :id, parameter_id: :id], on_delete: :delete_all
    many_to_many :object_types, UaArchaeology.ObjectType,
        join_through: UaArchaeology.FindObjectType,
        join_keys: [find_id: :id, parameter_id: :id], on_delete: :delete_all
    many_to_many :site_types, UaArchaeology.SiteType,
        join_through: UaArchaeology.FindSiteType,
        join_keys: [find_id: :id, parameter_id: :id], on_delete: :delete_all
    many_to_many :cultures, UaArchaeology.Culture,
        join_through: UaArchaeology.FindCulture,
        join_keys: [find_id: :id, parameter_id: :id], on_delete: :delete_all
    field :description, :string
    many_to_many :authors, UaArchaeology.Author,
        join_through: UaArchaeology.FindAuthor,
        join_keys: [find_id: :id, parameter_id: :id], on_delete: :delete_all
    many_to_many :publications, UaArchaeology.Publication,
        join_through: UaArchaeology.FindPublication,
        join_keys: [find_id: :id, parameter_id: :id], on_delete: :delete_all
    field :register, :string
    field :passport, :string
    # field :coords1, Geo.Point
    # field :coords2, Geo.Point
    # field :coords3, Geo.Point
    # field :coords4, Geo.Point
    field :coord1N, :string
    field :coord2N, :string
    field :coord3N, :string
    field :coord4N, :string
    field :coord1E, :string
    field :coord2E, :string
    field :coord3E, :string
    field :coord4E, :string
    field :area,  :decimal
    field :layer_thickness, :decimal
    field :width, :decimal
    field :height, :decimal
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :idn, :topo, :area,
      :coord1N, :coord2N, :coord3N, :coord4N,
      :coord1E, :coord2E, :coord3E, :coord4E])
    |> validate_required([:title, :idn, :topo, :area])
  end
end
