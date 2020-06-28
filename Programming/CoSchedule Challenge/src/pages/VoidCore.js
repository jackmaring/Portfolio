import React from "react";
import { useAuth0 } from "../react-auth0-spa";
import styled from "@emotion/styled";
import tacNyan from "../assets/tacnayn.gif";
import flames from "../assets/fire.gif";

import {
  Container,
  ResultContainer,
  ResultItem,
  ImageUsername,
  ImageWrapper,
  ResultImage,
  IsVoiderIcon,
} from "../components/Common";

const KEEPEROFTHEVOID = styled.img`
  display:block;
    margin: 50px auto;
`;

const Flames = styled.img`
  position: absolute;
  bottom: 0;
  min-width: 225px;
  height: 155px;
`;

function VoidCore(props) {
  const { user } = useAuth0();

  function renderVoiderz() {
    if (user) {
      if (props.voiderz.length > 0) {
        const userVoiderz = props.voiderz.filter(
          (voider) => voider.username === user.name
        );
        if (userVoiderz.length > 0) {
          return (
            <ResultContainer>
              {userVoiderz.map((result) => {
                return (
                  <ResultItem key={result.id}>
                    {/* the items in the favorites page will always be favorited */}
                    <IsVoiderIcon
                      className="fas fa-fire-alt"
                      onClick={() => props.toggleVoider(result)}
                    />
                    <ImageUsername>{result.user}</ImageUsername>
                    <ImageWrapper>
                      <ResultImage
                        src={result.previewURL}
                        alt={`${result.username} image`}
                      />
                      <Flames src={flames} />
                    </ImageWrapper>
                  </ResultItem>
                );
              })}
            </ResultContainer>
          );
        } else {
          return (
            <div>
              <p>You not sent anything to the V̵̡̧̡̢̧̧̨̛̛̲͕̳͓̘͍͍̥̙̺͉͕̗̹̣̲̱̘̝̭̙̠͔̖̝͓̱̱̻̖͎̗̖̹̩͔͉͖̗͉̅̓̒̓̈́̅̕͜͝͝Ơ̷̢̢̱̹̱͈̙̹̠͓̈́̇̿̂̔̇̇̉̈́͛̄̀̈̋̄̋͗̑̒͠͝Į̴̨̧̢͚̞̪͓̩̝̬͙͙̰͇̙̰͖̩̲̗̣̰͍̭̬͉̮͕̪͕͍̲̰̜̤͍̠͔̱̲̩̳̘͈̥̼̉̿̿̾͆͐͒̊̅͐͊̈͐̈́̈́̓̏̂̉̎̏̃͒̋̽̓͊̏̇͋́̊͊͊̉͘͘̕̕͜͝͝͝͠͝͝ͅͅD̵̨̢̡̰̮͙̠̯̲̪̖̲̩̮̭̜̫̼͙̦̘̺̤̜̫͉̳̊́̓̌̔̈́̽̀͌́͑̿̄̔͆̀͌̒͑̔̈̃̊͛͌̔̽̿́̉͛̐̉͗̿͗̑̍̌̂͛͗̕͝ͅ {user.nickname} :(</p>
            </div>
          );
        }
      } else {
        return (
          <div>
            <p>You not sent anything to the V̵̡̧̡̢̧̧̨̛̛̲͕̳͓̘͍͍̥̙̺͉͕̗̹̣̲̱̘̝̭̙̠͔̖̝͓̱̱̻̖͎̗̖̹̩͔͉͖̗͉̅̓̒̓̈́̅̕͜͝͝Ơ̷̢̢̱̹̱͈̙̹̠͓̈́̇̿̂̔̇̇̉̈́͛̄̀̈̋̄̋͗̑̒͠͝Į̴̨̧̢͚̞̪͓̩̝̬͙͙̰͇̙̰͖̩̲̗̣̰͍̭̬͉̮͕̪͕͍̲̰̜̤͍̠͔̱̲̩̳̘͈̥̼̉̿̿̾͆͐͒̊̅͐͊̈͐̈́̈́̓̏̂̉̎̏̃͒̋̽̓͊̏̇͋́̊͊͊̉͘͘̕̕͜͝͝͝͠͝͝ͅͅD̵̨̢̡̰̮͙̠̯̲̪̖̲̩̮̭̜̫̼͙̦̘̺̤̜̫͉̳̊́̓̌̔̈́̽̀͌́͑̿̄̔͆̀͌̒͑̔̈̃̊͛͌̔̽̿́̉͛̐̉͗̿͗̑̍̌̂͛͗̕͝ͅ {user.nickname} :(</p>
          </div>
        );
      }
    } else {
      return (
        <div>
          <p>Log in to save your voiderz!</p>
        </div>
      );
    }
  }
  return (
    <Container>
      <KEEPEROFTHEVOID src={tacNyan} />
      {renderVoiderz()}
    </Container>
  );
}

export default VoidCore;
