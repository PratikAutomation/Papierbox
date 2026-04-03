import {
  AbsoluteFill,
  Sequence,
  useCurrentFrame,
  interpolate,
  spring,
  useVideoConfig,
  Easing,
} from "remotion";

// Brand colors
const GREEN = "#22c55e";
const BLACK = "#1a1c1c";
const WHITE = "#FAFAFA";
const RED = "#dc2626";

// ============================================================
// SCENE 1: HOOK (0-3.5s, frames 0-105)
// ============================================================
const SceneHook: React.FC = () => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const titleScale = spring({ frame, fps, from: 0, to: 1, config: { damping: 12 } });
  const titleOpacity = interpolate(frame, [0, 15], [0, 1], { extrapolateRight: "clamp" });
  const emojiScale = spring({ frame: frame - 10, fps, from: 0, to: 1, config: { damping: 8 } });
  const subOpacity = interpolate(frame, [30, 50], [0, 1], { extrapolateRight: "clamp" });
  const subY = interpolate(frame, [30, 50], [30, 0], { extrapolateRight: "clamp" });

  return (
    <AbsoluteFill
      style={{
        backgroundColor: WHITE,
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        padding: "80px 70px",
      }}
    >
      <div style={{ fontSize: 150, transform: `scale(${emojiScale})`, marginBottom: 40 }}>💸</div>
      <div
        style={{
          fontSize: 82,
          fontWeight: 900,
          color: BLACK,
          textAlign: "center",
          lineHeight: 1.1,
          letterSpacing: -2,
          transform: `scale(${titleScale})`,
          opacity: titleOpacity,
        }}
      >
        You're{" "}
        <span style={{ color: RED }}>overpaying</span>
        <br />
        for groceries
        <br />
        in Germany
      </div>
      <div
        style={{
          fontSize: 40,
          fontWeight: 700,
          color: BLACK,
          opacity: subOpacity * 0.4,
          transform: `translateY(${subY}px)`,
          marginTop: 30,
        }}
      >
        But you don't have to →
      </div>
    </AbsoluteFill>
  );
};

// ============================================================
// SCENE 2: THE PROBLEM (3.5-7s, frames 105-210)
// ============================================================
const SceneProblem: React.FC = () => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const stores = [
    { name: "Lidl", color: "#0050AA", emoji: "🔵" },
    { name: "Aldi", color: "#00005F", emoji: "🟡" },
    { name: "Penny", color: "#CD1719", emoji: "🔴" },
    { name: "Kaufland", color: "#E10915", emoji: "🟠" },
    { name: "Netto", color: "#FFE600", emoji: "🟢" },
  ];

  const titleOpacity = interpolate(frame, [0, 15], [0, 1], { extrapolateRight: "clamp" });

  return (
    <AbsoluteFill
      style={{
        backgroundColor: WHITE,
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        padding: "80px 60px",
      }}
    >
      <div
        style={{
          fontSize: 72,
          fontWeight: 900,
          color: BLACK,
          textAlign: "center",
          lineHeight: 1.1,
          marginBottom: 50,
          opacity: titleOpacity,
        }}
      >
        <span style={{ color: GREEN }}>5</span> stores.
        <br />
        <span style={{ color: GREEN }}>5</span> different
        <br />
        prices.
      </div>

      {stores.map((store, i) => {
        const delay = i * 12;
        const slideX = interpolate(frame, [delay + 10, delay + 25], [400, 0], {
          extrapolateLeft: "clamp",
          extrapolateRight: "clamp",
          easing: Easing.out(Easing.cubic),
        });
        const opacity = interpolate(frame, [delay + 10, delay + 20], [0, 1], {
          extrapolateRight: "clamp",
        });

        return (
          <div
            key={store.name}
            style={{
              width: "85%",
              background: "white",
              border: `4px solid ${BLACK}`,
              borderRadius: 28,
              padding: "24px 32px",
              marginBottom: 14,
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
              boxShadow: `5px 5px 0px rgba(26,28,28,0.12)`,
              transform: `translateX(${slideX}px)`,
              opacity,
            }}
          >
            <div style={{ fontSize: 36, fontWeight: 800 }}>
              {store.emoji} {store.name}
            </div>
            <div style={{ fontSize: 34, fontWeight: 900, color: RED }}>€?.??</div>
          </div>
        );
      })}

      <div
        style={{
          fontSize: 38,
          fontWeight: 800,
          color: BLACK,
          opacity: 0.35,
          marginTop: 20,
          textAlign: "center",
        }}
      >
        Who's cheapest THIS WEEK? 🤔
      </div>
    </AbsoluteFill>
  );
};

