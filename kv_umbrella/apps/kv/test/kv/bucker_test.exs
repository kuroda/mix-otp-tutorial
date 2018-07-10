defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    Registry.start_link(keys: :unique, name: KV.Registry)
    name = {:via, Registry, {KV.Registry, "shopping"}}
    {:ok, bucket} = KV.Bucket.start_link([{:name, name}])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "delete values by key", %{bucket: bucket} do
    KV.Bucket.put(bucket, "milk", 3)

    KV.Bucket.delete(bucket, "milk")
    assert KV.Bucket.get(bucket, "milk") == nil
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(KV.Bucket, []).restart == :temporary
  end
end
