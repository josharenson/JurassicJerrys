import QtQuick 2.6
import QtTest 1.1
import ".."
import "./jsonlint.js" as JsonLint

Item {
    id: root
    height: 800; width: 600

    JurassicJerrys { id: jerry; height: root.height; width: root.width }

    TestCase {
        id: testCase
        name: "JurassicJerryTest"

        property var menuFile: null
        function test_lint_menu() {

        }

        function test_jerrys_dinosaur() {

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
}