// ============================================================
// SCENE 3: THE SOLUTION (7-11s, frames 210-330)
// ============================================================
const SceneSolution: React.FC = () => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // Typing animation
  const searchText = "Butter";
  const charsShown = Math.min(
    Math.floor(interpolate(frame, [10, 50], [0, searchText.length], { extrapolateRight: "clamp" })),
    searchText.length
  );
  const typedText = searchText.slice(0, charsShown);
  const cursorBlink = Math.floor(frame / 15) % 2 === 0;

  // Search bar scale in
  const barScale = spring({ frame, fps, from: 0.8, to: 1, config: { damping: 15 } });
  const barOpacity = interpolate(frame, [0, 10], [0, 1], { extrapolateRight: "clamp" });

  // Results appear
  const results = [
    { store: "Kaufland", price: "€1.29", orig: "€2.89", best: true },
    { store: "Penny", price: "€1.69", orig: "€3.49", best: false },
    { store: "Lidl", price: "€1.79", orig: "€3.49", best: false },
    { store: "Aldi", price: "€1.89", orig: null, best: false },
  ];

  const foundTextOpacity = interpolate(frame, [85, 95], [0, 1], { extrapolateRight: "clamp" });

  return (
    <AbsoluteFill
      style={{
        backgroundColor: WHITE,
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        padding: "60px 50px",
      }}
    >
      {/* Search bar */}
      <div
        style={{
          width: "90%",
          background: "white",
          border: `5px solid ${BLACK}`,
          borderRadius: 40,
          padding: "28px 36px",
          marginBottom: 30,
          boxShadow: `8px 8px 0px rgba(26,28,28,0.15)`,
          display: "flex",
          alignItems: "center",
          gap: 16,
          transform: `scale(${barScale})`,
          opacity: barOpacity,
        }}
      >
        <span style={{ fontSize: 40 }}>🔍</span>
        <span style={{ fontSize: 42, fontWeight: 800, color: BLACK }}>
          {typedText}
          <span style={{ opacity: cursorBlink ? 1 : 0, color: GREEN }}>|</span>
        </span>
      </div>

      {/* Results */}
      {results.map((r, i) => {
        const delay = 55 + i * 12;
        const slideY = interpolate(frame, [delay, delay + 15], [60, 0], {
          extrapolateLeft: "clamp",
          extrapolateRight: "clamp",
          easing: Easing.out(Easing.cubic),
        });
        const opacity = interpolate(frame, [delay, delay + 10], [0, 1], {
          extrapolateRight: "clamp",
        });

        return (
          <div
            key={r.store}
            style={{
              width: "90%",
              background: r.best ? GREEN : "white",
              border: `4px solid ${BLACK}`,
              borderRadius: 28,
              padding: "22px 30px",
              marginBottom: 12,
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
              boxShadow: `5px 5px 0px rgba(26,28,28,0.12)`,
              transform: `translateY(${slideY}px)`,
              opacity,
              position: "relative",
            }}
          >
            {r.best && (
              <div
                style={{
                  position: "absolute",
                  top: -14,
                  right: 20,
                  background: BLACK,
                  color: "white",
                  fontSize: 18,
                  fontWeight: 900,
                  padding: "4px 16px",
                  borderRadius: 20,
                }}
              >
                🏆 CHEAPEST
              </div>
            )}
            <div>
              <div style={{ fontSize: 34, fontWeight: 800, color: r.best ? "white" : BLACK }}>
                {r.store}
              </div>
              <div
                style={{
                  fontSize: 22,
                  color: r.best ? "rgba(255,255,255,0.7)" : "rgba(26,28,28,0.4)",
                }}
              >
                Butter 250g
              </div>
            </div>
            <div style={{ textAlign: "right" }}>
              <div
                style={{
                  fontSize: 48,
                  fontWeight: 900,
                  color: r.best ? "white" : BLACK,
                }}
              >
                {r.price}
              </div>
              {r.orig && (
                <div
                  style={{
                    fontSize: 24,
                    textDecoration: "line-through",
                    color: r.best ? "rgba(255,255,255,0.5)" : "rgba(26,28,28,0.3)",
                  }}
                >
                  {r.orig}
                </div>
              )}
            </div>
          </div>
        );
      })}

      <div
        style={{
          fontSize: 36,
          fontWeight: 900,
          color: GREEN,
          marginTop: 20,
          opacity: foundTextOpacity,
        }}
      >
        ⚡ Found in 5 seconds
      </div>
    </AbsoluteFill>
  );
};

