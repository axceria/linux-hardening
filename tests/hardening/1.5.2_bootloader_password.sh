# shellcheck shell=bash
# run-shellcheck
test_audit() {
    if [ -f "/.dockerenv" ]; then
        skip "SKIPPED on docker"
    else
        skip "Skipped DIY"
        #describe Running on blank host
        #register_test retvalshouldbe 0
        #dismiss_count_for_test
        # shellcheck disable=2154
        #run blank "${CIS_CHECKS_DIR}/${script}.sh" --audit-all

        # TODO fill comprehensive tests
    fi
}
