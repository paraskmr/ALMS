# test/test_monitor_logs.bats
#!/usr/bin/env bats

@test "monitor_logs should find 'error' keyword" {
    run bash -c 'echo "error: disk full" | grep -i "error"'
    [ "$status" -eq 0 ]
}