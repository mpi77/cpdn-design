<?php
header ( 'Content-Type: text/html; charset=utf-8' );
date_default_timezone_set ("Europe/Prague");

function metaResource($resource, $baseUri = "https://api.cpdn.sd2.cz/v1", $format = "application/json"){
    return array(
        "href" => sprintf("%s/%s",$baseUri, $resource),
        "mediaType" => $format
    );
}

$single = [
        "node-calc" => array(
            "load" => array(
                "active" => 0.1,
                "reactive" => 0.1
            ),
            "meta" => metaResource("nodes/22/calc/"),
            "voltage" => array(
                "dropKv" => 0.1,
                "dropProc" => 0.1,
                "phase" => 0.1,
                "value" => 0.1
            )
        ),
        "node-spec" => array(
            "cosFi" => 0.1,
            "meta" => metaResource("nodes/22/spec/"),
            "mi" => 0.1,
            "lambda" => array(
                "max" => 0.1,
                "min" => 0.1
            ),
            "power" => array(
                "active" => 0.1,
                "installed" => 0.1,
                "rated" => 0.1,
                "reactive" => 0.1
            ),
            "reactance" => array(
                "longitudinal" => 0.1,
                "transverse" => 0.1
            ),
            "voltage" => array(
                "level" => 0.1,
                "phase" => 0.1,
                "rated" => 0.1,
                "value" => 0.1
            )
        ),
        "node-mapPoint" => array("meta" => metaResource("mapPoint/11/")),
        "node-scheme" => array("meta" => metaResource("schemes/44/")),
        "node" => array(
            "calc" => "\$NODE-CALC",
            "id" => 22,
            "mapPoint" => "\$NODE-MAPPOINT",
            "meta" => metaResource("nodes/22/"),
            "scheme" => "\$NODE-SCHEME",
            "spec" => "\$NODE-SPEC"
        ),
        
        "section-calc" => array(
            "current" => array(
                "dst" => array(
                    "phase" => 0.1,
                    "ratio" => 0.1,
                    "value" => 0.1
                ),
                "src" => array(
                    "phase" => 0.1,
                    "ratio" => 0.1,
                    "value" => 0.1
                )
            ),
            "losses" => array(
                "active" => 0.1,
                "reactive" => 0.1
            ),
            "meta" => metaResource("sections/33/calc/"),
            "power" => array(
                "dst" => array(
                    "active" => 0.1,
                    "reactive" => 0.1
                ),
                "src" => array(
                    "active" => 0.1,
                    "reactive" => 0.1
                )
            )
        ),
        "section-spec" => array(
            "conductance" => 0.1,
            "meta" => metaResource("sections/33/spec/"),
            "status" => null,
            "susceptance" => 0.1,
            "current" => array(
                "max" => 0.1,
                "noLoad" => 0.1,
            ),
            "reactance" => array(
                "ratio" => 0.1,
                "value" => 0.1,
            ),
            "resistance" => array(
                "ratio" => 0.1,
                "value" => 0.1,
            ),
            "losses" => array(
                "noLoad" => 0.1,
                "short" => array(
                    "ab" => 0.1,
                    "ac" => 0.1,
                    "bc" => 0.1
                )
            ),
            "power" => array(
                "rated" => array(
                    "ab" => 0.1,
                    "ac" => 0.1,
                    "bc" => 0.1
                )
            ),
            "voltage" => array(
                "pri" => array(
                    "actual" => 0.1,
                    "rated" => 0.1
                ),
                "sec" => array(
                    "actual" => 0.1,
                    "rated" => 0.1
                ),
                "trc" => array(
                    "actual" => 0.1,
                    "rated" => 0.1
                ),
                "short" => array(
                    "ab" => 0.1,
                    "ac" => 0.1,
                    "bc" => 0.1
                )
            )
        ),
        "section-nodes" => array(
            "dst" => array("meta" => metaResource("nodes/22/")),
            "src" => array("meta" => metaResource("nodes/22/")),
            "trc" => null,
            "meta" => metaResource("sections/33/nodes/")
        ),
        "section-scheme" => array("meta" => metaResource("schemes/44/")),
        "section-paths" => array(
                        array("meta" => metaResource("paths/1/")), 
                        array("meta" => metaResource("paths/1/"))
        ),
        "section" => array(
            "calc" => "\$SECTION-CALC",
            "id" => 33,
            "meta" => metaResource("sections/33/"),
            "nodes" => "\$SECTION-NODES",
            "paths" => "\$SECTION-PATHS",
            "scheme" => "\$SECTION-SCHEME",
            "spec" => "\$SECTION-SPEC"
        ),
        
        "scheme" => array(
            "description" => "some description of the scheme",
            "id" => 44,
            "meta" => metaResource("schemes/44/"),
            "name" => "some scheme name",
            "version" => 1
        ),
        
        "mapPoint" => array(
            "gps" => array(
                "altitude" => 0.1,
                "latitude" => 0.1,
                "longitude" => 0.1
            ),
            "id" => 11,
            "meta" => metaResource("mapPoint/11/"),
            "node" => 1,
            "scheme" => array("meta" => metaResource("schemes/44/")),
            "x" => 100,
            "y" => 100
        ),
        
        "path" => array(
            "mapPoint" => array(
                "dst" => array("meta" => metaResource("mapPoint/11/")),
                "src" => array("meta" => metaResource("mapPoint/11/"))
            ),
            "id" => 55,
            "meta" => metaResource("paths/55/"),
            "section" => array("meta" => metaResource("sections/33/"))
        ),
        
        "200" => array(
            "code" => 2000,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 200,
            "usrMessage" => "OK",
        ),
        "201" => array(
            "code" => 2001,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 201,
            "usrMessage" => "Resource created.",
        ),
        "204" => array(
            "code" => 2004,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 204,
            "usrMessage" => "Resource has not content.",
        ),
        "304" => array(
            "code" => 3004,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 304,
            "usrMessage" => "Resource has not modified content.",
        ),
        "400" => array(
            "code" => 4000,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 400,
            "usrMessage" => "Bad request to get requested resource.",
        ),
        "401" => array(
            "code" => 4001,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 401,
            "usrMessage" => "Unauthorized access to resource.",
        ),
        "403" => array(
            "code" => 4003,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 403,
            "usrMessage" => "Forbidden access to resource.",
        ),
        "404" => array(
            "code" => 4004,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 404,
            "usrMessage" => "Resource was not found.",
        ),
        "405" => array(
            "code" => 4005,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 405,
            "usrMessage" => "Method not allowed.",
        ),
        "409" => array(
            "code" => 4009,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 409,
            "usrMessage" => "Conflict in request to get resource.",
        ),
        "410" => array(
            "code" => 4010,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 410,
            "usrMessage" => "Resource is no longer available.",
        ),
        "500" => array(
            "code" => 5000,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 500,
            "usrMessage" => "Internal server error.",
        ),
        "503" => array(
            "code" => 5003,
            "devMessage" => null,
            "meta" => metaResource("called/resource/"),
            "status" => 503,
            "usrMessage" => "Service is unavailable.",
        )
        ];

