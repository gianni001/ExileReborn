class RscAPSI_h1
{
    idd = -1;
    duration = 4;
    fadein = 0;
    movingEnable = 0;
    enableSimulation = 0;
    enableDisplay = 0;
    class controls
    {
        class APSILog: RscTextNS
        {
            x = 0.5;
            y = 0.99;
            w = 0.5;
            h = 0.03;
            text = "APSI: Stronger activity of floax field has been detected.."; //APSI: dected stronge energy source
            colorBackground[] = {0.5,0.5,0.5,0.4};
            ColorText[] = {1.0,0.2,0.1,1};
        };
    };
};
class RscAPSI_h2: RscAPSI_h1
{
    class controls
    {
        class APSILog: RscTextNS
        {
            x = 0.5;
            y = 0.99;
            w = 0.4;
            h = 0.03;
            text = "APSI: EVR sequence detected..";//APSI:EVR comming
            colorBackground[] = {0.5,0.5,0.5,0.4};
            ColorText[] = {1.0,0.0,0.2,1};
        };
    };
};
class RscAPSI_h3: RscAPSI_h1
{
    class controls
    {
        class APSILog: RscTextNS
        {
            x = 0.5;
            y = 0.99;
            w = 0.4;
            h = 0.03;
            text = "APSI: EM and PSI protection enabled..";//APSI:Anti EVR system actived
            colorBackground[] = {0.5,0.5,0.5,0.4};
            ColorText[] = {0.0,1.0,0.2,1};
        };
    };
};
class RscAPSI_h4: RscAPSI_h1
{
    class controls
    {
        class APSILog: RscTextNS
        {
            x = 0.5;
            y = 0.99;
            w = 0.4;
            h = 0.03;
            text = "APSI: Ready..";//APSI:Anti system ready
            colorBackground[] = {0.5,0.5,0.5,0.4};
            ColorText[] = {0.0,1.0,0.2,1};
        };
    };
};
class RscAPSI_h5: RscAPSI_h1
{
    class controls
    {
        class APSILog: RscTextNS
        {
            x = 0.5;
            y = 0.99;
            w = 0.4;
            h = 0.03;
            text = "APSI: EVR sequence start..";//APSI:EVR BLOWOUT
            colorBackground[] = {0.5,0.5,0.5,0.4};
            ColorText[] = {1.0,0.0,0.2,1};
        };
    };
};
class RscAPSI_h6: RscAPSI_h1
{
    class controls
    {
        class APSILog: RscTextNS
        {
            x = 0.5;
            y = 0.99;
            w = 0.4;
            h = 0.03;
            text = "APSI: End of EVR..";//APSI: Energy source disapper
            colorBackground[] = {0.5,0.5,0.5,0.4};
            ColorText[] = {0.0,1.0,0.2,1};
        };
    };
};
class RscAPSI_ha: RscAPSI_h1
{
    class controls
    {
        class APSILog: RscTextNS
        {
            x = 0.5;
            y = 0.99;
            w = 0.4;
            h = 0.03;
            text = "EXILE Blowout, v2.0, by Fallingsheep.";//EXILE Blowout system modfiy Fallingsheep orignal by CNSU
            colorBackground[] = {0.5,0.5,0.5,0.4};
            ColorText[] = {0.0,1.0,0.2,1};
        };
    };
};