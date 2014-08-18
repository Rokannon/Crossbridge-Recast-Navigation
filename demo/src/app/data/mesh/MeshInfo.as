package app.data.mesh
{
    import app.data.MeshBounds;

    import flash.utils.ByteArray;

    public class MeshInfo
    {
        public var name:String;
        public const verts:Vector.<Number> = new Vector.<Number>();
        public const tris:Vector.<int> = new Vector.<int>();
        public const normals:Vector.<Number> = new Vector.<Number>();
        public var nverts:int = 0;
        public var ntris:int = 0;

        public function MeshInfo()
        {
        }

        public function initFromByteArray(byteArray:ByteArray, scale:Number = 1.0):void
        {
            var i:int;
            byteArray.position = 0;
            var string:String = byteArray.readUTFBytes(byteArray.bytesAvailable);
            var lines:Array = string.split("\r\n");
            var length:int = lines.length;
            for (i = 0; i < length; ++i)
            {
                var parts:Array = lines[i].split(/\s+/gi);
                if (parts[0] == "v")
                {
                    ++nverts;
                    verts.push(scale * parts[1], scale * parts[2], scale * parts[3]);
                }
                if (parts[0] == "f")
                {
                    ++ntris;
                    tris.push(parts[1] - 1, parts[2] - 1, parts[3] - 1);
                }
            }

            // Calculate normals.
            for (i = 0; i < 3 * ntris; i += 3)
            {
                var v0x:Number = verts[3 * tris[i + 0] + 0];
                var v0y:Number = verts[3 * tris[i + 0] + 1];
                var v0z:Number = verts[3 * tris[i + 0] + 2];
                var v1x:Number = verts[3 * tris[i + 1] + 0];
                var v1y:Number = verts[3 * tris[i + 1] + 1];
                var v1z:Number = verts[3 * tris[i + 1] + 2];
                var v2x:Number = verts[3 * tris[i + 2] + 0];
                var v2y:Number = verts[3 * tris[i + 2] + 1];
                var v2z:Number = verts[3 * tris[i + 2] + 2];
                var e0x:Number = v1x - v0x;
                var e1x:Number = v2x - v0x;
                var e0y:Number = v1y - v0y;
                var e1y:Number = v2y - v0y;
                var e0z:Number = v1z - v0z;
                var e1z:Number = v2z - v0z;
                var nx:Number = e0y * e1z - e0z * e1y;
                var ny:Number = e0z * e1x - e0x * e1z;
                var nz:Number = e0x * e1y - e0y * e1x;
                var d:Number = Math.sqrt(nx * nx + ny * ny + nz * nz);
                if (d > 0)
                {
                    d = 1 / d;
                    nx *= d;
                    ny *= d;
                    nz *= d;
                }
                normals[i + 0] = nx;
                normals[i + 1] = ny;
                normals[i + 2] = nz;
            }
        }

        public function getMeshBoundMin(resultBounds:MeshBounds = null):MeshBounds
        {
            if (resultBounds == null)
            {
                resultBounds = new MeshBounds();
            }
            resultBounds.x = Number.POSITIVE_INFINITY;
            resultBounds.y = Number.POSITIVE_INFINITY;
            resultBounds.z = Number.POSITIVE_INFINITY;
            for (var i:int = 0; i < nverts; ++i)
            {
                resultBounds.x = Math.min(resultBounds.x, verts[3 * i + 0]);
                resultBounds.y = Math.min(resultBounds.y, verts[3 * i + 1]);
                resultBounds.z = Math.min(resultBounds.z, verts[3 * i + 2]);
            }
            return resultBounds;
        }

        public function getMeshBoundMax(resultBounds:MeshBounds = null):MeshBounds
        {
            if (resultBounds == null)
            {
                resultBounds = new MeshBounds();
            }
            resultBounds.x = Number.NEGATIVE_INFINITY;
            resultBounds.y = Number.NEGATIVE_INFINITY;
            resultBounds.z = Number.NEGATIVE_INFINITY;
            for (var i:int = 0; i < nverts; ++i)
            {
                resultBounds.x = Math.max(resultBounds.x, verts[3 * i + 0]);
                resultBounds.y = Math.max(resultBounds.y, verts[3 * i + 1]);
                resultBounds.z = Math.max(resultBounds.z, verts[3 * i + 2]);
            }
            return resultBounds;
        }
    }
}