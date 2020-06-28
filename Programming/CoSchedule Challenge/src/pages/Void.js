import React from "react";
import { Link } from "react-router-dom";
import styled from "@emotion/styled";
import voidPic from "../assets/void.jpg";

const VoidStyle = styled.div`
  position: relative;
  margin: 0px auto;
  height: 500px;
  width: 800px;
  background-image: url(${voidPic});
  p {
    position: absolute;
    top: 200px;
    left: 225px;
    width: 350px;
    text-align: center;
    background: purple;
    color: white;
  }
  p:hover {
    background: black;
    color: white;
  }
`;

function Void() {
  return (
    <VoidStyle>
      <Link to="/void-core">
        <p>
          Ý̷͓͍͘̚O̸̡͎̯͑U̵̡͙̣͝ ̴̢̤̓̀Ã̵̛̤̆R̴͈͈͈͛E̵̳͊͗ ̷̹́̀N̵̤͆̾͆O̶͖͎̥̓̚Ẇ̷̲͎̠̇ ̷͇̓̅I̵͙̲̭͑̽̀Ṉ̸̀ ̵̝͙͉͂͋T̵̡̞͋̇͋͜Ḫ̸̄͑͠Ȩ̴̟̈́ ̶̨̦͕̄̋̓V̵̬̖̌Ò̷̗̲̯̕I̴͔̎Ḓ̶͇̭͆̀.̶͈̾̀̀ ̵̢̒C̶̝̠͘O̵͇͆̋̏N̵͙͠T̸̤̱́I̷̹̅͂͐Ṇ̸̪̩̈́͛͠U̶͙͂Ȩ̵̝͇͐͌̀ ̷̙̒͐͘Ǐ̴͔F̷̣̖̾͌ ̷̹͔͝ͅY̷̯͐Ȯ̶͖̐͌U̷̧̢̙͠ ̸͙̯͒͘M̸̫̂U̵̢͙̒ͅS̸͎͂̔ͅT̴̡͙̩͑̅.̵͙̜̮̀̓ ̸͕̺͂͑Ḅ̵̼͋U̷̞̜̒̈́͌T̷̯̿̍͠ ̶̨̩̖̋̀P̴̰̮̗̃̄R̸͓̫̮̂Ę̸̺̳͂P̴͙͝A̴͔̥̠̅̊͠R̷̝̩̕E̷͖̝͘͝ ̷̳̫͕̂F̶̯͕̲̈́O̷̗̼̔͆̏R̴̫̋̔͜ ̴̼͈̠̓Ȋ̴͚͚T̸̢̳̈S̶͉͉͐
          ̵͖̝̝͋̅K̷̨̰̫̈́E̴̡̹̝̕È̵̗̉̎P̸͍̔͜E̶̬̻͕͗Ŕ̴̖.̷̤̖̈́̚͠ (Click again)
        </p>
      </Link>
    </VoidStyle>
  );
}

export default Void;
