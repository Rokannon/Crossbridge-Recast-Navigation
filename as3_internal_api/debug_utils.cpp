#include <stdlib.h>
#include <AS3\AS3.h>
#include <AS3\AS3++.h>

#include <Recast.h>

#include <DebugDraw.h>
#include <DetourDebugDraw.h>
#include <RecastDebugDraw.h>
#include <RecastDump.h>

// ////
// duDebugDraw
// ////

class duDebugDrawAdapter : public duDebugDraw
{
	AS3::local::var * m_obj;
public:
	duDebugDrawAdapter(AS3::local::var * obj)
	{
		m_obj = obj;
	}
	~duDebugDrawAdapter()
	{
		free(m_obj);
	}
	void depthMask(bool state)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);
		
		AS3_DeclareVar(state, Boolean);
		AS3_CopyScalarToVar(state, state);

		inline_as3("obj.depthMask(state);");
	}
	void texture(bool state)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		AS3_DeclareVar(state, Boolean);
		AS3_CopyScalarToVar(state, state);

		inline_as3("obj.texture(state);");
	}
	void begin(duDebugDrawPrimitives prim, float size = 1.0f)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		AS3_DeclareVar(prim, int);
		AS3_CopyScalarToVar(prim, (int)prim);

		AS3_DeclareVar(size, Number);
		AS3_CopyScalarToVar(size, size);

		inline_as3("obj.begin(prim, size);");
	}
	void vertex(const float* pos, unsigned int color)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		AS3_DeclareVar(x, Number);
		AS3_CopyScalarToVar(x, pos[0]);

		AS3_DeclareVar(y, Number);
		AS3_CopyScalarToVar(y, pos[1]);

		AS3_DeclareVar(z, Number);
		AS3_CopyScalarToVar(z, pos[2]);

		AS3_DeclareVar(color, int);
		AS3_CopyScalarToVar(color, color);

		inline_as3("obj.vertex(x, y, z, color);");
	}
	void vertex(const float x, const float y, const float z, unsigned int color)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		AS3_DeclareVar(x, Number);
		AS3_CopyScalarToVar(x, x);

		AS3_DeclareVar(y, Number);
		AS3_CopyScalarToVar(y, y);

		AS3_DeclareVar(z, Number);
		AS3_CopyScalarToVar(z, z);

		AS3_DeclareVar(color, int);
		AS3_CopyScalarToVar(color, color);

		inline_as3("obj.vertex(x, y, z, color);");
	}
	void vertex(const float* pos, unsigned int color, const float* uv)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		AS3_DeclareVar(x, Number);
		AS3_CopyScalarToVar(x, pos[0]);

		AS3_DeclareVar(y, Number);
		AS3_CopyScalarToVar(y, pos[1]);

		AS3_DeclareVar(z, Number);
		AS3_CopyScalarToVar(z, pos[2]);

		AS3_DeclareVar(color, int);
		AS3_CopyScalarToVar(color, color);

		AS3_DeclareVar(u, Number);
		AS3_CopyScalarToVar(u, uv[0]);

		AS3_DeclareVar(v, Number);
		AS3_CopyScalarToVar(v, uv[1]);

		inline_as3("obj.vertex_uv(x, y, z, color, u, v);");
	}
	void vertex(const float x, const float y, const float z, unsigned int color, const float u, const float v)
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		AS3_DeclareVar(x, Number);
		AS3_CopyScalarToVar(x, x);

		AS3_DeclareVar(y, Number);
		AS3_CopyScalarToVar(y, y);

		AS3_DeclareVar(z, Number);
		AS3_CopyScalarToVar(z, z);

		AS3_DeclareVar(color, int);
		AS3_CopyScalarToVar(color, color);

		AS3_DeclareVar(u, Number);
		AS3_CopyScalarToVar(u, u);

		AS3_DeclareVar(v, Number);
		AS3_CopyScalarToVar(v, v);

		inline_as3("obj.vertex_uv(x, y, z, color, u, v);");
	}
	void end()
	{
		AS3_DeclareVar(obj, *);
		AS3_CopyVarxxToVar(obj, *m_obj);

		inline_as3("obj.end();");
	}
};

void _duDebugDraw_alloc() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDraw_alloc(obj:*):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDraw_alloc()
{
	AS3::local::var * obj = new AS3::local::var();
	AS3_GetVarxxFromVar(*obj, obj);

	AS3_Return(new duDebugDrawAdapter(obj));
}

// ////
// RecastDebugDraw
// ////

void _duDebugDrawTriMesh() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawTriMesh(dd_ptr:int, verts_ptr:int, nverts:int, tris_ptr:int, normals_ptr:int, ntris:int, flags_ptr:int, texScale:Number):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawTriMesh()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	float * verts;
	AS3_GetScalarFromVar(verts, verts_ptr);

	int nverts;
	AS3_GetScalarFromVar(nverts, nverts);

	int * tris;
	AS3_GetScalarFromVar(tris, tris_ptr);

	float * normals;
	AS3_GetScalarFromVar(normals, normals_ptr);

	int ntris;
	AS3_GetScalarFromVar(ntris, ntris);

	unsigned char * flags;
	AS3_GetScalarFromVar(flags, flags_ptr);

	float texScale;
	AS3_GetScalarFromVar(texScale, texScale);

	duDebugDrawTriMesh(dd, verts, nverts, tris, normals, ntris, flags, texScale);
}

