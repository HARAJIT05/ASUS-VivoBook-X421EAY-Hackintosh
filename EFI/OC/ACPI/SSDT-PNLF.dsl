DefinitionBlock ("", "SSDT", 2, "ACDT", "PNLF", 0x00000000)
{
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PC00.GFX0, DeviceObj)

    If (_OSI ("Darwin"))
    {
        If (CondRefOf (\_SB.PC00.GFX0))
        {
            Scope (\_SB.PC00.GFX0)
            {
                Device (PNLF)
                {
                    Name (_HID, EisaId ("APP0002"))
                    Name (_CID, "backlight")
                    Name (_UID, 0x13)
                    Name (_STA, 0x0B)
                }
            }
        }
        ElseIf (CondRefOf (\_SB.PCI0.GFX0))
        {
            Scope (\_SB.PCI0.GFX0)
            {
                Device (PNLF)
                {
                    Name (_HID, EisaId ("APP0002"))
                    Name (_CID, "backlight")
                    Name (_UID, 0x13)
                    Name (_STA, 0x0B)
                }
            }
        }
    }
}
