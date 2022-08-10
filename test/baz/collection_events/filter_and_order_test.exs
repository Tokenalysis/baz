defmodule Baz.CollectionEvents.FilterAndOrderTest do
  use Baz.TestSupport.DataCase, async: false

  test ".filter_and_order/1 can filter by attributes" do
    {:ok, open_sea_azuki_1} =
      create_collection_event(%{
        venue: "open_sea",
        slug: "azuki",
        token_id: 1,
        event_type: "item_listed",
        event_timestamp: DateTime.utc_now()
      })

    {:ok, x2y2_azuki_1} =
      create_collection_event(%{
        venue: "x2y2",
        slug: "azuki",
        token_id: 1,
        event_type: "item_listed",
        event_timestamp: DateTime.utc_now()
      })

    {:ok, open_sea_doodles_1} =
      create_collection_event(%{
        venue: "open_sea",
        slug: "doodles-official",
        token_id: 1,
        event_type: "item_listed",
        event_timestamp: DateTime.utc_now()
      })

    open_sea_events = Baz.CollectionEvents.filter_and_order(where: [venue: "open_sea"])
    assert length(open_sea_events) == 2
    assert Enum.member?(open_sea_events, open_sea_azuki_1) == true
    assert Enum.member?(open_sea_events, open_sea_doodles_1) == true

    x2y2_events = Baz.CollectionEvents.filter_and_order(where: [venue: "x2y2"])
    assert length(x2y2_events) == 1
    assert Enum.member?(x2y2_events, x2y2_azuki_1) == true

    open_sea_azukis =
      Baz.CollectionEvents.filter_and_order(where: [venue: "open_sea", slug: "azuki"])

    assert length(open_sea_azukis) == 1
    assert Enum.member?(open_sea_azukis, open_sea_azuki_1) == true
  end
end