foreach($single as $key => $value){
    $data = $value;
    switch($key){
        case "node":
            $data["calc"] = $single["node-calc"];
            $data["mapPoint"] = $single["node-mapPoint"];
            $data["scheme"] = $single["node-scheme"];
            $data["spec"] = $single["node-spec"];
            break;
        case "section":
            $data["calc"] = $single["section-calc"];
            $data["nodes"] = $single["section-nodes"];
            $data["paths"] = $single["section-paths"];
            $data["scheme"] = $single["section-scheme"];
            $data["spec"] = $single["section-spec"];    
            break;
    }
    file_put_contents($key.".json", json_encode($data, JSON_PRETTY_PRINT|JSON_NUMERIC_CHECK));
}

$dummy_node = $single["node"];
$dummy_node["calc"] = $single["node-calc"];
$dummy_node["mapPoint"] = $single["node-mapPoint"];
$dummy_node["scheme"] = $single["node-scheme"];
$dummy_node["spec"] = $single["node-spec"];

$dummy_section = $single["section"];
$dummy_section["calc"] = $single["section-calc"];
$dummy_section["nodes"] = $single["section-nodes"];
$dummy_section["paths"] = $single["section-paths"];
$dummy_section["scheme"] = $single["section-scheme"];
$dummy_section["spec"] = $single["section-spec"];
            
$collection = array(
        "nodes" => array(
                $dummy_node,
                $dummy_node
        ),
        "sections" => array(
                $dummy_section,
                $dummy_section
        )
);

foreach($collection as $key => $value){
    file_put_contents($key.".json", json_encode($value, JSON_PRETTY_PRINT|JSON_NUMERIC_CHECK));
}

echo "<pre>";
var_dump(json_encode($single, JSON_PRETTY_PRINT|JSON_NUMERIC_CHECK));
echo "</pre>";

?>
