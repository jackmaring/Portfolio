import React from "react";
import { Link } from "react-router-dom";
import styled from "@emotion/styled";
import voidGatesPic from "../assets/gatestovoid.jpg";

const VoidGatesStyle = styled.div`
  position: relative;
  margin: 0px auto;
  height: 500px;
  width: 800px;
  background-image: url(${voidGatesPic});
  background-size: cover;
  p {
    position: absolute;
    top: 250px;
    left: 225px;
    width: 350px;
    text-align: center;
    background: yellow;
    color: red;
  }
  p:hover {
    background: black;
    color: white;
  }
`;

function VoidGates() {
  return (
    <VoidGatesStyle>
      <Link to="/void">
        <p>
          Y̵̺̾͂O̶̡͂U̶̜̗͑̀ ̷̛͉̕A̶͙̩̎̽R̸͙͖̿͒E̶̲̎̒ ̴͓́N̸̬͛̋Ỏ̷̞̼W̷͖̬̎̔ ̸̤͚̑̿Ẹ̴̔͘N̸̠͐T̶̗͉̏̃E̷͍̮͋Ŕ̵͜I̷̧̩͝N̵̲̉G̴͇̾ ̸̫̄Ṭ̸̡͐H̴̻͇͌E̸͚͈̒ ̸̨̻̍G̸̚͜A̵̗͕͋T̷͕̬̔Ẽ̶̚͜S̵̲̓̃ ̶̦͖́͠T̶̐͜Ơ̵͍̋ ̸͚͕̉T̴̟͑̎H̵̘͌Ě̶͉̙̐ ̷͎̗͛V̷̤̹́̚Ȯ̵̭Í̵͍D̷̤̚.̴̳̅ ̵̘͙̊̑T̴̢̙͛̾U̸̹̔R̶͕͝N̵̙̽ ̶̡͐A̷̬̓͋R̶̲̺͊O̴̜̎̿Ȕ̴͋͜N̷͇̑D̴̙͕͌̊ ̵̧̗̏Ā̶͙̳T̴̰̭̈ ̷̨̀͠O̶̘̜̾Ñ̷̫̜̓C̷̘̣̅͑É̵̼̬͂ ̴̝̬͑̎O̷̮̽Ŗ̵̓̇
          ̶͍̈́F̷͍̖͒̉Ą̷͈̕C̴̙͐̊È̵̘̽ ̵̱̝̂̿T̶̞͓̅͌H̸̠̓͝E̴͓͎̾̀ ̴͇͒͂W̵̢̊̈R̴̯̕͜A̷̼̫͌́T̶̮̝͐Ḩ̸̓̓ ̵̮̪̌̕Ō̸͓̈́F̷͎͐͐ ̶͚̖́̾T̸̫̲͗H̷̡̤̾͑E̵͔̲͛ ̷͉̋C̶̬͗͘Ṛ̶̡̐͋E̵̞͗̄Ȃ̴͈T̷̖͍̿̔Ù̸̙͆Ŗ̷̛͝E̴̡͓͗ ̶̜̒W̷̭̓H̸͎̙̊̊Ǫ̶̎ ̸̱͓͊̆L̴̹͌I̷̻̓V̸̟̱͐É̸̜͝S̸̡̈́ ̸̖̎̋Ä̴͙̰̽T̷̳̹̀ ̷͎̤͐́Ĩ̸̗T̶͚͇́̈́Ș̵͒ ̶̩̺̉C̵̯̆̇O̴̱͑̕R̸̛̞̤̐Ḛ̶̛̮̔.̵̨͇̈́͝ (But click to
          enter if you must)
        </p>
      </Link>
    </VoidGatesStyle>
  );
}

export default VoidGates;
