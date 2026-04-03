import {
  AbsoluteFill,
  Sequence,
  useCurrentFrame,
  useVideoConfig,
  interpolate,
  spring,
  Video,
  Img,
  Easing,
  staticFile,
} from "remotion";

const GREEN = "#22c55e";
const BLACK = "#1a1c1c";
const BOTTLE_GREEN = "#004225";

// ============================================================
// ANIMATED SUBTITLE COMPONENT
// ============================================================
const AnimatedSubtitle: React.FC<{
  text: string;
  startFrame: number;
  durationFrames: number;
  style?: React.CSSProperties;
}> = ({ text, startFrame, durationFrames, style }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();
  const localFrame = frame - startFrame;

  if (localFrame < 0 || localFrame > durationFrames) return null;

  const words = text.split(" ");
  const wordsPerFrame = durationFrames / words.length;

  return (
    <div
      style={{
        display: "flex",
        flexWrap: "wrap",
        justifyContent: "center",
        gap: "8px",
        maxWidth: "85%",
        ...style,
      }}
    >
      {words.map((word, i) => {
        const wordStart = i * wordsPerFrame * 0.6;
        const opacity = interpolate(localFrame, [wordStart, wordStart + 5], [0, 1], {
          extrapolateLeft: "clamp",
          extrapolateRight: "clamp",
        });
        const y = interpolate(localFrame, [wordStart, wordStart + 5], [10, 0], {
          extrapolateLeft: "clamp",
          extrapolateRight: "clamp",
        });
        const isHighlight =
          word.toLowerCase().includes("papierbox") ||
          word.toLowerCase().includes("free") ||
          word.toLowerCase().includes("cheapest") ||
          word.toLowerCase().includes("5") ||
          word.toLowerCase().includes("seconds") ||
          word.toLowerCase().includes("save");

        return (
          <span
            key={i}
            style={{
              opacity,
              transform: `translateY(${y}px)`,
              fontSize: 42,
              fontWeight: 900,
              color: isHighlight ? GREEN : "white",
              textShadow: "0 2px 8px rgba(0,0,0,0.7), 0 0 20px rgba(0,0,0,0.4)",
              fontFamily: "'Plus Jakarta Sans', sans-serif",
              letterSpacing: -0.5,
            }}
          >
            {word}
          </span>
        );
      })}
    </div>
  );
};

// ============================================================
// PRICE COUNTER ANIMATION
// ============================================================
const PriceCounter: React.FC<{
  from: number;
  to: number;
  label: string;
}> = ({ from, to, label }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const progress = spring({ frame, fps, from: 0, to: 1, config: { damping: 20, mass: 0.5 } });
  const value = from + (to - from) * progress;
  const scale = spring({ frame, fps, from: 0.5, to: 1, config: { damping: 12 } });

  return (
    <div style={{ textAlign: "center", transform: `scale(${scale})` }}>
      <div
        style={{
          fontSize: 72,
          fontWeight: 900,
          color: GREEN,
          fontFamily: "'Plus Jakarta Sans', sans-serif",
          textShadow: "0 2px 10px rgba(34,197,94,0.5)",
        }}
      >
        €{value.toFixed(2)}
      </div>
      <div
        style={{
          fontSize: 22,
          fontWeight: 700,
          color: "rgba(255,255,255,0.6)",
          fontFamily: "'Plus Jakarta Sans', sans-serif",
          marginTop: 4,
        }}
      >
        {label}
      </div>
    </div>
  );
};

// ============================================================
// STORE BADGE
// ============================================================
const StoreBadge: React.FC<{
  name: string;
  price: string;
  delay: number;
  best?: boolean;
}> = ({ name, price, delay, best }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const slideX = interpolate(frame, [delay, delay + 8], [300, 0], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
    easing: Easing.out(Easing.cubic),
  });
  const opacity = interpolate(frame, [delay, delay + 6], [0, 1], {
    extrapolateRight: "clamp",
  });

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "space-between",
        alignItems: "center",
        background: best ? GREEN : "rgba(255,255,255,0.1)",
        border: best ? `3px solid ${GREEN}` : "2px solid rgba(255,255,255,0.15)",
        borderRadius: 18,
        padding: "14px 22px",
        marginBottom: 8,
        width: "85%",
        transform: `translateX(${slideX}px)`,
        opacity,
        backdropFilter: "blur(10px)",
      }}
    >
      <span
        style={{
          fontSize: 26,
          fontWeight: 800,
          color: best ? "white" : "rgba(255,255,255,0.8)",
          fontFamily: "'Plus Jakarta Sans', sans-serif",
        }}
      >
        {best ? "🏆 " : ""}{name}
      </span>
      <span
        style={{
          fontSize: 30,
          fontWeight: 900,
          color: best ? "white" : GREEN,
          fontFamily: "'Plus Jakarta Sans', sans-serif",
        }}
      >
        {price}
      </span>
    </div>
  );
};

