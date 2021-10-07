const HelloDebotContract = {
    abi: {
        "ABI version": 2,
        "version": "2.1",
        "header": [
            "pubkey",
            "time",
            "expire"
        ],
        "functions": [
            {
                "name": "setIcon",
                "inputs": [
                    {
                        "name": "icon",
                        "type": "bytes"
                    }
                ],
                "outputs": []
            },
            {
                "name": "start",
                "inputs": [],
                "outputs": []
            },
            {
                "name": "getDebotInfo",
                "id": "0xDEB",
                "inputs": [],
                "outputs": [
                    {
                        "name": "name",
                        "type": "string"
                    },
                    {
                        "name": "version",
                        "type": "string"
                    },
                    {
                        "name": "publisher",
                        "type": "string"
                    },
                    {
                        "name": "caption",
                        "type": "string"
                    },
                    {
                        "name": "author",
                        "type": "string"
                    },
                    {
                        "name": "support",
                        "type": "address"
                    },
                    {
                        "name": "hello",
                        "type": "string"
                    },
                    {
                        "name": "language",
                        "type": "string"
                    },
                    {
                        "name": "dabi",
                        "type": "string"
                    },
                    {
                        "name": "icon",
                        "type": "bytes"
                    }
                ]
            },
            {
                "name": "getRequiredInterfaces",
                "inputs": [],
                "outputs": [
                    {
                        "name": "interfaces",
                        "type": "uint256[]"
                    }
                ]
            },
            {
                "name": "setUserInput",
                "inputs": [
                    {
                        "name": "value",
                        "type": "string"
                    }
                ],
                "outputs": []
            },
            {
                "name": "getDebotOptions",
                "inputs": [],
                "outputs": [
                    {
                        "name": "options",
                        "type": "uint8"
                    },
                    {
                        "name": "debotAbi",
                        "type": "string"
                    },
                    {
                        "name": "targetAbi",
                        "type": "string"
                    },
                    {
                        "name": "targetAddr",
                        "type": "address"
                    }
                ]
            },
            {
                "name": "setABI",
                "inputs": [
                    {
                        "name": "dabi",
                        "type": "string"
                    }
                ],
                "outputs": []
            },
            {
                "name": "constructor",
                "inputs": [],
                "outputs": []
            }
        ],
        "data": [],
        "events": [],
        "fields": [
            {
                "name": "_pubkey",
                "type": "uint256"
            },
            {
                "name": "_timestamp",
                "type": "uint64"
            },
            {
                "name": "_constructorFlag",
                "type": "bool"
            },
            {
                "name": "m_options",
                "type": "uint8"
            },
            {
                "name": "m_debotAbi",
                "type": "optional(string)"
            },
            {
                "name": "m_targetAbi",
                "type": "optional(string)"
            },
            {
                "name": "m_target",
                "type": "optional(address)"
            },
            {
                "name": "m_icon",
                "type": "bytes"
            }
        ]
    },
    tvc: "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",
    code: "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",
    codeHash: "998a979cf47f9ec53fe6503cbfc22265c8d2259c4261227c60b2f2690b3fbe9e",
};
module.exports = { HelloDebotContract };