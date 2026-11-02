/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20250807 (64-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Volumes/EFI/EFI/OC/ACPI/SSDT-ETPD.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000005B (91)
 *     Revision         0x02
 *     Checksum         0xEA
 *     OEM ID           "CORP"
 *     OEM Table ID     "ETPDSTA"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20250807 (539297799)
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "ETPDSTA", 0x00000000)
{
    External (_SB_.PC00.I2C1.ETPD, DeviceObj)

    Scope (_SB.PC00.I2C1.ETPD)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }
}

