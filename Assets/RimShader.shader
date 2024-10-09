Shader "RimShader"
{
    Properties
    {
        _rimColor ("Rim Color", Color) = (0.5,0.5,0.5,0.0)
        _rimPower ("Rim edge power", Range(0.0,8.0)) = 1
       
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        float4 _rimColor;
        float _rimPower;

        struct Input
        {
            float3 viewDir;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));  // Or uses max function max(0, dotproduct)
            //o.Emission = _rimColor.rgb * pow (rim, _rimPower);                  // Or uses logical cuts, if dotproduct is greater than, then do something, otherwise, 0
            o.Emission = rim > 0.8 ? _rimColor.rgb : 0;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
