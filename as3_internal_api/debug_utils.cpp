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
	AS3_GetScalarFromVar(chf, chf_ptr);

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
	AS3_GetScalarFromVar(chf, chf_ptr);

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
	AS3_GetScalarFromVar(chf, chf_ptr);

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

// ////
// DetourDebugDraw
// ////

void _duDebugDrawNavMesh() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawNavMesh(dd_ptr:int, mesh_ptr:int, flags:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawNavMesh()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	dtNavMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	unsigned char flags;
	AS3_GetScalarFromVar(flags, flags);
	
	duDebugDrawNavMesh(dd, *mesh, flags);
}

void _duDebugDrawNavMeshWithClosedList() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawNavMeshWithClosedList(dd_ptr:int, mesh_ptr:int, query_ptr:int, flags:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawNavMeshWithClosedList()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	dtNavMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	dtNavMeshQuery * query;
	AS3_GetScalarFromVar(query, query_ptr);

	unsigned char flags;
	AS3_GetScalarFromVar(flags, flags);

	duDebugDrawNavMeshWithClosedList(dd, *mesh, *query, flags);
}

void _duDebugDrawNavMeshNodes() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawNavMeshNodes(dd_ptr:int, query_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawNavMeshNodes()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	dtNavMeshQuery * query;
	AS3_GetScalarFromVar(query, query_ptr);

	duDebugDrawNavMeshNodes(dd, *query);
}

void _duDebugDrawNavMeshBVTree() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawNavMeshBVTree(dd_ptr:int, mesh_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawNavMeshBVTree()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	dtNavMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	duDebugDrawNavMeshBVTree(dd, *mesh);
}

void _duDebugDrawNavMeshPortals() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawNavMeshPortals(dd_ptr:int, mesh_ptr:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawNavMeshPortals()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	dtNavMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	duDebugDrawNavMeshPortals(dd, *mesh);
}

void _duDebugDrawNavMeshPolysWithFlags() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawNavMeshPolysWithFlags(dd_ptr:int, mesh_ptr:int, polyFlags:int, col:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawNavMeshPolysWithFlags()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	dtNavMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	unsigned short polyFlags;
	AS3_GetScalarFromVar(polyFlags, polyFlags);

	unsigned int col;
	AS3_GetScalarFromVar(col, col);

	duDebugDrawNavMeshPolysWithFlags(dd, *mesh, polyFlags, col);
}

void _duDebugDrawNavMeshPoly() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawNavMeshPoly(dd_ptr:int, mesh_ptr:int, ref:int, col:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawNavMeshPoly()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	dtNavMesh * mesh;
	AS3_GetScalarFromVar(mesh, mesh_ptr);

	dtPolyRef ref;
	AS3_GetScalarFromVar(ref, ref);

	unsigned int col;
	AS3_GetScalarFromVar(col, col);

	duDebugDrawNavMeshPoly(dd, *mesh, ref, col);
}

void _duLogBuildTimes() __attribute__((used,
	annotate("as3sig:public function internal_duLogBuildTimes(ctx_ptr:int, totalTileUsec:int):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duLogBuildTimes()
{
	rcContext * ctx;
	AS3_GetScalarFromVar(ctx, ctx_ptr);

	int totalTileUsec;
	AS3_GetScalarFromVar(totalTileUsec, totalTileUsec);

	duLogBuildTimes(*ctx, totalTileUsec);
}

void _duRGBA() __attribute__((used,
	annotate("as3sig:public function internal_duRGBA(r:int, g:int, b:int, a:int):int"),
	annotate("as3package:recastnavigation.internal_api")));

void _duRGBA()
{
	int r;
	AS3_GetScalarFromVar(r, r);

	int g;
	AS3_GetScalarFromVar(g, g);

	int b;
	AS3_GetScalarFromVar(b, b);

	int a;
	AS3_GetScalarFromVar(a, a);

	AS3_Return(duRGBA(r, g, b, a));
}

void _duDebugDrawBoxWire() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawBoxWire(dd_ptr:int, minx:Number, miny:Number, minz:Number, maxx:Number, maxy:Number, maxz:Number, col:int, lineWidth:Number):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawBoxWire()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	float minx;
	AS3_GetScalarFromVar(minx, minx);

	float miny;
	AS3_GetScalarFromVar(miny, miny);

	float minz;
	AS3_GetScalarFromVar(minz, minz);

	float maxx;
	AS3_GetScalarFromVar(maxx, maxx);

	float maxy;
	AS3_GetScalarFromVar(maxy, maxy);

	float maxz;
	AS3_GetScalarFromVar(maxz, maxz);

	unsigned int col;
	AS3_GetScalarFromVar(col, col);

	float lineWidth;
	AS3_GetScalarFromVar(lineWidth, lineWidth);

	duDebugDrawBoxWire(dd, minx, miny, minz, maxx, maxy, maxz, col, lineWidth);
}

void _duDebugDrawCylinderWire() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawCylinderWire(dd_ptr:int, minx:Number, miny:Number, minz:Number, maxx:Number, maxy:Number, maxz:Number, col:int, lineWidth:Number):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawCylinderWire()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	float minx;
	AS3_GetScalarFromVar(minx, minx);

	float miny;
	AS3_GetScalarFromVar(miny, miny);

	float minz;
	AS3_GetScalarFromVar(minz, minz);

	float maxx;
	AS3_GetScalarFromVar(maxx, maxx);

	float maxy;
	AS3_GetScalarFromVar(maxy, maxy);

	float maxz;
	AS3_GetScalarFromVar(maxz, maxz);

	unsigned int col;
	AS3_GetScalarFromVar(col, col);

	float lineWidth;
	AS3_GetScalarFromVar(lineWidth, lineWidth);

	duDebugDrawCylinderWire(dd, minx, miny, minz, maxx, maxy, maxz, col, lineWidth);
}

void _duDebugDrawCircle() __attribute__((used,
	annotate("as3sig:public function internal_duDebugDrawCircle(dd_ptr:int, x:Number, y:Number, z:Number, r:Number, col:int, lineWidth:Number):void"),
	annotate("as3package:recastnavigation.internal_api")));

void _duDebugDrawCircle()
{
	duDebugDraw * dd;
	AS3_GetScalarFromVar(dd, dd_ptr);

	float x;
	AS3_GetScalarFromVar(x, x);

	float y;
	AS3_GetScalarFromVar(y, y);

	float z;
	AS3_GetScalarFromVar(z, z);

	float r;
	AS3_GetScalarFromVar(r, r);

	unsigned int col;
	AS3_GetScalarFromVar(col, col);

	float lineWidth;
	AS3_GetScalarFromVar(lineWidth, lineWidth);

	duDebugDrawCircle(dd, x, y, z, r, col, lineWidth);
}