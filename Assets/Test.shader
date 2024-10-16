Shader "Custom/Test"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _myCube ("CubeMap", CUBE) = "" {}

    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }
   
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        samplerCUBE _myCube;

        struct Input
        {
            float2 uv_MainTex;
            float3 worldRefl;
        };

        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            o.Emission = texCUBE(_myCube, IN.worldRefl).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
