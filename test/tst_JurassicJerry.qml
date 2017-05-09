import QtQuick 2.6
import QtTest 1.1

import "./jsonlint.js" as JsonLint

TestCase {
    id: testCase
    name: "JurassicJerryTest"

    property var menuFile: null
    function test_lint_menu() {
        readTextFile("../data/menu.jerry")
        while (!menuFile) { wait(1); }
        JsonLint.jsonlint.parse(menuFile)
    }

    function readTextFile(file)
    {
        var rawFile = new XMLHttpRequest();
        rawFile.open("GET", file, false);
        rawFile.onreadystatechange = function ()
        {
            if(rawFile.readyState === 4)
            {
                if(rawFile.status === 200 || rawFile.status == 0)
                {
                    menuFile = rawFile.responseText;
                }
            }
        }
        rawFile.send(null);
    }
}
