import React from "react";
import styled from "@emotion/styled";
import { useState, useEffect, useRef } from "react";

const UserCommentWrapper = styled.div`
  margin: 8px 0px;
  width: 100%;
`;

const UserCommentStyle = styled.div`
  float: right;
  width: 350px;
  border-radius: 10px;
  background-color: #d3d3d3;
  padding-left: 16px;
`;

const DeleteIcon = styled.i`
  padding-left: 8px;
  font-size: 18px;
  color: #555;
`;

const EditIcon = styled.i`
  padding-left: 8px;
  font-size: 14px;
  color: #555;
`;

const OtherCommentWrapper = styled.div`
  margin: 8px 0px;
  width: 100%;
`;

const OtherCommentStyle = styled.div`
  float: left;
  width: 350px;
  border-radius: 10px;
  background-color: #d3d3d3;
  padding-left: 16px;
`;

export function UserComment(props) {
  const [height, setHeight] = useState(0);
  const ref = useRef(null);

  // gets and then sets height of component
  useEffect(() => {
    setHeight(ref.current.clientHeight);
  }, []);

  return (
    <div>
      {/* uses the height for css */}
      <UserCommentWrapper style={{ height: `${height}px` }}>
        <UserCommentStyle ref={ref}>
          <p>
            {props.username}{" "}
            <DeleteIcon
              className="far fa-trash-alt"
              onClick={() => props.deleteComment(props.id)}
            />
          </p>
          <p>
            {props.content}
            <EditIcon
              className="fas fa-pen"
              onClick={() => props.updateComment(props.id)}
            />
          </p>
        </UserCommentStyle>
      </UserCommentWrapper>
    </div>
  );
}

export function OtherComment(props) {
  const [height, setHeight] = useState(0);
  const ref = useRef(null);

  // gets and then sets height of component
  useEffect(() => {
    setHeight(ref.current.clientHeight);
  }, []);

  return (
    <div>
      {/* uses the height for css */}
      <OtherCommentWrapper style={{ height: `${height}px` }}>
        <OtherCommentStyle ref={ref}>
          <p>{props.username}</p>
          <p>{props.content}</p>
        </OtherCommentStyle>
      </OtherCommentWrapper>
    </div>
  );
}
