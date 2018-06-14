defmodule FireStarter.EventnViewTest do
  use FireStarter.ConnCase, async: true

  @tag current: true
  test "Should convert date to M/D/Y" do
    date = Ecto.DateTime.from_erl({{2016, 12, 03}, {00, 00, 00}})
    formatted = FireStarter.EventView.format_date(date)
    assert formatted == "12/3/2016"
  end
end
