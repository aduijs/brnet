import { apiInitializer } from "discourse/lib/api";
import { settings } from "discourse/lib/theme-settings-store";

/**
 * birthright-init — wires up the data-attributes that drive accent / hero
 * tokens in common.scss, and applies one-off DOM tweaks Discourse can't do
 * via plugin outlets.
 *
 * Targets Discourse 2026.5+ Glimmer renderer.
 *   - Uses apiInitializer (api version 1.39.0+).
 *   - Avoids legacy registerHelper / Mobile.* APIs.
 */

export default apiInitializer("1.39.0", (api) => {
  /* ---------- Apply tweakable settings as data-attrs on <html>/<body> ---------- */

  const applyAttrs = () => {
    const html = document.documentElement;
    const body = document.body;
    html.setAttribute("data-br-accent", settings.accent_color || "crimson");
    html.setAttribute("data-br-hero",   settings.hero_tint || "burgundy");
    body.setAttribute("data-br-hero-banner", String(settings.show_hero_banner !== false));
  };
  applyAttrs();

  /* ---------- Force navigation menu to header dropdown (defensive) ----------
     The site setting navigation_menu = "header dropdown" must be set, but if
     a sidebar slips through we collapse it via CSS too (see common.scss).
   --------------------------------------------------------------------------- */
  document.body.classList.add("birthright-theme-active");

  /* ---------- Heatmap / hot views — flag .views cells as "high" --------------
     Discourse renders the views count plain; we add a class when it crosses
     1000 so common.scss can color it gold.
   --------------------------------------------------------------------------- */
  api.modifyClass("component:topic-list-item", (Superclass) => class extends Superclass {
    @api.tracked _brHotViews;
    didInsertElement() {
      super.didInsertElement?.();
      const td = this.element?.querySelector("td.views .number");
      const v = parseInt(td?.dataset?.tooltip || td?.textContent || "0", 10);
      if (v >= 1000) this.element.classList.add("br-hot-views");
    }
  });

  /* ---------- "BR" badge on staff-flagged topics ----------
     A topic gets the badge if it's tagged "br-official" or pinned globally.
   ---------------------------------------------------------------------------- */
  api.addTopicListItemClassesCallback?.((topic) => {
    const tags = topic.tags || [];
    if (tags.includes("br-official") || topic.pinned_globally) return ["br-flagged"];
    return [];
  });

  /* ---------- Re-apply attrs when settings change live (admin tweaks) -------- */
  api.onAppEvent?.("theme-settings:changed", applyAttrs);

  /* ---------- Profile route — add gradient banner class ---------------------- */
  api.onPageChange((url) => {
    document.body.classList.toggle("br-profile-route", /^\/u\/[^/]+/.test(url));
  });
});
