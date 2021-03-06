defmodule CrudMeals.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :date_time, :calories]

  @derive {Jason.Encoder, only: [:id, :description, :date_time, :calories]}

  schema "meals" do
    field :description, :string
    field :date_time, :naive_datetime
    field :calories, :integer

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:date_time])
  end
end
