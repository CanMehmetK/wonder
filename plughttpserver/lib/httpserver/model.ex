defmodule Httpserver.SubmitBetPriceChange do
  @moduledoc ""

  require Decimal

  @type t :: %__MODULE__{
          eventDetailBetTypeMapID: integer(),
          eventDetailBetTypeMapPrice: Decimal.t(),
          feractionalOdd: binary(),
          guid: nil | Ecto.UUID
        }

  defstruct [
    :eventDetailBetTypeMapID,
    :eventDetailBetTypeMapPrice,
    :feractionalOdd,
    :guid
  ]

  @spec decode!(map()) :: t()
  def decode!(%{
        "eventDetailBetTypeMapID" => event_detail_bet_type_map_id,
        "eventDetailBetTypeMapPrice" => event_detail_bet_type_map_price,
        "feractionalOdd" => feractional_odd,
        "guid" => guid
      })
      when is_integer(event_detail_bet_type_map_id) and
             Decimal.is_decimal(event_detail_bet_type_map_price) do
    %__MODULE__{
      eventDetailBetTypeMapID: event_detail_bet_type_map_id,
      eventDetailBetTypeMapPrice: event_detail_bet_type_map_price,
      feractionalOdd: feractional_odd,
      guid: guid
    }
  end
end

defmodule Httpserver.CommandResponseError do
  @moduledoc ""

  @type t :: %__MODULE__{
          errorCode: integer(),
          errorDetail: binary(),
          eventDetailBetTypeMapID: nil | integer(),
          guid: Ecto.UUID
        }

  defstruct [
    :errorCode,
    :errorDetail,
    :eventDetailBetTypeMapID,
    :guid
  ]

  @spec decode!(map()) :: t()
  def decode!(%{
        "errorCode" => error_code,
        "errorDetail" => error_detail,
        "eventDetailBetTypeMapID" => event_detail_bet_type_map_id,
        "guid" => guid
      })
      when is_integer(event_detail_bet_type_map_id) do
    %__MODULE__{
      errorCode: error_code,
      errorDetail: error_detail,
      eventDetailBetTypeMapID: event_detail_bet_type_map_id,
      guid: guid
    }
  end
end

defmodule Httpserver.SubmitBetResponse do
  @moduledoc ""
  alias Httpserver.CommandResponseError
  alias Httpserver.SubmitBetPriceChange

  @type t :: %__MODULE__{
          errors: [CommandResponseError.t()],
          priceChanges: [SubmitBetPriceChange.t()],
          bets: [SubmitBetBetList.t()]
        }

  defstruct [
    # %CommandResponseError{}
    :errors,
    # %SubmitBetPriceChange {}
    :priceChanges,
    # %SubmitBetBetList {}
    :bets
  ]

  @spec decode!(map()) :: t()
  def decode!() do
    #
    %__MODULE__{
      erros: Enum.map(:errors, &CommandResponseError.decode!/1)
      priceChanges: Enum.map(:priceChanges, &SubmitBetPriceChange.decode!/1)
      bets: Enum.map(:bets, &SubmitBetPriceChange.decode!/1)
    }
  end
end

defmodule Httpserver.SubmitBetCommandResponse do
  @moduledoc ""

  @type t :: %__MODULE__{
responseType: binary(),
responseMessage: binary(),
responseObject: %SubmitBetResponse
  }

  defstruct [
    :response_type,
    :response_message,
    # %SubmitBetResponse {}
    :response_object
  ]
end

defmodule Httpserver.SubmitBetBetList do
  @moduledoc ""
  defstruct [
    :bet_guid,
    :bet_id,
    :ticket_number,
    :bet_date_Time,
    :selections,
    :guid
  ]
end
