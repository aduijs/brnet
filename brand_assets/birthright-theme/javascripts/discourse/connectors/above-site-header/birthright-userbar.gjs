import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { settings } from "discourse/lib/theme-settings-store";
import { ajax } from "discourse/lib/ajax";

/**
 * Branded userbar — replaces .d-header .title with a B-mark + brand name.
 * Mounted in the above-site-header outlet so it sits inside the Discourse
 * header bar without competing with the standard nav.
 */
export default class BirthrightUserbar extends Component {
  @service router;
  @service site;

  get brandName() {
    return settings.brand_name || "Birthright.net";
  }

  get showBrand() {
    return settings.show_userbar_brand !== false;
  }

  @action
  goHome(e) {
    e?.preventDefault();
    this.router.transitionTo("discovery.categories");
  }

  <template>
    {{#if this.showBrand}}
      <a
        href="/"
        class="birthright-userbar"
        {{on "click" this.goHome}}
        aria-label="Birthright home"
      >
        <span class="br-userbar-mark">B</span>
        <span class="br-userbar-name">{{this.brandName}}</span>
      </a>
    {{/if}}
  </template>
}
