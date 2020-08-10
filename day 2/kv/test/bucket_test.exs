defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "Stores value by a key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "Milk") == nil

    KV.Bucket.put(bucket, "Milk", 3)
    assert KV.Bucket.get(bucket, "Milk") == 3
  end
end
