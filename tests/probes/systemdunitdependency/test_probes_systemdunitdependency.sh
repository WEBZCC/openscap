#!/usr/bin/env bash

# Copyright 2014 Red Hat Inc., Durham, North Carolina.
# All Rights Reserved.
#
# OpenScap Probes Test Suite.

. ../../test_common.sh

function test_probes_systemdunitdependency {
    probecheck "systemdunitdependency" || return 255
    pidof systemd > /dev/null || return 255

    local DF="${srcdir}/test_probes_systemdunitdependency.xml"
    local RF="results.xml"

    [ -f $RF ] && rm -f $RF

    # TODO: skip-valid is used because we don't have the XSD schema
    $OSCAP oval eval --skip-valid --results $RF $DF

    if [ -f $RF ]; then
        verify_results "def" $DF $RF 3 && verify_results "tst" $DF $RF 3
        ret_val=$?
    else
        ret_val=1
    fi

    return $ret_val
}

test_probes_systemdunitdependency
