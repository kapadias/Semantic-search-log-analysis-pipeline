<!---
Name:        http://localhost:8500/_pubmed2015/mesh/jsTree3.cfm
Author:      Dan Wendling (dan.wendling@nih.gov)
Description: Record Set Analyzer - Browse records through the MeSH tree
Created:     2/3/2014
Modified:    2/3/2014

Help from:
- http://www.jstree.com/
	[docs]: http://jstree.com/docs
	[demo]: http://jstree.com/demo
- http://simpledotnetsolutions.wordpress.com/2012/11/25/jstree-few-examples-with-asp-netc/

--->


   <cfparam name="FORM.encoding" type="string" default="%28%28%28comprehension%5Ball+fields%5D+AND+english%5Bla%5D%29+AND+%28compliance+OR+adherence%29%29+OR+%28health%5Bti%5D+AND+literacy%5Bti%5D%29+OR+%28%22health+literacy%22+OR+%22health+literate%22+OR+%22medical+literacy%22%29+OR+%28functional%5Btw%5D+AND+health%5Btw%5D+AND+literacy%5Btw%5D%29+OR+numeracy+OR+%28%28low+literate%5Bti%5D+OR+low+literacy%5Bti%5D+OR+literacy%5Bti%5D+OR+illiteracy%5Bti%5D+OR+literate%5Bti%5D+OR+illiterate%5Bti%5D+OR+reading%5Bmh%5D+OR+comprehension%5Bmh%5D%29+AND+%28health+promotion%5Bmajor%5D+OR+health+education%5Bmajor%5D+OR+patient+education%5Bmajor%5D+OR+Communication+Barriers%5Bmajor%5D+OR+communication%5Bmajor%3Anoexp%5D+OR+Health+Knowledge%2C+Attitudes%2C+Practice%5Bmajor%5D+OR+attitude+to+health%5Bmajor%5D%29%29+OR+%28comprehension%5Bmajor%5D+AND+educational+status%5Bmajor%5D%29+OR+%28family%5Bti%5D+AND+literacy%5Bti%5D%29+OR+%28%28%22drug+labeling%22+OR+Prescriptions+%5Bmh%5D%29+AND+%28%22comprehension%22+OR+%22numeracy%22%29%29+OR+%28%28cancer%5Bti%5D+OR+diabetes%5Bti%5D%29+AND+%28literacy%5Bti%5D+OR+comprehension%5Bti%5D%29%29+OR+%22adult+literacy%22+OR+%22limited+literacy%22+OR+%22patient+understanding%22%5Bti%5D+OR+%28self+care+%5Bmajor%5D+AND+perception%5Bmh%5D%29+OR+%28comprehension+AND+food+labeling%5Bmh%5D%29+AND+English%5Bla%5D%29">
   
   <cfparam name="FORM.charCnt" type="string" default="7">
   <cfparam name="URL.CurrDataSetID" type="string" default="71">

   

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>PubMed Record Set Analyzer: MeSH Tree</title>
<link rel="stylesheet" href="dist/themes/default/style.min.css" />

</head>

<body>

<h1>PubMed Record Set Analyzer: MeSH Tree</h1>

<p>Click on the "expand" icons below to understand how the items in your record set have been indexed.</p>

<p>If you would like a smaller, more focused tree to browse in-depth, send the categories you're interested in to Dan.</p>

<p>2014 MeSH and pubmed.gov are products of the National Library of Medicine. </p>


<div id="tree"></div><!---end meshTree--->

<!-- include the jQuery library -->
<script src="dist/libs/jquery.js"></script>

<!-- include the minified jstree source -->
<script src="dist/jstree.min.js"></script>

<script>
$(function () {
	$('#tree').jstree({
		'core' : {
		  'data' : {
			'url' : function (node) {
			  return node.id === '#' ? 
				'ajax_treeTop.html' : 
				'ajax_children.cfm';
			},
			'state' : {'opened' : true},
			'data' : function (node) {
			  return { 'id' : node.id 
			  };
			}
			
		  }
		}
	});
});

</script>



<!---This works for one branch--->
<!--<script>
	$(function () {
		$('#tree').jstree({
			'core' : {
				'data' : {
					'url' : 'getData.cfm?parentName=Anatomy',
					'data' : function (node) {
						return { 'id' : node.id };
					}
				}
			}
		});
	});
</script>-->

<!---
	$('#tree').jstree({
	'core' : {
	  'data' : {
		'url' : function (node) {
		  return node.id === '#' ? 'ajax_roots.json' : 'ajax_children.json';
		},
		'data' : function (node) {
		  return { 'id' : node.id };
	  	},
	}
	}
});--->



<!---
// direct data
$('#jstree').jstree({
    'core' : {
        'data' : [
			'Analytical, Diagnostic and Therapeutic Techniques and Equipment',
			'Anatomy',
			'Anthropology, Education, Sociology and Social Phenomena',
			'Chemicals and Drugs',
			'Disciplines and Occupations',
			'Diseases',
			'Geographical Locations',
			'Health Care',
			'Humanities',
			'Information Science',
			'Organisms',
			'Persons',
			'Pharmacological Actions',
			'Phenomena and Processes',
			'Psychiatry and Psychology',
			'Publication Type',
			'Subheadings',
			'Technology and Food and Beverages',
            {
                'id' : 'node_2',
                'text' : 'Root node with options',
                'state' : { 'opened' : false, 'selected' : false },
                'children' : [ { 'text' : 'Child 1' }, 'Child 2']
            }
        ]
	}
});
--->


