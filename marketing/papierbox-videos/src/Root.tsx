import "./index.css";
import { Composition } from "remotion";
import { PapierboxDemo } from "./PapierboxDemo";
import { SpokesEdit } from "./SpokesEdit";

export const RemotionRoot: React.FC = () => {
  return (
    <>
      <Composition
        id="PapierboxTikTok"
        component={PapierboxDemo}
        durationInFrames={450}
        fps={30}
        width={1080}
        height={1920}
      />
      <Composition
        id="SpokesVideo"
        component={SpokesEdit}
        durationInFrames={900}
        fps={30}
        width={1080}
        height={1920}
      />
    </>
  );
};
