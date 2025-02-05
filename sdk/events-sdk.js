(function () {
  if (window.Events) return; // Prevent multiple instances

  window.Events = {
    init: function (config) {
      this.config = config || {};
      this.sessionId = this.generateSessionId();
      console.log("✅ Events Initialized with App ID:", this.config.appId);

      if (this.config.tracking !== false) {
        this.startTracking();
      }
    },

    generateSessionId: function () {
      return "TC-" + Math.random().toString(36).substr(2, 9);
    },

    startTracking: function () {
      console.log("🟢 Events is tracking user interactions...");

      document.addEventListener("click", (event) => {
        this.logEvent("click", event.target);
      });

      document.addEventListener("input", (event) => {
        this.logEvent("input", event.target, event.target.value);
      });

      window.addEventListener("hashchange", () => {
        this.logEvent("navigation", window.location.href);
      });
    },

    logEvent: function (eventType, target, value = null) {
      const eventData = {
        appId: this.config.appId,
        sessionId: this.sessionId,
        type: eventType,
        target: target.tagName + (target.id ? `#${target.id}` : ""),
        value: value,
        timestamp: new Date().toISOString(),
      };

      console.log("📡 Sending event:", eventData);
      fetch("https://verbose-xylophone-pjx9jpq67c6jj-3000.app.github.dev/api/events", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(eventData),
      }).catch((err) => console.error("❌ Events event send failed:", err));
    },
  };
})();