// ============================================================
// MAIN COMPOSITION
// ============================================================
export const SpokesEdit: React.FC = () => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // Pulse animation for CTA
  const pulse = interpolate(frame % 20, [0, 10, 20], [1, 1.04, 1]);

  // Logo fade in at start
  const logoOpacity = interpolate(frame, [0, 20], [0, 1], { extrapolateRight: "clamp" });
  const logoScale = spring({ frame, fps, from: 0.5, to: 1, config: { damping: 12 } });

  // Top bar slide in
  const topBarY = interpolate(frame, [5, 20], [-60, 0], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
    easing: Easing.out(Easing.cubic),
  });

  // Bottom gradient
  const bottomGradient = interpolate(frame, [0, 30], [0, 1], { extrapolateRight: "clamp" });

  return (
    <AbsoluteFill style={{ backgroundColor: BLACK }}>
      {/* LAYER 1: Video */}
      <Video
        src={staticFile("spokeswoman.mp4")}
        style={{
          width: "100%",
          height: "100%",
          objectFit: "cover",
        }}
      />

      {/* LAYER 2: Gradient overlays for text readability */}
      {/* Top gradient */}
      <div
        style={{
          position: "absolute",
          top: 0,
          left: 0,
          right: 0,
          height: "20%",
          background: "linear-gradient(180deg, rgba(0,0,0,0.7) 0%, transparent 100%)",
          opacity: bottomGradient,
        }}
      />
      {/* Bottom gradient */}
      <div
        style={{
          position: "absolute",
          bottom: 0,
          left: 0,
          right: 0,
          height: "45%",
          background: "linear-gradient(0deg, rgba(0,0,0,0.85) 0%, rgba(0,0,0,0.4) 60%, transparent 100%)",
          opacity: bottomGradient,
        }}
      />

      {/* LAYER 3: Top bar — Logo + Brand */}
      <div
        style={{
          position: "absolute",
          top: 0,
          left: 0,
          right: 0,
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          padding: "20px 28px",
          transform: `translateY(${topBarY}px)`,
        }}
      >
        <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
          <Img
            src="/logo.png"
            style={{
              height: 50,
              width: "auto",
              opacity: logoOpacity,
              transform: `scale(${logoScale})`,
            }}
          />
        </div>
        <div
          style={{
            background: GREEN,
            color: "white",
            fontSize: 14,
            fontWeight: 900,
            padding: "6px 16px",
            borderRadius: 20,
            fontFamily: "'Plus Jakarta Sans', sans-serif",
            opacity: logoOpacity,
            letterSpacing: 1,
          }}
        >
          FREE TOOL
        </div>
      </div>

      {/* LAYER 4: Animated subtitles at bottom */}
      <div
        style={{
          position: "absolute",
          bottom: 140,
          left: 0,
          right: 0,
          display: "flex",
          justifyContent: "center",
        }}
      >
        {/* Subtitle blocks — adjust text + timing to match your video's audio */}
        <Sequence from={0} durationInFrames={90}>
          <AnimatedSubtitle
            text="Tired of overpaying for groceries in Germany?"
            startFrame={0}
            durationFrames={85}
          />
        </Sequence>

        <Sequence from={90} durationInFrames={90}>
          <AnimatedSubtitle
            text="I compare prices from Lidl Aldi Penny Kaufland and Netto"
            startFrame={0}
            durationFrames={85}
          />
        </Sequence>

        <Sequence from={180} durationInFrames={90}>
          <AnimatedSubtitle
            text="Search any product and find the cheapest price in 5 seconds"
            startFrame={0}
            durationFrames={85}
          />
        </Sequence>

        <Sequence from={270} durationInFrames={90}>
          <AnimatedSubtitle
            text="papierbox.eu — completely free no signup needed"
            startFrame={0}
            durationFrames={85}
          />
        </Sequence>

        {/* Price comparison cards appearing at middle of video */}
        <Sequence from={360} durationInFrames={180}>
          <div style={{ position: "absolute", bottom: 80, left: 0, right: 0, display: "flex", flexDirection: "column", alignItems: "center" }}>
            <StoreBadge name="Kaufland" price="€1.29" delay={0} best />
            <StoreBadge name="Penny" price="€1.69" delay={8} />
            <StoreBadge name="Lidl" price="€1.79" delay={16} />
          </div>
        </Sequence>
      </div>

      {/* LAYER 5: CTA at the end */}
      <Sequence from={750} durationInFrames={150}>
        <div
          style={{
            position: "absolute",
            bottom: 160,
            left: 0,
            right: 0,
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
          }}
        >
          <div
            style={{
              background: GREEN,
              color: "white",
              fontSize: 48,
              fontWeight: 900,
              padding: "18px 50px",
              borderRadius: 50,
              fontFamily: "'Plus Jakarta Sans', sans-serif",
              border: `3px solid white`,
              boxShadow: "0 4px 30px rgba(34,197,94,0.5)",
              transform: `scale(${pulse})`,
            }}
          >
            papierbox.eu
          </div>
          <div
            style={{
              color: "rgba(255,255,255,0.6)",
              fontSize: 20,
              fontWeight: 700,
              marginTop: 12,
              fontFamily: "'Plus Jakarta Sans', sans-serif",
            }}
          >
            Free · No signup · All 5 stores
          </div>
        </div>
      </Sequence>

      {/* LAYER 6: Engagement elements */}
      {/* Animated green line at bottom */}
      <div
        style={{
          position: "absolute",
          bottom: 0,
          left: 0,
          height: 4,
          background: GREEN,
          width: `${(frame / 900) * 100}%`,
          boxShadow: `0 0 10px ${GREEN}`,
        }}
      />
    </AbsoluteFill>
  );
};
