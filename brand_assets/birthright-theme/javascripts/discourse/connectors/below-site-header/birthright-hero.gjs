import Component from "@glimmer/component";
import { service } from "@ember/service";
import { settings } from "discourse/lib/theme-settings-store";

/**
 * Hero banner — only renders on the categories landing page.
 * The banner is a CSS gradient by default; if `hero_image_url` is set in
 * theme settings, that image fills the .br-hero-img layer.
 */
export default class BirthrightHero extends Component {
  @service router;

  get isCategoriesRoute() {
    const r = this.router.currentRouteName || "";
    return r.startsWith("discovery.categories") || r === "discovery.latest";
  }

  get heroImageStyle() {
    const url = settings.hero_image_url;
    return url
      ? `background-image: url("${url}");`
      : "";
  }

  get hasImage() {
    return !!settings.hero_image_url;
  }

  get title() { return settings.hero_title || "BIRTHRIGHT"; }
  get subtitle() { return settings.hero_subtitle || "THE LEGACY OF KINGS"; }

  get show() {
    return settings.show_hero_banner !== false && this.isCategoriesRoute;
  }

  <template>
    {{#if this.show}}
      <div class="birthright-hero">
        <div
          class="br-hero-img {{if this.hasImage 'has-image'}}"
          style={{this.heroImageStyle}}
        ></div>
        <div class="br-hero-title-wrap">
          <h1 class="br-hero-title">{{this.title}}</h1>
          <div class="br-hero-sub">{{this.subtitle}}</div>
        </div>
      </div>
    {{/if}}
  </template>
}
