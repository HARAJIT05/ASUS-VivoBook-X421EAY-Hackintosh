DefinitionBlock ("", "SSDT", 2, "CORP", "AWAC", 0x00000000)
{
    External (STAS, IntObj)

    Scope (_SB)
    {
        STAS = One
    }

    Scope (\)
    {
        Method (_INI, 0, NotSerialized)
        {
            STAS = One
        }
    }
}
