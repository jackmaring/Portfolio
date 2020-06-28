import styled from "@emotion/styled";

export const Container = styled.div`
  margin: 36px auto;
  width: 100%;
  max-width: 800px;
`;

export const ResultContainer = styled.div`
  display: flex;
  flex-flow: wrap;
`;

export const ResultItem = styled.div`
  position: relative;
  border-radius: 10px;
  margin: 16px;
  text-align: center;
  min-width: 225px;
`;

export const ImageUsername = styled.h6`
  font-size: 16px;
  position: absolute;
  bottom: 0;
  right: 0;
  margin: 0;
  background-color: white;
  padding: 5px 10px;
  border-radius: 5px 0px 0px;
`;

export const ImageWrapper = styled.div`
  display: flex;
  justify-content: center;
  align-self: center;
  box-sizing: border-box;
  height: 100%;
`;

export const ResultImage = styled.img`
  width: 100%;
  height: 200px;
  border-radius: 10px;
`;

export const IsFavoriteIcon = styled.i`
  position: absolute;
  top: 10px;
  right: 10px;
  margin: 0;
  font-size: 24px;
  color: #fffa86;
`;

export const IsNotFavoriteIcon = styled.i`
  position: absolute;
  top: 10px;
  right: 10px;
  margin: 0;
  font-size: 24px;
  color: #fffa86;
`;

export const IsVoiderIcon = styled.i`
  position: absolute;
  top: 10px;
  left: 10px;
  margin: 0;
  font-size: 24px;
  color: #ff2400;
`;

export const IsNotVoiderIcon = styled.i`
  position: absolute;
  top: 10px;
  left: 10px;
  margin: 0;
  font-size: 24px;
  color: white;
`;

export const VoiderIcon = styled.i`
  position: absolute;
  top: 10px;
  right: 13px;
  margin: 0;
  font-size: 24px;
  color: #ff2400;
`;