</body>
</html>

<!---    <ul id="item">

    <li><a>Analytical, Diagnostic and Therapeutic Techniques and Equipment Category +</a>
        <ul>
        <li id="child_node">Anesthesia and Analgesia</li>
        </ul>
    </li>
    <li><a>Anatomy Category +</a></li>
    <li><a>Anthropology, Education, Sociology and Social Phenomena Category +</a></li>
    <li><a>Check Tags Category +</a></li>
    <li><a>Chemicals and Drugs Category +</a></li>
    <li><a> Disciplines and Occupations Category +</a></li>
    <li><a>Diseases Category +</a></li>
    <li><a>Geographical Locations Category +</a></li>
    <li><a>Health Care Category +</a></li>
    <li><a>Humanities Category +</a></li>
    <li><a>Information Science Category +</a></li>
    <li><a>Organisms Category +</a></li>
    <li><a>Persons Category +</a></li>
    <li><a>Pharmacological Actions Category +</a></li>
    <li><a>Phenomena and Processes Category +</a></li>
    <li><a>Psychiatry and Psychology Category +</a></li>
    <li><a>Publication Type Category +</a></li>
    <li><a>Subheadings Category +</a></li>
    <li><a>Technology and Food and Beverages Category +</a></li>
</ul>--->


<!---
.Net code

private static List<G_JSTree> AddChildNodes(int _ParentID, int NumOfChildren, string ParentName)
{
    List<G_JSTree> G_JSTreeArray = new List<G_JSTree>();
    int n = 10;
    for (int i = 0; i < NumOfChildren; i++)
    {
        int CurrChildId = (_ParentID == 0) ? n : ((_ParentID * 10) + i);
        G_JSTree _G_JSTree = new G_JSTree();
        _G_JSTree.data = (_ParentID == 0) ? "root" + "-Child" + i.ToString() : ParentName + CurrChildId.ToString() + i.ToString();
        _G_JSTree.state = "closed";  //For async to work
        _G_JSTree.IdServerUse = CurrChildId;
        _G_JSTree.children = null;
        _G_JSTree.attr = new G_JsTreeAttribute { id = CurrChildId.ToString(), selected = false };
        G_JSTreeArray.Add(_G_JSTree);
        n = n + 10;
    }
    return G_JSTreeArray;
}



[WebMethod]
[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
public static List<G_JSTree> GetAllNodes11(string id)
{
    if (id != "-1") //-1 means initial load else async loading of children
    {
        if (id == "10")
            //Add 3 children to parent node with id=10.
            return AddChildNodes(10, 3, "xxxx");
        else
            return new List<G_JSTree>();
    }
    List<G_JSTree> G_JSTreeArray = new List<G_JSTree>();

    //Creating the JsTree data
    //In live scenarios this will come from db or Web Service
    //Add 5 root nodes
    G_JSTreeArray.AddRange(AddChildNodes(0, 5, ""));

    //Add 4 children to 3rd root node
    //The third node has id=30
    //The child nodes will have ids like 301,302,303,304
    G_JSTreeArray[3].children = (AddChildNodes(30, 4, G_JSTreeArray[3].data)).ToArray();

    //Add 5 children to level1 Node at id=302
    G_JSTreeArray[3].children[1].children = (AddChildNodes(302, 4, G_JSTreeArray[3].children[1].data)).ToArray();
   
    return G_JSTreeArray;
}





<!---Based on 
http://stackoverflow.com/questions/8078534/jstree-loading-subnodes-via-ajax-on-demand
Had started from Example 5 at http://simpledotnetsolutions.wordpress.com/2012/11/25/jstree-few-examples-with-asp-netc/
--->

       $("#meshTree").jstree({
   		"plugins" : ["themes", "json_data", "ui"],
        "json_data" : {
            "ajax" : {
                "type": 'GET',
                "url": function (node) {
                    var nodeId = "";
                    var url = ""
                    if (node == -1)
                    {
                        url = "topCats.json";
                    }
                    else
                    {
                        nodeId = node.attr('id');
                        url = "jsTree2_getData.cfm" + nodeId;
                    }

                    return url;
                },
                "success": function (new_data) {
                    return new_data;
                }
            }
        }
    });
	




[
	'Analytical, Diagnostic and Therapeutic Techniques and Equipment',
	'Anatomy',
	'Anthropology, Education, Sociology and Social Phenomena',
	'Chemicals and Drugs',
	'Disciplines and Occupations',
	'Diseases',
	'Geographical Locations',
	'Health Care',
	'Humanities',
	'Information Science',
	'Organisms',
	'Persons',
	'Pharmacological Actions',
	'Phenomena and Processes',
	'Psychiatry and Psychology',
	'Publication Type',
	'Subheadings',
	'Technology and Food and Beverages',
	{
		'id' : 'node_2',
		'text' : 'Root node with options',
		'state' : { 'opened' : false, 'selected' : false },
		'children' : [ { 'text' : 'Child 1' }, 'Child 2']
	}
]
		
			

--->