// ============================================================
// SCENE 4: CTA (11-15s, frames 330-450)
// ============================================================
const SceneCTA: React.FC = () => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const bgScale = spring({ frame, fps, from: 0, to: 1, config: { damping: 12 } });
  const urlScale = spring({ frame: frame - 15, fps, from: 0, to: 1, config: { damping: 10 } });
  const subOpacity = interpolate(frame, [30, 45], [0, 1], { extrapolateRight: "clamp" });
  const featOpacity = interpolate(frame, [45, 60], [0, 1], { extrapolateRight: "clamp" });

  // Pulse animation for CTA
  const pulse = interpolate(frame % 30, [0, 15, 30], [1, 1.03, 1]);

  return (
    <AbsoluteFill
      style={{
        backgroundColor: GREEN,
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        padding: "80px 60px",
        transform: `scale(${bgScale})`,
      }}
    >
      <div style={{ fontSize: 56, fontWeight: 900, color: "white", textAlign: "center", lineHeight: 1.2, marginBottom: 20 }}>
        Compare <span style={{ color: BLACK }}>ALL</span> grocery
        <br />
        prices in Germany
      </div>

      <div
        style={{
          fontSize: 72,
          fontWeight: 900,
          color: BLACK,
          background: "white",
          padding: "28px 70px",
          borderRadius: 60,
          border: `5px solid ${BLACK}`,
          boxShadow: `8px 8px 0px rgba(26,28,28,0.3)`,
          marginTop: 30,
          transform: `scale(${urlScale * pulse})`,
        }}
      >
        papierbox.eu
      </div>

      <div
        style={{
          fontSize: 34,
          fontWeight: 700,
          color: "rgba(255,255,255,0.65)",
          marginTop: 24,
          opacity: subOpacity,
        }}
      >
        100% Free · No Signup · No Ads
      </div>

      <div
        style={{
          marginTop: 40,
          opacity: featOpacity,
          display: "flex",
          flexDirection: "column",
          gap: 16,
          width: "80%",
        }}
      >
        {[
          "🔍  Search any product",
          "📍  Pick your German city",
          "💰  See cheapest price instantly",
          "🏪  Lidl · Aldi · Penny · Kaufland · Netto",
        ].map((feat, i) => {
          const fDelay = 50 + i * 8;
          const fOpacity = interpolate(frame, [fDelay, fDelay + 10], [0, 1], {
            extrapolateRight: "clamp",
          });
          const fX = interpolate(frame, [fDelay, fDelay + 10], [-30, 0], {
            extrapolateRight: "clamp",
            easing: Easing.out(Easing.cubic),
          });

          return (
            <div
              key={feat}
              style={{
                fontSize: 32,
                fontWeight: 700,
                color: "white",
                opacity: fOpacity,
                transform: `translateX(${fX}px)`,
              }}
            >
              {feat}
            </div>
          );
        })}
      </div>

      <div
        style={{
          position: "absolute",
          bottom: 60,
          fontSize: 28,
          fontWeight: 800,
          color: "rgba(255,255,255,0.4)",
        }}
      >
        Link in bio 👆
      </div>
    </AbsoluteFill>
  );
};

// ============================================================
// MAIN COMPOSITION
// ============================================================
export const PapierboxDemo: React.FC = () => {
  return (
    <AbsoluteFill style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", backgroundColor: WHITE }}>
      {/* Scene 1: Hook (0-3.5s) */}
      <Sequence from={0} durationInFrames={105}>
        <SceneHook />
      </Sequence>

      {/* Scene 2: Problem (3.5-7s) */}
      <Sequence from={105} durationInFrames={105}>
        <SceneProblem />
      </Sequence>

      {/* Scene 3: Solution (7-11s) */}
      <Sequence from={210} durationInFrames={120}>
        <SceneSolution />
      </Sequence>

      {/* Scene 4: CTA (11-15s) */}
      <Sequence from={330} durationInFrames={120}>
        <SceneCTA />
      </Sequence>
    </AbsoluteFill>
  );
};
