#!/bin/sh

b2="bjam"
b2_flags="${*}"

iterate_toolset_instruction_sets () {
    toolset=${1}
    architecture=${2}
    instruction_sets=${3}

    variants="debug release"
#    links="static shared"
    links="static"
    exception_handlings="off on"
    rttis="off on"

    for instruction_set in ${instruction_sets} ; do
        for variant in ${variants} ; do
            for link in ${links} ; do
                for exception_handling in ${exception_handlings} ; do
                    for rtti in ${rttis} ; do
                        ${b2} \
                            toolset="${toolset}" \
                            architecture="${architecture}" \
                            instruction-set="${instruction_set}" \
                            variant="${variant}" \
                            link="${link}" \
                            exception-handling="${exception_handling}" \
                            rtti="${rtti}" \
                            ${b2_flags}
                    done
                done
            done
        done
    done
}

iterate_toolset_instruction_sets tms320c2000-6.4.4 tms320c2000 tms320c2000 tms320c2800
iterate_toolset_instruction_sets tms320c2000-15.3.0 tms320c2000 tms320c2000 tms320c2800
iterate_toolset_instruction_sets tms320c5400-4.2.0 tms320c5400 tms320c5400 tms320c5409
iterate_toolset_instruction_sets tms320c5500-4.4.1 tms320c5500 tms320c5509 tms320c5510
iterate_toolset_instruction_sets tms320c6000-7.4.14 tms320c6000 tms320c6000 tms320c6200 tms320c6400
