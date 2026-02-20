{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0220d79f3f480ecf5",
            "InstanceId": "i-053d01d399d094330",
            "InstanceType": "t2.micro",
            "LaunchTime": "2026-02-20T13:00:07+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-23-72.ec2.internal",
            "PrivateIpAddress": "172.31.23.72",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0193b8233224c1963",
            "VpcId": "vpc-03ef1a8d980ec947b",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "2a292023-1599-495b-9d2d-06f45e6d46d3",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2026-02-20T13:00:07+00:00",
                        "AttachmentId": "eni-attach-03418c2c42e2dee51",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "allow-all",
                            "GroupId": "sg-084659653bcf2b298"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:ff:f2:5a:9c:cd",
                    "NetworkInterfaceId": "eni-09fa97ecbb9264fad",
                    "OwnerId": "799345568171",
                    "PrivateDnsName": "ip-172-31-23-72.ec2.internal",
                    "PrivateIpAddress": "172.31.23.72",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-23-72.ec2.internal",
                            "PrivateIpAddress": "172.31.23.72"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0193b8233224c1963",
                    "VpcId": "vpc-03ef1a8d980ec947b",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "allow-all",
                    "GroupId": "sg-084659653bcf2b298"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "Test"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "legacy-bios"
        }
    ],
    "OwnerId": "799345568171",
    "ReservationId": "r-00d390aabdfce6dce"
}
