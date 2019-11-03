Shader "Unlit/ShaderA"{
    Properties{    
        _veca ("VectorA", Vector) = (0,0,0,0)
    }
    
    SubShader{
        Tags { "RenderType"="Opaque" }

        Pass{
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"
            #include "SDFCircle.cginc"

            struct appdata{
                float4 vertex : POSITION;
            };

            struct v2f{
                float4 position : SV_POSITION;
                float4 worldPos : TEXCOORD0;
            };
            
            float4 _veca;
            
            v2f vert (appdata v){
                v2f o;
                o.position = UnityObjectToClipPos(v.vertex);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex);
                return o;
            }
            
            float sdf(float2 position){
                float circleDist = circle(position - _veca.xy, _veca.z);
                return circleDist;
            }
            
            fixed4 frag (v2f i) : SV_Target {
                float dist = sdf(i.worldPos.xz);
                fixed4 col = fixed4(dist, dist, dist, 1);
                return col;
            }
            
            ENDCG
        }
    }
}