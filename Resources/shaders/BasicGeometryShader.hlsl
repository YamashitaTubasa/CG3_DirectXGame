#include "BasicShaderHeader.hlsli"

// 三角形の入力から、三角形を出力するが、
// 途中でUVを加工してタイリング
//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++)
//	{
//		GSOutput element;                   // 出力用頂点データ
//		element.svpos = input[i].svpos;     // 頂点座標をコピー
//		element.normal = input[i].normal;   // 法線をコピー
//		element.uv = input[i].uv;           // UVをコピー
//		// UVを2倍に
//		element.uv = input[i].uv * 2.0f;
//		output.Append(element);
//	}
//}

// 三角形の入力から、三角形を2つ出力
[maxvertexcount(6)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	// 1つ目の三角形
	for (uint i = 0; i < 3; i++) {
		GSOutput element;
		element.svpos = input[i].svpos;
		element.normal = input[i].normal;
		element.uv = input[i].uv;
		output.Append(element);
	}
	// 現在のストリップを終了
	output.RestartStrip();

	// 2つ目の三角形
	for (uint i = 0; i < 3; i++) {
		GSOutput element;
		// X方向に20ずらす
		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f, 0.0f);
		element.normal = input[i].normal;
		// UVを5倍に
		element.uv = input[i].uv * 5.0f;
		output.Append(element);
	}
}

//// 三角形の入力から、点を1つ出力するサンプル
//[maxvertexcount(1)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 点ストリーム
//	inout PointStream< GSOutput > output
//)
//{
//	GSOutput element;                   // 出力用頂点データ
//	element.svpos = input[0].svpos;     // 頂点座標をコピー
//	element.normal = input[0].normal;   // 法線をコピー
//	element.uv = input[0].uv;           // UVをコピー
//	// 頂点を1つ出力（出力リストに追加）
//	output.Append(element);
//}
//
//// 三角形の入力から、点を3つ出力するサンプル
//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 点ストリーム
//	inout PointStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++)
//	{
//		GSOutput element;                   // 出力用頂点データ
//		element.svpos = input[i].svpos;     // 頂点座標をコピー
//		element.normal = input[i].normal;   // 法線をコピー
//		element.uv = input[i].uv;           // UVをコピー
//		// 頂点を出力（出力リストに追加）
//		output.Append(element);
//	}
//}
//
//
//// 三角形の入力から、線分を1つ出力するサンプル
//[maxvertexcount(2)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 線分ストリーム
//	inout LineStream< GSOutput > output
//)
//{
//	GSOutput element;                   // 出力用頂点データ
//
//	// 線分の始点
//	element.svpos = input[0].svpos;     // 頂点座標をコピー
//	element.normal = input[0].normal;   // 法線をコピー
//	element.uv = input[0].uv;           // UVをコピー
//	output.Append(element);
//
//	// 線分の終点
//	element.svpos = input[1].svpos;     // 頂点座標をコピー
//	element.normal = input[1].normal;   // 法線をコピー
//	element.uv = input[1].uv;           // UVをコピー
//	output.Append(element);
//}
//
//// 三角形の入力から、線分を3つ出力するサンプル
//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 線分ストリーム
//	inout LineStream< GSOutput > output
//)
//{
//	GSOutput element;                   // 出力用頂点データ
//	// 三角形の頂点1点ずつ扱う
//	for (uint i = 0; i < 3; i++)
//	{
//		// 線分の始点
//		element.svpos = input[i].svpos;     // 頂点座標をコピー
//		element.normal = input[i].normal;   // 法線をコピー
//		element.uv = input[i].uv;           // UVをコピー
//		output.Append(element);
//
//		// 線分の終点
//		if (i == 2) {
//			element.svpos = input[0].svpos;     // 頂点座標をコピー
//			element.normal = input[0].normal;   // 法線をコピー
//			element.uv = input[0].uv;           // UVをコピー
//		}
//		else {
//			element.svpos = input[i + 1].svpos;
//			element.normal = input[i + 1].normal;
//			element.uv = input[i + 1].uv;
//		}
//		output.Append(element);
//		// 現在のストリップを終了し、次のストリップを開始
//		output.RestartStrip();
//	}
//}
//
//// 三角形の入力から、線分を3つ出力するサンプル
//[maxvertexcount(4)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	// 線分ストリーム
//	inout LineStream< GSOutput > output
//)
//{
//	GSOutput element;                   // 出力用頂点データ
//	// 三角形の頂点1点ずつ扱う
//	for (uint i = 0; i < 3; i++)
//	{
//		element.svpos = input[i].svpos;     // 頂点座標をコピー
//		element.normal = input[i].normal;   // 法線をコピー
//		element.uv = input[i].uv;           // UVをコピー
//		// 頂点を1つ追加
//		output.Append(element);
//	}
//	// 最初の点をもう1度追加
//	element.svpos = input[0].svpos;     // 頂点座標をコピー
//	element.normal = input[0].normal;   // 法線をコピー
//	element.uv = input[0].uv;           // UVをコピー
//	// 頂点を1つ追加
//	output.Append(element);
//}