void _duDebugDrawTriMeshSlope() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawTriMeshSlope(dd_ptr:int, verts_ptr:int, nverts:int, tris_ptr:int, normals_ptr:int, ntris:int, walkableSlopeAngle:Number, texScale:Number):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawTriMeshSlope()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	float * verts;
	AS3_GetScalarFromVar(verts, verts_ptr);

	int nverts;
	AS3_GetScalarFromVar(nverts, nverts);

	int * tris;
	AS3_GetScalarFromVar(tris, tris_ptr);

	float * normals;
	AS3_GetScalarFromVar(normals, normals_ptr);

	int ntris;
	AS3_GetScalarFromVar(ntris, ntris);

	float walkableSlopeAngle;
	AS3_GetScalarFromVar(walkableSlopeAngle, walkableSlopeAngle);

	float texScale;
	AS3_GetScalarFromVar(texScale, texScale);

	duDebugDrawTriMeshSlope(dd, verts, nverts, tris, normals, ntris, walkableSlopeAngle, texScale);
}

void _duDebugDrawHeightfieldSolid() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawHeightfieldSolid(dd_ptr:int, hf_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawHeightfieldSolid()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcHeightfield * hf;
	AS3_GetScalarFromVar(hf, hf_ptr);

	duDebugDrawHeightfieldSolid(dd, *hf);
}

void _duDebugDrawHeightfieldWalkable() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawHeightfieldWalkable(dd_ptr:int, hf_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawHeightfieldWalkable()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcHeightfield * hf;
	AS3_GetScalarFromVar(hf, hf_ptr);

	duDebugDrawHeightfieldWalkable(dd, *hf);
}

void _duDebugDrawCompactHeightfieldSolid() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawCompactHeightfieldSolid(dd_ptr:int, chf_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawCompactHeightfieldSolid()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, hf_ptr);

	duDebugDrawCompactHeightfieldSolid(dd, *chf);
}

void _duDebugDrawCompactHeightfieldRegions() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawCompactHeightfieldRegions(dd_ptr:int, chf_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawCompactHeightfieldRegions()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, hf_ptr);

	duDebugDrawCompactHeightfieldRegions(dd, *chf);
}

void _duDebugDrawCompactHeightfieldDistance() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawCompactHeightfieldDistance(dd_ptr:int, chf_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawCompactHeightfieldDistance()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcCompactHeightfield * chf;
	AS3_GetScalarFromVar(chf, hf_ptr);

	duDebugDrawCompactHeightfieldDistance(dd, *chf);
}

void _duDebugDrawHeightfieldLayer() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawHeightfieldLayer(dd_ptr:int, layer_ptr:int, idx:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawHeightfieldLayer()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcHeightfieldLayer * layer;
	AS3_GetScalarFromVar(layer, layer_ptr);

	int idx;
	AS3_GetScalarFromVar(idx, idx);

	duDebugDrawHeightfieldLayer(dd, *layer, idx);
}

void _duDebugDrawHeightfieldLayers() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawHeightfieldLayers(dd_ptr:int, lset_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawHeightfieldLayers()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcHeightfieldLayerSet * lset;
	AS3_GetScalarFromVar(lset, lset_ptr);

	duDebugDrawHeightfieldLayers(dd, *lset);
}

/*void _duDebugDrawHeightfieldLayersRegions() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawHeightfieldLayersRegions(dd_ptr:int, lset_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawHeightfieldLayersRegions()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcHeightfieldLayerSet * lset;
	AS3_GetScalarFromVar(lset, lset_ptr);

	duDebugDrawHeightfieldLayersRegions(dd, *lset);
}*/

void _duDebugDrawRegionConnections() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawRegionConnections(dd_ptr:int, cset_ptr:int, alpha:Number):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawRegionConnections()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcContourSet * cset;
	AS3_GetScalarFromVar(cset, cset_ptr);

	int alpha;
	AS3_GetScalarFromVar(alpha, alpha);

	duDebugDrawRegionConnections(dd, *cset, alpha);
}

void _duDebugDrawRawContours() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawRawContours(dd_ptr:int, cset_ptr:int, alpha:Number):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawRawContours()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcContourSet * cset;
	AS3_GetScalarFromVar(cset, cset_ptr);

	int alpha;
	AS3_GetScalarFromVar(alpha, alpha);

	duDebugDrawRawContours(dd, *cset, alpha);
}

void _duDebugDrawContours() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawContours(dd_ptr:int, cset_ptr:int, alpha:Number):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawContours()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcContourSet * cset;
	AS3_GetScalarFromVar(cset, cset_ptr);

	int alpha;
	AS3_GetScalarFromVar(alpha, alpha);

	duDebugDrawContours(dd, *cset, alpha);
}

void _duDebugDrawPolyMesh() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawPolyMesh(dd_ptr:int, mesh_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawPolyMesh()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcPolyMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	duDebugDrawPolyMesh(dd, *mesh);
}

void _duDebugDrawPolyMeshDetail() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawPolyMeshDetail(dd_ptr:int, dmesh_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawPolyMeshDetail()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	rcPolyMeshDetail * dmesh;
	AS3_GetScalarFromVar(dmesh, dmesh_ptr);

	duDebugDrawPolyMeshDetail(dd, *dmesh);
}